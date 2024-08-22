using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using joshcoWA.tenant;
using System.Text;
using System.Text.RegularExpressions;

namespace joshcoWA
{
    public partial class tenanthome : joshcoWA.BasePage
    {
        Regex _upperUrlEncodeRegex = new Regex(@"%[a-f0-9]{2}");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDashBoard();                           
            }
        }

        public void FillDashBoard()
        {
            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                showMessageBox("Your session is invalid! Please login and try again");
                return;
            }

            if (string.IsNullOrEmpty(Session["LeaseID"] as string))
            {
                lblErrorMessage.Visible = true;                           
                lblErrorMessage.Text = "There is no lease profile linked to your account. Please contact the technical support team for assistance!";
                divErrorMessage.Visible = true;
                lnkPay.Enabled = false;
                return;
            }

           
            lblErrorMessage.Text = "";
            lblErrorMessage.Visible = false;
            divErrorMessage.Visible = false;
            lnkPay.Enabled = true;

            clTenantHome th = new clTenantHome();
            DataTable dt = th.GetQueriesAndComplaintsTotals(Session["UserID"].ToString());
            if (dt.Rows.Count > 0)
            {

                this.lnkQueriesInProgress.Text = dt.Rows[0]["Total"].ToString();
                this.lnkQueriesClosed.Text = dt.Rows[1]["Total"].ToString();
                this.lnkComplaintsInProgress.Text = dt.Rows[2]["Total"].ToString();
                this.lnkComplaintsClosed.Text = dt.Rows[3]["Total"].ToString();
            }

            //Current rental
            DateTime dtDate = DateTime.Now;
            int iYear = dtDate.Year;
            int iMonth = dtDate.Month;
            int iFinancialYear = iMonth <= 3 ? iYear : iYear + 1;    
            DataTable tdCurrentMonthRentalStatement = th.GetStatementDetails(Session["LeaseID"].ToString(), iMonth, iFinancialYear);
            if (tdCurrentMonthRentalStatement.Rows.Count > 0)
            {
                this.lnkRentalDue.Text = String.IsNullOrEmpty(tdCurrentMonthRentalStatement.Rows[0]["AmountDue"].ToString()) ? "0" : String.Format("{0:0.00}", tdCurrentMonthRentalStatement.Rows[0]["AmountDue"]);                
            }

            DateTime CurrentMonthDueDate = tdCurrentMonthRentalStatement.Rows.Count > 0 && !String.IsNullOrEmpty(tdCurrentMonthRentalStatement.Rows[0]["DueDate"].ToString()) ? Convert.ToDateTime(tdCurrentMonthRentalStatement.Rows[0]["DueDate"]) : DateTime.Now;

            //30days
            DateTime ThirtyDays = CurrentMonthDueDate.AddDays(-30);            
            int ThirtyDaysYear = ThirtyDays.Year;
            int ThirtyDaysMonth = ThirtyDays.Month;
            int ThirtyDaysFinancialYear = ThirtyDaysMonth <= 3 ? ThirtyDaysYear : ThirtyDaysYear + 1;
            DataTable tdThirtyDaysRentalStatement = th.GetStatementDetails(Session["LeaseID"].ToString(), ThirtyDaysMonth, ThirtyDaysFinancialYear);
            if (tdThirtyDaysRentalStatement.Rows.Count > 0)
            {
                this.lnkThirtyDays.Text = String.IsNullOrEmpty(tdThirtyDaysRentalStatement.Rows[0]["AmountDue"].ToString()) ? "0" : String.Format("{0:0.00}", tdThirtyDaysRentalStatement.Rows[0]["AmountDue"]);
            }

            //60days 
            DateTime SixtyDays = CurrentMonthDueDate.AddDays(-60);            
            int SixtyDaysYear = SixtyDays.Year;
            int SixtyDaysMonth = SixtyDays.Month;
            int SixtyDaysFinancialYear = SixtyDaysMonth <= 3 ? SixtyDaysYear : SixtyDaysYear + 1;
            DataTable tdSixtyDaysRentalStatement = th.GetStatementDetails(Session["LeaseID"].ToString(), SixtyDaysMonth, SixtyDaysFinancialYear);
            if (tdSixtyDaysRentalStatement.Rows.Count > 0)
            {
                 this.lnkSixtyDays.Text = String.IsNullOrEmpty(tdSixtyDaysRentalStatement.Rows[0]["AmountDue"].ToString()) ? "0" : String.Format("{0:0.00}", tdSixtyDaysRentalStatement.Rows[0]["AmountDue"]);
             }

            //90 days can be improoved to sum up all previous totals
            DateTime NinetyDays = CurrentMonthDueDate.AddDays(-90);
            int NinetyDaysYear = NinetyDays.Year;
            int NinetyDaysMonth = NinetyDays.Month;
            int NinetyDaysFinancialYear = NinetyDaysMonth <= 3 ? NinetyDaysYear : NinetyDaysYear + 1;
            DataTable tdNinetyDaysRentalStatement = th.GetStatementDetails(Session["LeaseID"].ToString(), NinetyDaysMonth, NinetyDaysFinancialYear);
            if (tdNinetyDaysRentalStatement.Rows.Count > 0)
            {
               this.lnkNiteyDays.Text = String.IsNullOrEmpty(tdNinetyDaysRentalStatement.Rows[0]["AmountDue"].ToString()) ? "0" : String.Format("{0:0.00}", tdNinetyDaysRentalStatement.Rows[0]["AmountDue"]);
            }


            //TotalAmountDue
            DataTable tdRentalStatements = th.GetStatementDetails(Session["LeaseID"].ToString(), 0, 0);
            if (tdRentalStatements.Rows.Count > 0)
            {
                decimal TotalAmountDue = tdRentalStatements.AsEnumerable().Sum(row => row.Field<decimal>("AmountDue"));
                this.lnkTotalAmountDue.Text = Math.Round(TotalAmountDue, 2).ToString(); 
            }
        }

        protected void lnkPay_Click(object sender, EventArgs e)
        {
            decimal amt = Math.Round(decimal.Parse(lnkTotalAmountDue.Text), 0);

            long ticks = DateTime.Now.Ticks;
            byte[] bytes = BitConverter.GetBytes(ticks);
            string strReferenceNo = "OB" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

            if (String.IsNullOrEmpty(lnkTotalAmountDue.Text) || amt <= 0M)
            {
                showMessageBox(lnkTotalAmountDue.Text + " is an invalid payment amount. Therefore, we cannot proceed with this transaction");
                return;
            }

            if (Session["UserID"] == null)
            {
                showMessageBox("Your session has expired!. Please login and try again");
                return;
            }

            if (Session["LeaseID"] == null)
            {
                showMessageBox("Your session has expired!. Please login and try again");
                return;
            }

            clLeaseRent leaseRent = new clLeaseRent();
            DataTable dt = leaseRent.GetLeaseRentByLeaseID(Session["LeaseID"].ToString());


            if (dt.Rows.Count > 0)
            {
                string LeaseRentID = dt.Rows[0]["LeaseRentID"].ToString();
                try
                {
                    string site = bool.Parse(ConfigurationManager.AppSettings["IsPayFastLive"]) ? "https://www.payfast.co.za/eng/process?" : "https://sandbox.payfast.co.za/eng/process?";

                    // Build the query string for payment site
                    StringBuilder strHashed = new StringBuilder();

                    strHashed.AppendFormat("merchant_id={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["MerchantId"]));
                    strHashed.AppendFormat("merchant_key={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["MerchantKey"]));
                    if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PaymentReturnUrl"]))
                        strHashed.AppendFormat("return_url={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["PaymentReturnUrl"])); // Just thank the user and tell them you are processing their order (should already be done or take a few more seconds with ITN)
                    if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PaymentCancelUrl"]))
                        strHashed.AppendFormat("cancel_url={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["PaymentCancelUrl"])); // Just thank the user and tell them that they cancelled the order (encourage them to email you if they have problems paying
                    if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PaymentNotifyUrl"]))
                        strHashed.AppendFormat("notify_url={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["PaymentNotifyUrl"]));

                    if (!string.IsNullOrEmpty(strReferenceNo))
                        strHashed.AppendFormat("m_payment_id={0}&", UrlEncodeUpper(strReferenceNo));

                    strHashed.AppendFormat("amount={0}&", UrlEncodeUpper(amt.ToString()));
                    strHashed.AppendFormat("item_name={0}&", UrlEncodeUpper("Outstanding Balance"));
                    strHashed.AppendFormat("custom_str1={0}", UrlEncodeUpper(LeaseRentID));

                    string url = site + strHashed.ToString();
                    string signature = "&signature=" + GetMd5(strHashed.ToString());
                    Response.Redirect(url + signature.Trim(), false);

                }
                catch (Exception ex)
                {
                    showMessageBox(ex.Message);
                }
            }
        }

        private string GetMd5(string input)
        {
            StringBuilder sb = new StringBuilder();
            var hash = System.Security.Cryptography.MD5.Create().ComputeHash(Encoding.ASCII.GetBytes(input));
            for (int i = 0; i < hash.Length; i++)
                sb.Append(hash[i].ToString("x2"));
            return sb.ToString();
        }

        private string UrlEncodeUpper(string input)
        {
            string value = HttpUtility.UrlEncode(input);
            return _upperUrlEncodeRegex.Replace(value, m => m.Value.ToUpperInvariant());
        }

        protected void lnkQueriesInProgress_Click(object sender, EventArgs e)
        {
            Response.Redirect("tenantQueryList.aspx");
        }

        protected void lnkQueriesClosed_Click(object sender, EventArgs e)
        {
            Response.Redirect("tenantQueryList.aspx");
        }

        protected void lnkComplaintsInProgress_Click(object sender, EventArgs e)
        {
            Response.Redirect("tenantComplaintList.aspx");
        }

        protected void lnkComplaintsClosed_Click(object sender, EventArgs e)
        {

            Response.Redirect("tenantComplaintList.aspx");
        }
              
        protected void lnkRentalDue_Click(object sender, EventArgs e)
        {
            Response.Redirect("statement.aspx");
        }

        protected void lnkTotalAmountDue_Click(object sender, EventArgs e)
        {
            Response.Redirect("statement.aspx");
        }
    }
}
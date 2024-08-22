using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class paymentOutstandingBalance : joshcoWA.BasePage
    {
        Regex _upperUrlEncodeRegex = new Regex(@"%[a-f0-9]{2}");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                long ticks = DateTime.Now.Ticks;
                byte[] bytes = BitConverter.GetBytes(ticks);
                this.lblReferenceNo.Text = "OB" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');                         
                SetOutstandingBalance();
            }
        }


        public void SetOutstandingBalance()
        {
            clTenantHome th = new clTenantHome();
            DataTable tdRentalStatements = th.GetStatementDetails(Session["LeaseID"].ToString(), 0, 0);
            if (tdRentalStatements.Rows.Count > 0)
            {
                lblErrorMessage.Text = "";
                divErrorMessage.Visible = false;
                lblErrorMessage.Visible = false;
                lnkPay.Enabled = true;

                decimal TotalAmountDue = tdRentalStatements.AsEnumerable().Sum(row => row.Field<decimal>("AmountDue"));
                this.txtOutstandingBalance.Text = Math.Round(TotalAmountDue, 2).ToString();
            }
            else
            {
                lblErrorMessage.Visible = true;
                divErrorMessage.Visible = true;
                lblErrorMessage.Text = "There is no lease profile linked to your account.Therefore you cannot proceed with this transaction. Please contact the technical support team for assistance!";
                lnkPay.Enabled = false;
            }
        }



        protected void lnkPay_Click(object sender, EventArgs e)
        {
            decimal amt = Math.Round(decimal.Parse(txtOutstandingBalance.Text.Trim()), 0);

            if (String.IsNullOrEmpty(this.txtOutstandingBalance.Text) || amt <= 0M)
            {
                showMessageBox(this.txtOutstandingBalance.Text + " is an invalid payment amount. Therefore, we cannot proceed with this transaction");
                return;
            }

            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                showMessageBox("Your session is invalid! Please login and try again");
                return;
            }

            if (string.IsNullOrEmpty(Session["LeaseID"] as string))
            {
                showMessageBox("Your session is invalid! Please login and try again");
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

                    if (!string.IsNullOrEmpty(this.lblReferenceNo.Text))
                        strHashed.AppendFormat("m_payment_id={0}&", UrlEncodeUpper(this.lblReferenceNo.Text));

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
    }
}
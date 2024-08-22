using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;


using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Text.RegularExpressions;
using joshcoWA.tenant;

namespace joshcoWA.applicant
{
    public partial class ApplicationDetails : System.Web.UI.Page
    {
        Regex _upperUrlEncodeRegex = new Regex(@"%[a-f0-9]{2}");

        clLeaseRentPaid lrp = new clLeaseRentPaid();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["ApplicationID"] = 2;

            if (Session["ApplicationID"] == null)
            {
                Response.Redirect("../SearchApplication.aspx?s=e");
                return;
            }

            if (!IsPostBack)
            {
                this.lblName.Text = Session["FullName"].ToString();
                GetApplicationProfile();

                //Check if Deposit has been paid. Make Panel1 visible
                //if ((Convert.ToDouble(lblDepositRequired.Text) <= 0))
                //{
                //    Panel1.Visible = true;
                //}

                //Get lease by application ID
                //DataTable dtLeaseId = lrp.GetLeaseIdByApplicationID(Session["ApplicationID"].ToString());              
                //if (dtLeaseId.Rows.Count > 0)
                //{
                //    Panel1.Visible = false;
                //    flUpload.Visible = false;
                //    Upload.Visible = false;                                     
                //}

            }
        }

        //
        private void GetApplicationProfile()
        {
            clPayFastDepositPayment th = new clPayFastDepositPayment();
            DataTable dt = th.GetApplicationProfile(Session["ApplicationID"].ToString());
            if (dt.Rows.Count > 0)
            {
                //ApplicationApproved
                if (dt.Rows[0]["ApplicationApproved"].ToString() == "Yes")
                {
                    pnlPayfastDepositPayment.Visible = true;

                    var depositRequired = dt.Rows[0]["DepositRequired"].ToString();
                    var depositAmount = dt.Rows[0]["DepositAmount"].ToString();

                    this.lblDepositRequired.Text = String.Format("{0:0.00}", dt.Rows[0]["DepositRequired"]);

                    if (!string.IsNullOrWhiteSpace(depositRequired) &&
                     !string.IsNullOrWhiteSpace(depositAmount))
                    {
                        var dr = Convert.ToDecimal(depositRequired);
                        var da = Convert.ToDecimal(depositAmount);

                        this.lblDepositRequired.Text = (dr - da).ToString("0.00");
                    }
                }
            }
        }


        protected void btnPayDeposit_Click(object sender, EventArgs e)
        {
            decimal amt = Math.Round(decimal.Parse(lblDepositRequired.Text), 0);

            long ticks = DateTime.Now.Ticks;
            byte[] bytes = BitConverter.GetBytes(ticks);
            string strReferenceNo = "DE" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

            if (String.IsNullOrEmpty(lblDepositRequired.Text) || amt <= 0M)
            {
                showMessageBox(lblDepositRequired.Text + " is an invalid payment amount. Therefore, we cannot proceed with this transaction");
                return;
            }

            if (Session["ApplicationID"] == null)
            {
                showMessageBox("Your session has expired!. Please login and try again");
                return;
            }

            string ApplicationID = Session["ApplicationID"].ToString();

            try
            {
                string site = bool.Parse(ConfigurationManager.AppSettings["IsPayFastLive"]) ? "https://www.payfast.co.za/eng/process?" : "https://sandbox.payfast.co.za/eng/process?";

                // Build the query string for payment site
                StringBuilder strHashed = new StringBuilder();

                strHashed.AppendFormat("merchant_id={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["MerchantId"]));
                strHashed.AppendFormat("merchant_key={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["MerchantKey"]));
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PaymentDepositReturnUrl"]))
                    strHashed.AppendFormat("return_url={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["PaymentDepositReturnUrl"])); // Just thank the user and tell them you are processing their order (should already be done or take a few more seconds with ITN)
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PaymentDepositCancelUrl"]))
                    strHashed.AppendFormat("cancel_url={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["PaymentDepositCancelUrl"])); // Just thank the user and tell them that they cancelled the order (encourage them to email you if they have problems paying
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PaymentDepositNotifyUrl"]))
                    strHashed.AppendFormat("notify_url={0}&", UrlEncodeUpper(ConfigurationManager.AppSettings["PaymentDepositNotifyUrl"]));



                if (!string.IsNullOrEmpty(strReferenceNo))
                    strHashed.AppendFormat("m_payment_id={0}&", UrlEncodeUpper(strReferenceNo));

                strHashed.AppendFormat("amount={0}&", UrlEncodeUpper(amt.ToString()));
                strHashed.AppendFormat("item_name={0}&", UrlEncodeUpper("Application Deposit"));
                strHashed.AppendFormat("custom_str1={0}", UrlEncodeUpper(ApplicationID));

                string url = site + strHashed.ToString();
                string signature = "&signature=" + GetMd5(strHashed.ToString());
                Response.Redirect(url + signature.Trim(), false);
            }
            catch (Exception ex)
            {
                showMessageBox(ex.Message);
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

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void Upload_Click(object sender, EventArgs e)
        {

            if (Session["ApplicationID"] == null)
            {
                Response.Redirect("../SearchApplication.aspx?s=e");
                return;
            }

           
            DataTable dtLeaseId = lrp.GetLeaseIdByApplicationID(Session["ApplicationID"].ToString());

            String LeaseID = null;
            if (dtLeaseId.Rows.Count > 0)
            {
                LeaseID = dtLeaseId.Rows[0]["LeaseID"].ToString();
            }

            HttpPostedFile file = flUpload.PostedFile;
            if (file.ContentLength > 0)
            {
                int size = file.ContentLength;
                string name = file.FileName;
                int position = name.LastIndexOf("\\");
                name = name.Substring(position + 1);
                string contentType = file.ContentType;
                byte[] fileData = new byte[size];
                file.InputStream.Read(fileData, 0, size);

                //Entity catergory needs attenton
                SaveFile(name, contentType, size, fileData, LeaseID, "1");
            }

            showMessageBox("Signed Lease Agreement Form uploaded successfuly");
        }


        public void SaveFile(string name, string contentType, int size, byte[] data, string LeaseID, string CategoryID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Insert into [LeaseDocument]([DocumentName], [ContentType], [Size], [Data], [LeaseID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @LeaseID, @DocumentCategoryID)", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@LeaseID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = LeaseID;
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = CategoryID;
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }
        }

        //protected void lnkSignedLeaseAgreementForm_Click(object sender, EventArgs e)
        //{

        //    if (Session["ApplicationID"] == null)
        //    {
        //        Response.Redirect("../SearchApplication.aspx?s=e");
        //        return;
        //    }

        //    DataTable dtLeaseId = lrp.GetLeaseIdByApplicationID(Session["ApplicationID"].ToString());

        //    String LeaseID = null;
        //    if (dtLeaseId.Rows.Count > 0)
        //    {
        //        LeaseID = dtLeaseId.Rows[0]["LeaseID"].ToString();
        //    }

        //    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
        //    {
        //        connection.Open();
        //        using (SqlCommand command = new SqlCommand("Select * from [LeaseDocument] Where LeaseID = @LeaseID", connection))
        //        {
        //            command.Parameters.AddWithValue("@LeaseID", LeaseID);
        //            SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
        //            if (reader.HasRows)
        //            {
        //                reader.Read();
        //                byte[] content = reader["Data"] as byte[];
        //                string filename = reader["DocumentName"].ToString();
        //                Response.Clear();
        //                Response.ClearContent();
        //                Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
        //                Response.AddHeader("Content-Length", content.Length.ToString());
        //                Response.OutputStream.Write(content, 0, content.Length);
        //                Response.End();
        //            }
        //        }
        //    }



        //}
    }
}
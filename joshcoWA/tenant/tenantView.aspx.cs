using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class tenantView : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillProfile();
            }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsTenantProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                //this.lblFullName.Text = dt.Rows[0]["FullName"].ToString();
                //this.lblEmail.Text = dt.Rows[0]["EmailAddress"].ToString();


                this.lblName.Text = dt.Rows[0]["Name"].ToString();
                this.lblSurname.Text = dt.Rows[0]["Surname"].ToString();
                this.lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
                this.lblIDNumber.Text = dt.Rows[0]["IDNumber"].ToString();
                this.lblGender.Text = dt.Rows[0]["Gender"].ToString();
                this.lblTelephone.Text = dt.Rows[0]["Telephone"].ToString();
                this.lblCellNo.Text = dt.Rows[0]["Mobile"].ToString();
                this.lblFaxNo.Text = dt.Rows[0]["Fax"].ToString();
                this.lblEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                this.lblPostalAddress.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["AddressCode"].ToString();
                this.lblPhysicalAddress.Text = dt.Rows[0]["PhysicalAddress"].ToString() + ", " + dt.Rows[0]["PhysicalAddressCode"].ToString();

                this.txtAccountReference.Text = dt.Rows[0]["AccountReference"].ToString();
                this.txtAccountName.Text = dt.Rows[0]["AccountName"].ToString();
                this.rblAccountActive.SelectedValue = dt.Rows[0]["AccountActive"].ToString();
                this.rblDeleteThisAccount.SelectedValue = dt.Rows[0]["DeleteThisAccount"].ToString();
                this.rblBankingDetailType.SelectedValue = dt.Rows[0]["BankingDetailType"].ToString();
                this.txtBankAccountName.Text = dt.Rows[0]["BankAccountName"].ToString();
                this.rblBankAccountType.SelectedValue = dt.Rows[0]["BankAccountType"].ToString();
                this.txtBankAccountBranch.Text = dt.Rows[0]["BankAccountBranch"].ToString();

                this.txtBankAccountNumber.Text = dt.Rows[0]["BankAccountNumber"].ToString();
                this.txtCreditCardHolder.Text = dt.Rows[0]["CreditCardHolder"].ToString();
                this.rblCreditCardType.SelectedValue = dt.Rows[0]["CreditCardType"].ToString();
                this.txtExpiryMonth.Text = dt.Rows[0]["ExpiryMonth"].ToString();
                this.txtExpiryYear.Text = dt.Rows[0]["ExpiryYear"].ToString();
                this.txtMaskedCreditCardNumber.Text = dt.Rows[0]["MaskedCreditCardNumber"].ToString();
                this.txtDebitAmount.Text = dt.Rows[0]["DebitAmount"].ToString();
                this.txtEmailAddress.Text = dt.Rows[0]["CreditCardEmailAddress"].ToString();
                this.txtMobileNumber.Text = dt.Rows[0]["CreditCardMobileNumber"].ToString();
                if (dt.Rows[0]["BankingDetailType"].ToString() == "1")
                {
                    this.pnkBankAccount.Visible = true;
                    this.pnlCreditCard.Visible = false;
                }
                else if (dt.Rows[0]["BankingDetailType"].ToString() == "2")
                {
                    this.pnkBankAccount.Visible = false;
                    this.pnlCreditCard.Visible = true;
                }
            }


            if (string.IsNullOrEmpty(Session["TenantID"] as string))
            {
                showMessageBox("TenantID is Invalid! Please login and try again");
                this.gvPaymentHistory.DataBind();
                return;
            }

            clLeaseRentPaid lrp = new clLeaseRentPaid();
            DataTable dtLeaseId = lrp.GetLeaseIdByTenantID(Session["TenantID"].ToString());

            String LeaseID = null;
            if (dtLeaseId.Rows.Count > 0)
            {
                LeaseID = dtLeaseId.Rows[0]["LeaseID"].ToString();
            }

            DataTable dtLeaseRentPaid = lrp.GetLeaseRentPaidListByLeaseID(LeaseID);
            this.gvPaymentHistory.DataSource = dtLeaseRentPaid;
            this.gvPaymentHistory.DataBind();
        }

        protected void lnkUpload_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = this.FileUpload1.PostedFile;
            if (file.ContentLength > 0)
            {
                int size = file.ContentLength;
                string name = file.FileName;
                int position = name.LastIndexOf("\\");
                name = name.Substring(position + 1);
                string contentType = file.ContentType;
                byte[] fileData = new byte[size];
                file.InputStream.Read(fileData, 0, size);

                SaveFile(name, contentType, size, fileData);
            }
        }

        public void SaveFile(string name, string contentType, int size, byte[] data)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Insert into [TenantDocument]([DocumentName], [ContentType], [Size], [Data], [TenantID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @TenantID, @DocumentCategoryID)", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@TenantID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = Session["TenantID"].ToString();
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = "1";
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }

            this.GridView2.DataBind();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [TenantDocument] Where TenantDocumentID = @TenantDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@TenantDocumentID", e.CommandArgument.ToString());
                        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                        if (reader.HasRows)
                        {
                            reader.Read();
                            byte[] content = reader["Data"] as byte[];
                            string filename = reader["DocumentName"].ToString();
                            Response.Clear();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.AddHeader("Content-Length", content.Length.ToString());
                            Response.OutputStream.Write(content, 0, content.Length);
                            Response.End();
                        }
                    }
                }
            }
        }

        public void HtmlAnchorDeleteDoc_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfTenantDocumentID = (HiddenField)row.FindControl("hfTenantDocumentID");

            this.sdsDocument.DeleteParameters["TenantDocumentID"].DefaultValue = hfTenantDocumentID.Value;
            this.sdsDocument.Delete();

            this.GridView2.DataBind();
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("../lease/LeaseProfile.aspx");
            }
        }

        protected void rblBankingDetailType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblBankingDetailType.SelectedValue == "1")
            {
                this.pnkBankAccount.Visible = true;
                this.pnlCreditCard.Visible = false;
            }
            else if (rblBankingDetailType.SelectedValue == "2")
            {
                this.pnkBankAccount.Visible = false;
                this.pnlCreditCard.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.sdsBankAccount.UpdateParameters["AccountReference"].DefaultValue = this.txtAccountReference.Text;
            this.sdsBankAccount.UpdateParameters["AccountName"].DefaultValue = this.txtAccountName.Text;
            this.sdsBankAccount.UpdateParameters["AccountActive"].DefaultValue = this.rblAccountActive.SelectedValue;
            this.sdsBankAccount.UpdateParameters["DeleteThisAccount"].DefaultValue = this.rblDeleteThisAccount.SelectedValue;
            this.sdsBankAccount.UpdateParameters["BankingDetailType"].DefaultValue = this.rblBankingDetailType.SelectedValue;
            this.sdsBankAccount.UpdateParameters["BankAccountName"].DefaultValue = this.txtBankAccountName.Text;
            this.sdsBankAccount.UpdateParameters["BankAccountType"].DefaultValue = this.rblBankAccountType.SelectedValue;
            this.sdsBankAccount.UpdateParameters["BankAccountBranch"].DefaultValue = this.txtBankAccountBranch.Text;
            this.sdsBankAccount.UpdateParameters["Filler"].DefaultValue = "0";
            this.sdsBankAccount.UpdateParameters["BankAccountNumber"].DefaultValue = this.txtBankAccountNumber.Text;
            this.sdsBankAccount.UpdateParameters["TenantID"].DefaultValue = Session["TenantID"].ToString();
            this.sdsBankAccount.Update();
            showMessageBox("Updated successfully");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.sdsCreditCard.UpdateParameters["AccountReference"].DefaultValue = this.txtAccountReference.Text;
            this.sdsCreditCard.UpdateParameters["AccountName"].DefaultValue = this.txtAccountName.Text;
            this.sdsCreditCard.UpdateParameters["AccountActive"].DefaultValue = this.rblAccountActive.SelectedValue;
            this.sdsCreditCard.UpdateParameters["DeleteThisAccount"].DefaultValue = this.rblDeleteThisAccount.SelectedValue;
            this.sdsCreditCard.UpdateParameters["BankingDetailType"].DefaultValue = this.rblBankingDetailType.SelectedValue;

            this.sdsCreditCard.UpdateParameters["CreditCardHolder"].DefaultValue = this.txtCreditCardHolder.Text;
            this.sdsCreditCard.UpdateParameters["CreditCardType"].DefaultValue = this.rblCreditCardType.SelectedValue;
            this.sdsCreditCard.UpdateParameters["ExpiryMonth"].DefaultValue = this.txtExpiryMonth.Text;
            this.sdsCreditCard.UpdateParameters["ExpiryYear"].DefaultValue = this.txtExpiryYear.Text;
            this.sdsCreditCard.UpdateParameters["MaskedCreditCardNumber"].DefaultValue = this.txtMaskedCreditCardNumber.Text;
            this.sdsCreditCard.UpdateParameters["DebitAmount"].DefaultValue = this.txtDebitAmount.Text;
            this.sdsCreditCard.UpdateParameters["CreditCardEmailAddress"].DefaultValue = this.txtEmailAddress.Text;
            this.sdsCreditCard.UpdateParameters["CreditCardMobileNumber"].DefaultValue = this.txtMobileNumber.Text;
            this.sdsCreditCard.UpdateParameters["TenantID"].DefaultValue = Session["TenantID"].ToString();
            this.sdsCreditCard.Update();
            showMessageBox("Updated successfully");
        }
    }
}
using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.CRM
{
    public partial class addComplaint : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                long ticks = DateTime.Now.Ticks;
                byte[] bytes = BitConverter.GetBytes(ticks);
                string id = "COM" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

                this.lblReferenceNo.Text = id;
                this.lblRefNo.Text = id;

                //GetQueryCategory();
            }
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        //public void GetQueryCategory()
        //{
        //    csClientQuery cq = new csClientQuery();
        //    DataTable dt = cq.GetQueryCategory();

        //    if (dt.Rows.Count > 0)
        //    {
        //        this.ddlQueryItem.DataSource = dt;
        //        this.ddlQueryItem.DataTextField = "QueryCategory";
        //        this.ddlQueryItem.DataValueField = "QueryCategoryID";
        //        this.ddlQueryItem.DataBind();
        //    }
        //}

        public void SendNotification(string emailAddress, string name, string Ref, string tenantId)
        {
            clSendEmail sendmail = new clSendEmail();

            string mailbody = "";
            mailbody += "Your complaint was received successfully </br></br>";
            mailbody += "Query Ref: " + Ref + "</br>";
            mailbody += "Date: " + DateTime.Now.ToLongDateString() + "</br></br>";

            sendmail.SendMail(emailAddress, name, "Joshco Complaint Ref: " + Ref, mailbody, "","Complaint", tenantId);
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            int QueryID = 0;

            csClientQuery cq = new csClientQuery();
            if (this.ddlPropertyUnit.SelectedValue == "0")
            {
                showMessageBox("Please select a property unit");
                return;
            }

            if (this.ddlSubCategory.SelectedValue == "0" || this.ddlSubCategory.SelectedValue=="")
            {
                showMessageBox("Please select a category and sub category");
                return;
            }


            QueryID = cq.AddClientComplaint(this.lblReferenceNo.Text, this.ddlPropertyUnit.SelectedValue, Session["UserID"].ToString(), this.ddlQueryItem.SelectedValue, this.ddlSubCategory.SelectedValue, this.txtDescription.Text, this.ddlSeverity.SelectedValue);
            lblQuerydescription.Text = txtDescription.Text;
            lblProperty.Text = ddlProperty.SelectedItem.Text + " Unit Number: " + ddlPropertyUnit.SelectedValue;
            lblSeverity.Text = ddlSeverity.SelectedItem.Text;
            lblCategory.Text = ddlQueryItem.SelectedItem.Text;

            cq.UpdateComplaintStatus(QueryID.ToString(), "New");
 

            if (flUpload.HasFiles)
            {
                foreach (HttpPostedFile uploadedFile in flUpload.PostedFiles)
                {

                    int size = uploadedFile.ContentLength;
                    string name = uploadedFile.FileName;
                    int position = name.LastIndexOf("\\");
                    name = name.Substring(position + 1);
                    string contentType = uploadedFile.ContentType;
                    byte[] fileData = new byte[size];
                    uploadedFile.InputStream.Read(fileData, 0, size);
                    //string QueryID = Session["QueryID"].ToString();

                    SaveFile(name, contentType, size, fileData, "1", QueryID.ToString());

                }
            }


            try
            {
                DataView dv;
                dv = (DataView)this.sdsTenant.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count > 0)
                {
                    SendNotification(dt.Rows[0]["EmailAddress"].ToString(), dt.Rows[0]["LesseeName"].ToString(), this.lblReferenceNo.Text, dt.Rows[0]["TenantID"].ToString());
                }
            }
            catch { }


            //GridView parentPanel = this.Parent.FindControl("gvQuery") as GridView;
            //parentPanel.DataBind();

            //this.btnClos.PostBackUrl = this.lbClear.PostBackUrl;
            this.mpeLeaseAdd.Show();

            Response.Redirect("complaintList.aspx");
        }

        public void SaveFile(string name, string contentType, int size, byte[] data, string CategoryID, string QueryID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Insert into [ComplaintDocument]([DocumentName], [ContentType], [Size], [Data], [ComplaintID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @ComplaintID, @DocumentCategoryID)", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@ComplaintID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = QueryID;
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = CategoryID;
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }
        }


        protected void lnkUpload_Click(object sender, EventArgs e)
        {

        }

        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlPropertyUnit.Items.Clear();
            this.ddlPropertyUnit.DataBind();
        }

        protected void ddlQueryItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlSubCategory.Items.Clear();
            this.ddlSubCategory.DataBind();

        }
    }
}
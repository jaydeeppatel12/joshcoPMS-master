using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.IO;

namespace joshcoWA.tenant
{
    public partial class complaintView : joshcoWA.BasePage
    {
        static string ID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ID = Request.QueryString["ID"].ToString();

                UpdateClientStatus(ID);
                GetComplaintComments();
            }

        }
        public void UpdateClientStatus(string ID)
        {
            csClientQuery cq = new csClientQuery();
            DataTable dt = cq.GetComplaintDetails(ID);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    this.lblReferenceNo.Text = row["ReferenceNo"].ToString();
                    this.lblQueryItem.Text = row["ComplaintCategory"].ToString();
                    this.lblComplaintSubCategory.Text = row["ComplaintSubCategory"].ToString();
                    this.lblProperty.Text = row["PropertyName"].ToString();
                    this.lblPropertyUnit.Text = row["PropertyUnit"].ToString();
                    this.lblQueryDescription.Text = row["ComplaintDescription"].ToString();
                    this.lblSeverity.Text = row["Severity"].ToString();
                    this.lblTenant.Text = row["Tenant"].ToString();
                    this.lblStatus.Text = row["Status"].ToString();

                    if (row["Rating"].ToString() != "")
                    {
                        this.rblRating.SelectedValue = row["Rating"].ToString();
                    }

                    if (row["Status"].ToString() == "Completed")
                    {
                        this.pnlRating.Visible = true;
                    }

                }
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [ComplaintDocument] Where ComplaintDocumentID = @ComplaintDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@ComplaintDocumentID", e.CommandArgument.ToString());
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

        protected void rblRating_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SqlDataSource1.UpdateParameters["Rating"].DefaultValue = this.rblRating.SelectedValue;
            this.SqlDataSource1.UpdateParameters["ComplaintID"].DefaultValue = Request.QueryString["ID"].ToString();
            this.SqlDataSource1.Update();

            showMessageBox("Submitted successfully");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var comment = this.txtComment.Value;
            if (string.IsNullOrWhiteSpace(comment))
            {
                return;
            }
            var complaintID = Request.QueryString["ID"].ToString();
            var userID = Session["UserID"].ToString();
            csClientQuery cq = new csClientQuery();
            cq.AddComplaintComment(comment, complaintID, userID);

            Response.Redirect(Request.RawUrl);
        }

        public void GetComplaintComments()
        {
            csClientQuery cq = new csClientQuery();
            DataTable dt = cq.GetComplaintComments(ID);

            this.gvComments.DataSource = dt;
            this.gvComments.DataBind();
        }
    }
}
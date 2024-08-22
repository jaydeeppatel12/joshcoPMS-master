using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;

namespace joshcoWA
{
    public partial class appFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["ApplicationID"] = 1;

            if (Session["ApplicationID"] == null)
            {
                Response.Redirect("SearchApplication.aspx?s=e");
                return;
            }

            if (!IsPostBack)
            {

                FillProfile();
            }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsApplicationProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                hfApplicationSuccessful.Value = dt.Rows[0]["ApplicationSuccessful"].ToString();
            }
        }

        public void HtmlAnchorDeleteDoc_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfApplicationDocumentID = (HiddenField)row.FindControl("hfApplicationDocumentID");

            this.sdsDocument.DeleteParameters["ApplicationDocumentID"].DefaultValue = hfApplicationDocumentID.Value;
            this.sdsDocument.Delete();
            this.GridView2.DataBind();
        }
        protected void gvDoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    ((Label)e.Row.FindControl("hfRowID")).Text = e.Row.RowIndex.ToString();
                }
                catch { }

                if (this.hfApplicationSuccessful.Value != "0")
                {
                    ((System.Web.UI.HtmlControls.HtmlAnchor)e.Row.FindControl("remove")).Visible = false;
                }
                else
                {
                    if (((HiddenField)e.Row.FindControl("hfDocumentCategoryID")).Value == "10")
                    {
                        e.Row.Visible = false;
                    }
                }
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                this.sdsDocument.DeleteParameters["ApplicationDocumentID"].DefaultValue = e.CommandArgument.ToString();
                this.sdsDocument.Delete();
                this.GridView2.DataBind();
            }

            if (e.CommandName == "Upload")
            {
                Button btn = (Button)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                HttpPostedFile file = ((System.Web.UI.WebControls.FileUpload)row.FindControl("fuAppUpload")).PostedFile;

                if (file.ContentLength > 0)
                {
                    int size = file.ContentLength;
                    string name = file.FileName;
                    int position = name.LastIndexOf("\\");
                    name = name.Substring(position + 1);
                    string contentType = file.ContentType;
                    byte[] fileData = new byte[size];
                    file.InputStream.Read(fileData, 0, size);

                    SaveFile(e.CommandArgument.ToString(), name, contentType, size, fileData);

                    showMessageBox("Uploaded successfully");
                }
            }

            if (e.CommandName == "Refresh")
            {
                Button btn = (Button)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);
                row.DataBind();
            }

            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [ApplicationDocument] Where ApplicationDocumentID = @ApplicationDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@ApplicationDocumentID", e.CommandArgument.ToString());
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

        public void SaveFile(string DocumentCategoryID, string name, string contentType, int size, byte[] data)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Insert into [ApplicationDocument]([DocumentName], [ContentType], [Size], [Data], [ApplicationID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @ApplicationID, @DocumentCategoryID)", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@ApplicationID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = Session["ApplicationID"].ToString();
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = DocumentCategoryID;
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }

            this.GridView2.DataBind();
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }


    }
}
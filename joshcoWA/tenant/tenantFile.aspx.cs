 
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

namespace joshcoWA
{
    public partial class tenantFile : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }

        protected void gvDoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    try
            //    {
            //        ((Label)e.Row.FindControl("hfRowID")).Text = e.Row.RowIndex.ToString();
            //    }
            //    catch { }

            //    if (this.hfApplicationSuccessful.Value != "0")
            //    {
            //        ((System.Web.UI.HtmlControls.HtmlAnchor)e.Row.FindControl("remove")).Visible = false;
            //    }
            //    else
            //    {
            //        if (((HiddenField)e.Row.FindControl("hfDocumentCategoryID")).Value == "10")
            //        {
            //            e.Row.Visible = false;
            //        }
            //    }
            //}
        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "Upload")
            //{
            //    Button btn = (Button)e.CommandSource;
            //    GridViewRow row = (GridViewRow)(btn.NamingContainer);

            //    HttpPostedFile file = ((FileUpload)row.FindControl("fuAppUpload")).PostedFile;

            //    if (file.ContentLength > 0)
            //    {
            //        int size = file.ContentLength;
            //        string name = file.FileName;
            //        int position = name.LastIndexOf("\\");
            //        name = name.Substring(position + 1);
            //        string contentType = file.ContentType;
            //        byte[] fileData = new byte[size];
            //        file.InputStream.Read(fileData, 0, size);

            //        if (Session["ApplicantID"] == null)
            //        {
            //            ((HiddenField)row.FindControl("hfUploadDocumentCategoryID")).Value = e.CommandArgument.ToString();
            //            ((HiddenField)row.FindControl("hfUploadname")).Value = name;
            //            ((HiddenField)row.FindControl("hfUploadcontentType")).Value = contentType;
            //            ((HiddenField)row.FindControl("hfUploadsize")).Value = size.ToString();
            //            ((HiddenField)row.FindControl("hfUploadfileData")).Value = fileData.ToString();

            //            ((System.Web.UI.WebControls.FileUpload)row.FindControl("fuAppUpload")).Visible = false;
            //            ((LinkButton)row.FindControl("lnkDocumentName")).Visible = true;
            //            ((LinkButton)row.FindControl("lnkDocumentName")).Text = name;
            //            ((Label)row.FindControl("lblRequired")).Text = "*";
            //            ((LinkButton)row.FindControl("lnkDeleteDoc")).Visible = true;
            //            ((Button)row.FindControl("btnAppUpload")).Visible = false;
            //        }
            //        else
            //        {
            //            SaveFile(e.CommandArgument.ToString(), name, contentType, size, fileData);

            //            showMessageBox("Uploaded successfully");
            //        }
            //    }
            //}

            //if (e.CommandName == "UploadAll")
            //{
            //    foreach (GridViewRow row in this.GridView.Rows)
            //    {
            //        if (((HiddenField)row.FindControl("hfUploadname")).Value == "")
            //        {
            //            HttpPostedFile file = ((FileUpload)row.FindControl("fuAppUpload")).PostedFile;

            //            if (file.ContentLength > 0)
            //            {
            //                int size = file.ContentLength;
            //                string name = file.FileName;
            //                int position = name.LastIndexOf("\\");
            //                name = name.Substring(position + 1);
            //                string contentType = file.ContentType;
            //                byte[] fileData = new byte[size];
            //                file.InputStream.Read(fileData, 0, size);

            //                if (Session["ApplicantID"] == null)
            //                {
            //                    ((HiddenField)row.FindControl("hfUploadDocumentCategoryID")).Value = ((HiddenField)row.FindControl("hfDocumentCategoryID")).Value;
            //                    ((HiddenField)row.FindControl("hfUploadname")).Value = name;
            //                    ((HiddenField)row.FindControl("hfUploadcontentType")).Value = contentType;
            //                    ((HiddenField)row.FindControl("hfUploadsize")).Value = size.ToString();
            //                    ((HiddenField)row.FindControl("hfUploadfileData")).Value = fileData.ToString();

            //                    ((System.Web.UI.WebControls.FileUpload)row.FindControl("fuAppUpload")).Visible = false;
            //                    ((LinkButton)row.FindControl("lnkDocumentName")).Visible = true;
            //                    ((LinkButton)row.FindControl("lnkDocumentName")).Text = name;
            //                    ((Label)row.FindControl("lblRequired")).Text = "*";
            //                    ((LinkButton)row.FindControl("lnkDeleteDoc")).Visible = true;
            //                    ((Button)row.FindControl("btnAppUpload")).Visible = false;
            //                    ((System.Web.UI.WebControls.FileUpload)row.FindControl("fuAppUpload")).Dispose();
            //                }
            //                else
            //                {
            //                    SaveFile(((HiddenField)row.FindControl("hfDocumentCategoryID")).Value, name, contentType, size, fileData);

            //                    showMessageBox("Uploaded successfully");
            //                }
            //            }
            //        }
            //    }
            //}


            //if (e.CommandName == "Refresh")
            //{
            //    Button btn = (Button)e.CommandSource;
            //    GridViewRow row = (GridViewRow)(btn.NamingContainer);
            //    row.DataBind();
            //}

            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [ApplicantDocument] Where ApplicantDocumentID = @ApplicantDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@ApplicantDocumentID", e.CommandArgument.ToString());
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
            //    System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            //    GridViewRow row = (GridViewRow)(btn.NamingContainer);
            //    HiddenField hfApplicationDocumentID = (HiddenField)row.FindControl("hfApplicationDocumentID");

            //    this.SqlDataSource1.DeleteParameters["ApplicationDocumentID"].DefaultValue = hfApplicationDocumentID.Value;
            //    this.SqlDataSource1.Delete();
            //    this.GridView.DataBind();
        }

        public void SaveFile(string DocumentCategoryID, string name, string contentType, int size, byte[] data)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Insert into [ApplicantDocument]([DocumentName], [ContentType], [Size], [Data], [ApplicantID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @ApplicantID, @DocumentCategoryID)", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@ApplicantID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = Session["ApplicantID"].ToString();
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = DocumentCategoryID;
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }

            this.GridView.DataBind();
        }
    }
}
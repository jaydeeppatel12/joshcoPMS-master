using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace joshcoWA
{
    public partial class inspectionItemDocument : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lnkUpload_Click(object sender, EventArgs e)
        {
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
                    string InspectionID = Session["InspectionID"].ToString();

                    SaveFile(name, contentType, size, fileData, "2", InspectionID);

                }
            }
        }

        public void SaveFile(string name, string contentType, int size, byte[] data, string CategoryID, string PropertyInspectionID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Insert into [InspectionDocument]([DocumentName], [ContentType], [Size], [Data], [PropertyInspectionID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @PropertyInspectionID, @DocumentCategoryID)", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@PropertyInspectionID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = PropertyInspectionID;
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = CategoryID;
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }

            this.gvDocument.DataBind();
        }

        public void HtmlAnchor_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfPropertyDocumentID = (HiddenField)row.FindControl("hfPropertyDocumentID");

            this.sdsDocument.DeleteParameters["InspectionDocumentID"].DefaultValue = hfPropertyDocumentID.Value;
            sdsDocument.Delete();
            gvDocument.DataBind();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                //csP.DeletePropertyDocument(Session["PropertyDocumentID"].ToString());
                //gvDocument.DataBind();
            }
            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [InspectionDocument] Where InspectionDocumentID = @InspectionDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@InspectionDocumentID", e.CommandArgument.ToString());
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
    }
}
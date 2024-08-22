using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.inspection
{
    public partial class inspectionView : joshcoWA.BasePage
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
            dv = (DataView)this.sdsInspectionProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblProperty.Text = dt.Rows[0]["PropertyName"].ToString();

                this.lblServiceProviderName.Text = dt.Rows[0]["ServiceProvider"].ToString();
                this.lblNotes.Text = dt.Rows[0]["Notes"].ToString();
                this.lblInspectionDate.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["InspectionDate"]);
                this.lblNextInspectionDate.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["NextInspectionDate"]);
                this.lblHoursSpent.Text = dt.Rows[0]["HoursSpent"].ToString();
                this.lblIspectionCost.Text = string.Format("{0:C}", dt.Rows[0]["TotalInspectionCost"]);
                this.lblIspectionCostPaid.Text = dt.Rows[0]["InspectionCostPaid"].ToString();
            }
        }

        protected void txtMar_TextChanged(object sender, EventArgs e)
        {
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

            //this.GridView2.DataBind();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
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

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        public void HtmlAnchor_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfPropertyInspectionID = (HiddenField)row.FindControl("hfPropertyInspectionID");

            sdsInspection.DeleteParameters["InspectionID"].DefaultValue = hfPropertyInspectionID.Value;
            sdsInspection.Delete();

            this.GridView1.DataBind();
            this.DropDownList1.DataBind();
        }

        public void HtmlAnchorDeleteDoc_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfInspectionDocumentID = (HiddenField)row.FindControl("hfInspectionDocumentID");

            //this.sdsDocument.DeleteParameters["InspectionDocumentID"].DefaultValue = hfInspectionDocumentID.Value;
            //this.sdsDocument.Delete();
            //this.GridView2.DataBind();
        }

        protected void lnkAddInspection_Click(object sender, EventArgs e)
        {
            if (this.txtNote.Value != "")
            {
                sdsInspection.InsertParameters["InspectionNotes"].DefaultValue = this.txtNote.Value;
                sdsInspection.InsertParameters["InspectionItemID"].DefaultValue = this.DropDownList1.SelectedValue;
                sdsInspection.InsertParameters["PropertyInspectionID"].DefaultValue = Session["PropertyInspectionID"].ToString();
                sdsInspection.Insert();

                this.GridView1.DataBind();
                this.DropDownList1.DataBind();


                this.txtNote.Value = "";
                this.DropDownList1.ClearSelection();

            }
            else { showMessageBox("Please enter notes"); return; }
        }

        protected void sdsInspection_Inserted(object sender, SqlDataSourceStatusEventArgs e)
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
                    string InspectionID = e.Command.Parameters["@InspectionID"].Value.ToString();

                    SaveFile(name, contentType, size, fileData, "2", InspectionID);
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewImages")
            {

                Session["InspectionID"] = e.CommandArgument.ToString();
                GridView gv = ((GridView)inspectionItemDocument.FindControl("gvDocument"));
                SqlDataSource sdsDocument = ((SqlDataSource)inspectionItemDocument.FindControl("sdsDocument"));

                sdsDocument.DataBind();
                gv.DataBind();

                this.mpe.Show();
            }
        }
    }
}
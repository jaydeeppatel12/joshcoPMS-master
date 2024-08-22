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

namespace joshcoWA
{
    public partial class serviceProviderQuotationView : BasePage
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
            dv = (DataView)this.sdsQuotationProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                //if (dt.Rows[0]["ApplicationSuccessful"].ToString() != "0")
                //{
                //   this.pnlAddLease.Visible = true;
                //}

                //this.lblFullName.Text = dt.Rows[0]["QuoteTitle"].ToString();
                //this.lblEmail.Text = dt.Rows[0]["ReferenceNumber"].ToString();

                this.lblTitle.Text = dt.Rows[0]["QuoteTitle"].ToString();
                this.lblReferenceNo.Text = dt.Rows[0]["ReferenceNumber"].ToString();
                this.lblWorkDescription.Text = dt.Rows[0]["WorkDescription"].ToString();

                this.lblProperty.Text = dt.Rows[0]["PropertyName"].ToString();
                this.lblMeetingVenue.Text = dt.Rows[0]["MeetingVenue"].ToString();
                this.lblBriefingMeeting.Text = dt.Rows[0]["MeetingRequired"].ToString() == "True" ? "Yes" : "No";
                this.lblContactEmail.Text = dt.Rows[0]["ContactEmail"].ToString();
                this.lblContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                this.lblTelephone.Text = dt.Rows[0]["ContactTelephone"].ToString();
                this.hfWorkOrderID.Value = dt.Rows[0]["WorkOrderID"].ToString();

                if (dt.Rows[0]["DueDate"].ToString() != "")
                {
                    this.lblDueDate.Text = string.Format("{0: dd-MMM-yyyy}", dt.Rows[0]["DueDate"]);
                }

                if (this.hfWorkOrderID.Value != "" && this.hfWorkOrderID.Value != "0")
                {
                    //  this.pnlAddLease.Visible = true;
                }

                if (Convert.ToBoolean(dt.Rows[0]["MeetingRequired"].ToString()))
                {
                    lblMeetingDateH.Visible = true;
                    lblMeetingVenueH.Visible = true;
                    lblMeetingDate.Visible = true;
                    lblMeetingVenue.Visible = true;

                    if (dt.Rows[0]["MeetingDate"].ToString() != "")
                    {
                        this.lblMeetingDate.Text = string.Format("{0: dd-MMM-yyyy HH:mm:ss }", dt.Rows[0]["MeetingDate"]);
                    }
                }



            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "Save")
            //{
            //    Button btn = (Button)e.CommandSource;
            //    GridViewRow row = (GridViewRow)(btn.NamingContainer);

            //    this.sdsQuotation.UpdateParameters["Awarded"].DefaultValue = ((DropDownList)row.FindControl("ddlStatus")).SelectedValue;
            //    this.sdsQuotation.UpdateParameters["Note"].DefaultValue = ((TextBox)row.FindControl("txtNote")).Text;
            //    this.sdsQuotation.UpdateParameters["QuotationID"].DefaultValue = e.CommandArgument.ToString();
            //    this.sdsQuotation.Update();

            //    showMessageBox("Submitted");

            //    this.GridView1.DataBind();
            //}

            if (e.CommandName == "Upload")
            {
                Button btn = (Button)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                HttpPostedFile file = ((FileUpload)row.FindControl("flQuotation")).PostedFile;

                if (file.ContentLength > 0)
                {
                    int size = file.ContentLength;
                    string name = file.FileName;
                    int position = name.LastIndexOf("\\");
                    name = name.Substring(position + 1);
                    string contentType = file.ContentType;
                    byte[] fileData = new byte[size];
                    file.InputStream.Read(fileData, 0, size);

                    UploadQuotation(name, contentType, size, fileData, e.CommandArgument.ToString());
                }
            }

            if (e.CommandName == "RemoveQuote")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Update [Quotation] set QuotationDocument = NULL, QuotationDocumentName = NULL Where QuotationID = @QuotationID", connection))
                    {
                        command.Parameters.AddWithValue("@QuotationID", e.CommandArgument.ToString());
                        command.ExecuteNonQuery();

                    }
                    connection.Close();
                }
                this.GridView1.DataBind();
            }

            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [Quotation] Where QuotationID = @QuotationID", connection))
                    {
                        command.Parameters.AddWithValue("@QuotationID", e.CommandArgument.ToString());
                        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                        if (reader.HasRows)
                        {
                            reader.Read();
                            byte[] content = reader["QuotationDocument"] as byte[];
                            string filename = reader["QuotationDocumentName"].ToString();
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

        public void UploadQuotation(string name, string contentType, int size, byte[] data, string QuotationID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Update [dbo].[Quotation] Set QuotationDocument = @QuotationDocument, QuotationDocumentName = @QuotationDocumentName Where QuotationID = @QuotationID", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@QuotationDocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter DataParameter = new SqlParameter("@QuotationDocument", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter QuotationParameterID = new SqlParameter("@QuotationID", System.Data.SqlDbType.Int, 20);
                    QuotationParameterID.Value = Convert.ToInt32(QuotationID);

                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, DataParameter, QuotationParameterID });
                    command.ExecuteNonQuery();
                }
            }
            showMessageBox("Uploaded");

            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((HiddenField)e.Row.FindControl("hfDateQuoteSubmitted")).Value != "")
                {
                    ((Telerik.Web.UI.RadDateTimePicker)e.Row.FindControl("rdpDateQuoteSubmitted")).SelectedDate = Convert.ToDateTime(((HiddenField)e.Row.FindControl("hfDateQuoteSubmitted")).Value);
                }

                //if (((LinkButton)e.Row.FindControl("lnkStatus")).Text == "AWARDED")
                //{
                //}
            }
        }

        protected void txtAmountQuoted_TextChanged(object sender, EventArgs e)
        {
            UpdateQuotation(sender);
        }

        protected void rdpDateQuoteSubmitted_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
            UpdateQuotation(sender);
        }

        public void UpdateQuotation(object sender)
        {
            Control btn = (Control)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);


            this.sdsQuotationStatusUpdate.UpdateParameters["QuotedAmount"].DefaultValue = ((TextBox)row.FindControl("txtAmountQuoted")).Text;
            this.sdsQuotationStatusUpdate.UpdateParameters["DateQuoteSubmitted"].DefaultValue = DateTime.Today.Date.ToShortDateString() ;//((Telerik.Web.UI.RadDateTimePicker)row.FindControl("rdpDateQuoteSubmitted")).SelectedDate.ToString();
            this.sdsQuotationStatusUpdate.UpdateParameters["QuotationID"].DefaultValue = ((HiddenField)row.FindControl("hfQuotationID")).Value;
            this.sdsQuotationStatusUpdate.Update();

            showMessageBox("Updated");
        }
    }
}
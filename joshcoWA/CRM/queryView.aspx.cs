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


namespace joshcoWA.CRM
{
    public partial class queryView : joshcoWA.BasePage
    {
        static string ID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ID = Request.QueryString["ID"].ToString();

                UpdateClientStatus(ID);
                GetQueryComments();
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlStatus.SelectedValue != "0")
            {
                csClientQuery cq = new csClientQuery();
                cq.UpdateQueryStatus(ID, this.ddlStatus.SelectedItem.Text);

                if(this.ddlStatus.SelectedItem.Text.Equals("Completed", StringComparison.OrdinalIgnoreCase))
                {
                    clSendEmail sendmail = new clSendEmail();

                    string mailbody = "";
                    mailbody += "Your complaint was received successfully </br></br>";
                    mailbody += "Query Ref: " + lblReferenceNo.Text + "</br>";
                    mailbody += "Date: " + DateTime.Now.ToLongDateString() + "</br></br>";
                    var userID = Session["UserID"].ToString();
                    sendmail.SendMail("eichlefoko@gmail.com", "fsdf", "Joshco Query Ref: " + lblReferenceNo.Text + " completed", mailbody, "", "Query", "2004");
                }

                Response.Redirect("CRMHome.aspx");
            }
        }


        public void UpdateClientStatus(string ID)
        {
            csClientQuery cq = new csClientQuery();
            DataTable dt = cq.GetQueryDetails(ID);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    this.lblReferenceNo.Text = row["ReferenceNo"].ToString();
                    this.lblQueryItem.Text = row["QueryCategory"].ToString();
                    this.lblProperty.Text = row["PropertyName"].ToString();
                    this.lblPropertyUnit.Text = row["PropertyUnit"].ToString();
                    this.lblQueryDescription.Text = row["QueryDescription"].ToString();
                    this.lblSeverity.Text = row["Severity"].ToString();
                    this.lblStatus.Text = row["QueryStatus"].ToString();
                    this.lblTenant.Text = row["Tenant"].ToString();


                    if (row["InvitationToQuoteID"].ToString() != "" && row["InvitationToQuoteID"].ToString() != "0")
                    {
                        this.hfInvitationToQuoteID.Value = row["InvitationToQuoteID"].ToString();
                        //this.Label14.Text = row["InvitationToQuoteID"].ToString();
                        this.hfQuoteTitle.Value = row["QuoteTitle"].ToString();
                        this.hfQuoteDueDate.Value = row["QuoteDueDate"].ToString();
                        this.hfQuoteWorkDescription.Value = row["QuoteWorkDescription"].ToString();
                        this.hfQuoteMeetingDate.Value = row["QuoteMeetingDate"].ToString();
                        this.hfQuoteMeetingVenue.Value = row["QuoteMeetingVenue"].ToString();
                        this.hfQuoteContactPerson.Value = row["QuoteContactPerson"].ToString();
                        this.hfQuoteContactEmail.Value = row["QuoteContactEmail"].ToString();
                        this.hfQuoteContactTelephone.Value = row["QuoteContactTelephone"].ToString();
                        this.hfQuoteReferenceNumber.Value = row["QuoteReferenceNumber"].ToString();
                        this.pnlQuotation.Visible = true;
                        this.pnlInvitationToQuote.Visible = false;

                        this.ddlServiceProvider.DataBind();
                    }


                    if (row["FacilityManagementID"].ToString() != "")
                    {
                        this.hfFacilityManagementID.Value = row["FacilityManagementID"].ToString();

                        this.lblWorkOrder.Text = "This query has been assigned to this work order (" + row["RefNumber"].ToString() + ")";
                        this.btnWorkOrder.Visible = false;
                        //
                        //
                    }
                    else
                    {
                        this.lblWorkOrder.Text = "";
                        //this.btnInvitation.Visible = true;
                        //this.pnlInvitationToQuote.Visible = true;
                        //this.pnlQuotation.Visible = false;
                    }

                    if (dt.Rows[0]["QueryStatus"].ToString() != "")
                    {
                        this.ddlStatus.DataBind();
                        this.ddlStatus.SelectedItem.Text = dt.Rows[0]["QueryStatus"].ToString();
                    }


                    if (row["Rating"].ToString() != "")
                    {
                        this.rblRating.SelectedValue = row["Rating"].ToString();
                        this.pnlRating.Visible = true;
                    }

                    //if (dt.Rows[0]["QueryStatus"].ToString() == "New")
                    //{
                    //    this.pnlStatus.BackColor = System.Drawing.Color.White;
                    //}
                    //else if (dt.Rows[0]["QueryStatus"].ToString() == "In Progress")
                    //{
                    //    this.pnlStatus.BackColor = System.Drawing.Color.FromName("#FFFF66");
                    //}
                    //else if (dt.Rows[0]["QueryStatus"].ToString() == "Completed")
                    //{
                    //    this.pnlStatus.BackColor = System.Drawing.Color.FromName("#66FF33");
                    //}
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            var comment = this.txtComment.Value;
            if (string.IsNullOrWhiteSpace(comment))
            {
                return;
            }
            var queryID = Request.QueryString["ID"].ToString();
            var userID = Session["UserID"].ToString();
            csClientQuery cq = new csClientQuery();
            cq.AddQueryComment(comment, queryID, userID);

            Response.Redirect(Request.RawUrl);
        }
        public void GetQueryComments()
        {
            csClientQuery cq = new csClientQuery();
            DataTable dt = cq.GetQueryComments(ID);

            this.gvComments.DataSource = dt;
            this.gvComments.DataBind();
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [FM_QueryDocument] Where QueryDocumentID = @QueryDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@QueryDocumentID", e.CommandArgument.ToString());
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

        //protected void lnkSubmit_Click(object sender, EventArgs e)
        //{
        //    csClientQuery cq = new csClientQuery();
        //    cq.UpdateClientStatus(ID, "Work Order Assigned", this.ddlStatus.SelectedValue);
        //    showMessageBox("Updated successfully");

        //    UpdateClientStatus(ID);
        //}

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void lblWorkOrder_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('WorkOrderView.aspx?FacilityManagementID=" + this.hfFacilityManagementID.Value + "','_blank');</script>");

            //Response.Redirect("WorkOrderView.aspx?FacilityManagementID=" + this.hfFacilityManagementID.Value);
        }

        protected void lbClear_Click(object sender, EventArgs e)
        {
            csClientQuery cq = new csClientQuery();
            cq.DelQueryWorkOrder(ID);

            UpdateClientStatus(ID);
        }

        protected void lnkAddServiceProvider_Click(object sender, EventArgs e)
        {
            if (this.hfInvitationToQuoteID.Value != "" && this.hfInvitationToQuoteID.Value != "0")
            {
                this.sdsQuotation.InsertParameters["InvitationToQuoteID"].DefaultValue = this.hfInvitationToQuoteID.Value;
                this.sdsQuotation.InsertParameters["ServiceProviderID"].DefaultValue = this.ddlServiceProvider.SelectedValue;
                this.sdsQuotation.Insert();
                this.gvQuotation.DataBind();
                this.ddlServiceProvider.DataBind();

                try
                {
                    DataView dv;
                    dv = (DataView)this.sdsSP.Select(DataSourceSelectArguments.Empty);
                    DataTable dt = new DataTable();
                    dt = dv.ToTable();

                    if (dt.Rows.Count > 0)
                    {
                        SendInvitationToQuote(dt.Rows[0]["Email"].ToString(), dt.Rows[0]["ContactPersonName"].ToString());
                    }

                    System.Threading.Thread.Sleep(5000);
                }
                catch { }
            }
        }

        public void SendInvitationToQuote(string emailAddress, string name)
        {

            clSendEmail sendmail = new clSendEmail();
            ExportToPDF(this.hfQuoteReferenceNumber.Value, this.ddlServiceProvider.SelectedItem.Text, this.hfQuoteTitle.Value, this.hfQuoteDueDate.Value, this.hfQuoteWorkDescription.Value, this.hfQuoteMeetingDate.Value, this.hfQuoteMeetingVenue.Value, this.hfQuoteContactPerson.Value, this.hfQuoteContactEmail.Value, this.hfQuoteContactTelephone.Value, this.lblProperty.Text);

            string mailbody = "";
            mailbody += "Please find the attached invitation to quote </br></br>";

            sendmail.SendMail(emailAddress, name, "QuickProp: Invitation to quote", mailbody, Server.MapPath("~/quotation/") + Session["FName"].ToString() + ".pdf");
        }

        protected void ExportToPDF(string ReferenceNo, string ServiceProvider, string QuoteTitle, string DueDate, string ScopeOfWork, string MeetingDate, string MeetingVenue, string ContactPerson, string ContactEmail, string ContactTelephone, string PropertyName)
        {
            this.sdsSP.DataBind();

            System.Data.DataView dv1 = null;
            dv1 = (System.Data.DataView)this.sdsSP.Select(DataSourceSelectArguments.Empty);
            System.Data.DataTable dt1 = new System.Data.DataTable();
            dt1 = dv1.ToTable("DataSet1");

            ReportDataSource rds1 = new ReportDataSource("DataSet1", dt1);

            ReportParameter ReferenceNo_ = new ReportParameter("ReferenceNo", ReferenceNo);
            ReportParameter ServiceProvider_ = new ReportParameter("ServiceProvider", ServiceProvider);
            ReportParameter QuoteTitle_ = new ReportParameter("QuoteTitle", QuoteTitle);
            ReportParameter DueDate_ = new ReportParameter("DueDate", DueDate);
            ReportParameter ScopeOfWork_ = new ReportParameter("ScopeOfWork", ScopeOfWork);
            ReportParameter MeetingDate_ = new ReportParameter("MeetingDate", MeetingDate);
            ReportParameter MeetingVenue_ = new ReportParameter("MeetingVenue", MeetingVenue);
            ReportParameter ContactPerson_ = new ReportParameter("ContactPerson", ContactPerson);
            ReportParameter ContactEmail_ = new ReportParameter("ContactEmail", ContactEmail);
            ReportParameter ContactTelephone_ = new ReportParameter("ContactTelephone", ContactTelephone);
            ReportParameter PropertyName_ = new ReportParameter("PropertyName", PropertyName);

            //Set the report parameters for the report
            ReportParameter[] parameters = { ReferenceNo_, ServiceProvider_, QuoteTitle_, DueDate_, ScopeOfWork_, MeetingDate_, MeetingVenue_, ContactPerson_, ContactEmail_, ContactTelephone_, PropertyName_ };

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = "report/InvitationToQuote.rdlc";
            viewer.LocalReport.DataSources.Add(rds1);
            viewer.LocalReport.SetParameters(parameters);
            FillReport(viewer);

            Session["FName"] = "Invitation_" + DateTime.Now.ToString("yyyyMMddHHmmss");
            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
            FileStream file = new FileStream(Server.MapPath("~/quotation/") + Session["FName"].ToString() + ".pdf", FileMode.Create, System.IO.FileAccess.Write);
            file.Write(bytes, 0, bytes.Length);
            file.Close();
        }

        public void FillReport(ReportViewer rv)
        {
            rv.LocalReport.Refresh();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Save")
            {
                Button btn = (Button)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                this.sdsQuotation.UpdateParameters["Awarded"].DefaultValue = ((DropDownList)row.FindControl("ddlStatus1")).SelectedValue;
                this.sdsQuotation.UpdateParameters["Note"].DefaultValue = ((TextBox)row.FindControl("txtNote")).Text;
                this.sdsQuotation.UpdateParameters["QuotationID"].DefaultValue = e.CommandArgument.ToString();
                this.sdsQuotation.Update();

                showMessageBox("Submitted");

                this.gvQuotation.DataBind();
            }

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
                this.gvQuotation.DataBind();
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

            this.gvQuotation.DataBind();
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
            this.sdsQuotationStatusUpdate.UpdateParameters["DateQuoteSubmitted"].DefaultValue = ((Telerik.Web.UI.RadDateTimePicker)row.FindControl("rdpDateQuoteSubmitted")).SelectedDate.ToString();
            this.sdsQuotationStatusUpdate.UpdateParameters["QuotationID"].DefaultValue = ((HiddenField)row.FindControl("hfQuotationID")).Value;
            this.sdsQuotationStatusUpdate.Update();

            showMessageBox("Updated");
        }

        public void HtmlAnchor_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfQuotationID = (HiddenField)row.FindControl("hfQuotationID");

            sdsQuotationStatusUpdate.DeleteParameters["QuotationID"].DefaultValue = hfQuotationID.Value;
            sdsQuotationStatusUpdate.Delete();

            this.gvQuotation.DataBind();
            this.ddlServiceProvider.DataBind();
        }

        protected void btnInvitation_Click(object sender, EventArgs e)
        {
            this.lblPopHeader.Text = "Invitation To Quote Details";
            this.addQuotation.Visible = true;
            this.addWorkOrder.Visible = false;
            ((Label)addQuotation.FindControl("lblQueryID")).Text = ID;
            this.mpeLeaseAdd.Show();
            // lblQueryID.Text = "";
        }

        protected void btnWorkOrder_Click(object sender, EventArgs e)
        {
            this.lblPopHeader.Text = "Work Order Details";
            this.addQuotation.Visible = false;
            this.addWorkOrder.Visible = true;
            ((Label)addWorkOrder.FindControl("lblQueryID")).Text = ID;

            if (this.hfInvitationToQuoteID.Value != "" && this.hfInvitationToQuoteID.Value != "0")
            {
                try
                {
                    ((DropDownList)addWorkOrder.FindControl("ddlQuotation")).DataBind();
                    ((DropDownList)addWorkOrder.FindControl("ddlQuotation")).SelectedValue = this.hfInvitationToQuoteID.Value;
                    ((DropDownList)addWorkOrder.FindControl("ddlQuotation")).Enabled = false;

                    ((DropDownList)addWorkOrder.FindControl("ddlProperty")).DataBind();
                    ((DropDownList)addWorkOrder.FindControl("ddlServiceProvider")).DataBind();

                    this.addWorkOrder.FillPropDetails();
                }
                catch { }
            }
            this.mpeLeaseAdd.Show();
        }

        protected void lblWorkOrder_Click1(object sender, EventArgs e)
        {
            Session["FacilityManagementID"] = this.hfFacilityManagementID.Value;
            Response.Write("<script>window.open('../workorder/workorderView.aspx','_blank');</script>");
        }
    }
}

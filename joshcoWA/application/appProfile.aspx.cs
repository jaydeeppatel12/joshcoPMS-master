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
using System.Xml.Linq;
using System.Xml;
using joshcoWA.External.Services;
using System.Globalization;
namespace joshcoWA
{
    public partial class appProfile : joshcoWA.BasePage
    {
        //TpnService _tpnService = new TpnService();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;

                FillProfile();
            }
        }


        protected void Tab66_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab66.CssClass = "Clicked";
            Tab77.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 5;
        }

        protected void Tab77_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab66.CssClass = "Initial";
            Tab77.CssClass = "Clicked";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 6;
        }



        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial";
            Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Clicked";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 2;
        }

        protected void Tab4_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Clicked";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 3;
        }

        protected void Tab5_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Clicked";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 4;
        }

        protected void Tab6_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Clicked";
            Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 7;
        }

        protected void Tab7_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab7.CssClass = "Clicked"; Tab66.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 8;
        }


        protected void Tab10_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Clicked";
            Tab66.CssClass = "Initial";
            Tab7.CssClass = "Initial";
            Tab77.CssClass = "Initial";
            MainView.ActiveViewIndex = 9;
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsApp.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            this.lblDeposit.Text = "";
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["ApplicationSuccessful"].ToString() != "0")
                {
                    Tab10.Visible = true;

                    Tab1.CssClass = "Initial";
                    Tab2.CssClass = "Initial";
                    Tab3.CssClass = "Initial";
                    Tab4.CssClass = "Initial";
                    Tab5.CssClass = "Initial";
                    Tab6.CssClass = "Initial";
                    Tab10.CssClass = "Clicked";
                    Tab66.CssClass = "Initial";
                    Tab7.CssClass = "Initial";
                    Tab77.CssClass = "Initial";
                    MainView.ActiveViewIndex = 9;

                    this.pnlAddLease.Visible = true;
                }

                if (dt.Rows[0]["LeaseID"].ToString() != "")
                {
                    Tab10.Visible = true;

                    Tab1.CssClass = "Initial";
                    Tab2.CssClass = "Initial";
                    Tab3.CssClass = "Initial";
                    Tab4.CssClass = "Initial";
                    Tab5.CssClass = "Initial";
                    Tab6.CssClass = "Initial";
                    Tab10.CssClass = "Clicked";
                    Tab66.CssClass = "Initial";
                    Tab7.CssClass = "Initial";
                    Tab77.CssClass = "Initial";
                    MainView.ActiveViewIndex = 9;

                    this.pnlAddLease.Visible = false;
                    this.pnlLease.Visible = true;
                    hfLeaseID.Value = dt.Rows[0]["LeaseID"].ToString();
                    Session["LeaseID"] = dt.Rows[0]["LeaseID"].ToString();
                }

                this.hfApplicationID.Value = dt.Rows[0]["ApplicationID"].ToString();
                Session["ApplicantID"] = dt.Rows[0]["ApplicantID"].ToString();
                this.EmailAddress.Value = dt.Rows[0]["EmailAddress"].ToString();
                this.IDNumber.Value = dt.Rows[0]["IdentityNumber"].ToString();
                this.Name.Value = dt.Rows[0]["FullName"].ToString();
                this.Mobile.Value = dt.Rows[0]["MobileNumber"].ToString();

                var deposit = dt.Rows[0]["DepositAmount"].ToString();
                hDepositAmount.Value = string.IsNullOrWhiteSpace(deposit) ? Convert.ToDecimal(dt.Rows[0]["DepositRequired"].ToString()).ToString("0.00") : deposit;

                ((Label)AddLease1.FindControl("lblPropertyName")).Text = dt.Rows[0]["PropertyName"].ToString();
                ((HiddenField)AddLease1.FindControl("hfPropertyID")).Value = dt.Rows[0]["PropertyID"].ToString();
                ((HiddenField)AddLease1.FindControl("hfApplicationID")).Value = dt.Rows[0]["ApplicationID"].ToString();

                if (dt.Rows[0]["ApplicationApproved"].ToString() == "Yes")
                {
                    pnlStatus.Visible = false;

                    GridView1.Columns[3].Visible = false;

                    var depositRequired = dt.Rows[0]["DepositRequired"].ToString();
                    var depositAmount = dt.Rows[0]["DepositAmount"].ToString();

                    bool showDepositPage = true;
                    string amount = string.IsNullOrWhiteSpace(depositAmount) ? Convert.ToDecimal(dt.Rows[0]["DepositRequired"].ToString()).ToString("0.00") : depositAmount;
                    this.lblLastDeposit.Value = depositAmount;

                    if (!string.IsNullOrWhiteSpace(depositRequired) &&
                      !string.IsNullOrWhiteSpace(depositAmount))
                    {
                        var dp = Convert.ToDecimal(depositRequired);
                        var da = Convert.ToDecimal(depositAmount);

                        if (dp <= da)
                        {
                            showDepositPage = false;
                        }
                        else
                        {
                            amount = (dp - da).ToString("0.00");
                        }
                    }

                    if (showDepositPage)
                    {
                        this.pnlDeposit.Visible = true;
                        this.pnlAddLease.Visible = false;
                        this.pnlLease.Visible = false;
                        this.lblDeposit.Text = amount;
                        this.txtDepositAmount.Value = amount;
                    }
                    else
                    {
                        this.txtDepositAmount.Value = dt.Rows[0]["DepositAmount"].ToString();
                        this.ddlSource.SelectedValue = dt.Rows[0]["DepositSource"].ToString();
                        this.lnkProofOfDeposit.Text = dt.Rows[0]["DocumentName"].ToString();
                        this.lnkProofOfDeposit.CommandArgument = dt.Rows[0]["ApplicationDepositID"].ToString();


                        this.ddlSource.Enabled = false;
                        this.flProofOfPayment.Visible = false;
                        this.lnkProofOfDeposit.Visible = true;
                        this.btnDeposit.Visible = false;
                        this.pnlDeposit.Visible = true;                  
                    }
                }
            }

            int ApplicantID = Convert.ToInt32(Session["ApplicantID"]);
            this.frmApplicant.GetApplicant(ApplicantID);
            this.frmApplicantEmployment.GetApplicantEmployment(ApplicantID);
            this.frmApplicantGeneralDetails.GetApplicantGeneralDetails(ApplicantID);
            int ApplicantSpouseID = 0;
            ApplicantSpouseID = this.frmApplicantSpouse.GetApplicantSpouse(ApplicantID);
            this.frmApplicantSpouseEmployment.GetApplicantEmployment(ApplicantSpouseID);
            this.frmApplicantDeclaration.GetApplicantDeclaration(ApplicantID);
            this.frmApplicantIncome.GetApplicantIncome(ApplicantID);
            this.frmApplicantExpenditure.GetApplicantExpenditure(ApplicantID);

            ((HiddenField)this.frmApplicantDocument.FindControl("hfApplicantID")).Value = ApplicantID.ToString();
            this.frmApplicantDocument.ShowUploadButton();

            ((TextBox)this.frmApplicantDeclaration.FindControl("txtCaptcha")).Visible = false;
            ((ImageButton)this.frmApplicantDeclaration.FindControl("Refresh")).Visible = false;
            ((MSCaptcha.CaptchaControl)this.frmApplicantDeclaration.FindControl("Captcha1")).Visible = false;

            //var creditReport = _tpnService.GetCreditReport(Convert.ToInt32(this.hfApplicationID.Value));

            //if (creditReport != null)
            //{
            //    string url = creditReport.ReportUrl.Replace("http", "https");
            //    this.lblConsumerReport.Text = string.IsNullOrWhiteSpace(creditReport.ReportUrl) ? "Consumer Enquiry Report: Unable to get credit report" : "Consumer Enquiry Report: <a href=" + @"" + url + " target='_blank'>Download TPN Report Here</a>";
            //}

            ////lblIdVerify
            //var iDVerifyReport = _tpnService.GetIDVerificationReport(Convert.ToInt32(this.hfApplicationID.Value));
            //if (iDVerifyReport != null)
            //{
            //    this.lblIdVerify.Text = iDVerifyReport.IDVerified ? "ID Verification: Verified" : "ID Verification: Unable to verify ID";
            //}

            //((DropDownList)this.frmProperty.FindControl("ddlProperty")).DataBind();
            //((DropDownList)this.frmProperty.FindControl("ddlProperty")).SelectedValue = Session["PropertyID"].ToString();           
        }


        protected void lnkAddStatus_Click(object sender, EventArgs e)
        {
            if (this.txtComment.Value != "")
            {
                sdsApplicationStatusUpdate.InsertParameters["Comment"].DefaultValue = this.txtComment.Value;
                sdsApplicationStatusUpdate.InsertParameters["ApplicationStatusID"].DefaultValue = this.DropDownList1.SelectedValue;
                sdsApplicationStatusUpdate.InsertParameters["ApplicationID"].DefaultValue = Session["ApplicationID"].ToString();
                sdsApplicationStatusUpdate.Insert();
                this.GridView1.DataBind();

                try
                {
                    if (DropDownList1.SelectedItem.Text.Equals("Application Successful", StringComparison.OrdinalIgnoreCase))
                    {
                        clSendSMS sms = new clSendSMS();
                        //sms.SendMessage(Mobile.Value, "JOSHCO Ref: " + Session["ApplicationID"].ToString() + " Deposit: " + hDepositAmount.Value + " Acc Number: Test Account" );
                        sms.SendMessage(Mobile.Value, "JOSHCO Ref Number: " + Session["ApplicationID"].ToString() + " Amount: " + hDepositAmount.Value + " Number: XXXXX");
                    }
                    else
                    {
                        clSendSMS sms = new clSendSMS();
                        sms.SendMessage(Mobile.Value, "JOSHCO : " + Session["ApplicationID"].ToString() + " Status: " + this.DropDownList1.SelectedItem.Text);
                    }
                }
                catch (Exception)
                {

                }

                try
                {
                    //Application reviewd message
                    SendUserMail(this.EmailAddress.Value, this.IDNumber.Value, this.Name.Value, this.DropDownList1.SelectedItem.Text, this.txtComment.Value);
                }
                catch { }

                //if (this.DropDownList1.SelectedValue == "4")
                //{
                //    FillProfile();
                //}

                Response.Redirect("appProfile.aspx");
                //this.DropDownList1.DataBind();
                //this.txtComment.Value = "";
                //this.DropDownList1.ClearSelection();
            }
            else { showMessageBox("Please enter a comment"); return; }
        }

        //Application reviwed
        protected void SendUserMail(string emailAddress, string IDnumber, string name, string Status, string comment)
        {
            clSendEmail sendmail = new clSendEmail();

            string mailbody = "";
            mailbody += "Your application has been reviewed with the following comment below.</br></br>";
            mailbody += "Status: " + Status + "</br>";
            mailbody += "Comment: " + comment + "</br></br>";
            mailbody += "To view your application review online use the following link below </br></br>";
            mailbody += "Url: <a href='" + ConfigurationManager.AppSettings["AppStatusLink"] + "' >Application form</a>  </br></br>";

            sendmail.SendMail(emailAddress, name, "Joshco: Application Review", mailbody, "");
        }

        public void HtmlAnchor_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfApplicationStatusID = (HiddenField)row.FindControl("hfApplicationStatusID");

            sdsApplicationStatusUpdate.DeleteParameters["ApplicationStatusUpdateID"].DefaultValue = hfApplicationStatusID.Value;
            sdsApplicationStatusUpdate.Delete();

            this.GridView1.DataBind();
            this.DropDownList1.DataBind();
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            //srTPN.SecurityInfo securityInfo = new srTPN.SecurityInfo
            //{
            //    LoginCode = "spakade01",
            //    SecurityCode = "joshco7520uat",
            //    Password = "58Yo#N#w8u",
            //    OutputFormat = "links"
            //};
            //srTPN.SecuritySoapClient securityServiceClient = new srTPN.SecuritySoapClient();
            //var result = securityServiceClient.GenerateAuthToken(securityInfo);

            ///*********************************************************************************/
            //srTPNConsumerEnquiry.SecurityInfo ConsumersecurityInfo = new srTPNConsumerEnquiry.SecurityInfo
            //{
            //    AuthToken = result.Value,
            //    SecurityCode = "joshco7520uat",
            //    OutputFormat = "links"
            //};
            //srTPNConsumerEnquiry.ConsumerSoapClient consumerServiceClient = new srTPNConsumerEnquiry.ConsumerSoapClient();
            //var result1 = consumerServiceClient.CanAccessCredex(ConsumersecurityInfo);


        }


        protected void hlnkAddLease_Click(object sender, EventArgs e)
        {
            ((HiddenField)AddLease1.FindControl("hfName")).Value = this.Name.Value;
            ((HiddenField)AddLease1.FindControl("hfEmail")).Value = this.EmailAddress.Value;
            ((HiddenField)AddLease1.FindControl("hfIDNumber")).Value = this.IDNumber.Value;
            ((SqlDataSource)AddLease1.FindControl("sdsPropertyUnit")).DataBind();
            ((DropDownList)AddLease1.FindControl("ddlPropertyUnit")).DataBind();

            this.mpeLeaseAdd.Show();
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = this.flProofOfPayment.PostedFile;
            if (file.ContentLength > 0)
            {
                int size = file.ContentLength;
                string name = file.FileName;
                int position = name.LastIndexOf("\\");
                name = name.Substring(position + 1);
                string contentType = file.ContentType;
                byte[] fileData = new byte[size];
                file.InputStream.Read(fileData, 0, size);


                SaveFile(name, contentType, size, fileData, this.txtDepositAmount.Value, this.ddlSource.SelectedValue);

                showMessageBox("Uploaded successfully");

                FillProfile();
            }
        }
        public void SaveFile(string name, string contentType, int size, byte[] data, string DepositAmount, string DepositSource)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("if(Select Count(*) From [ApplicationDeposit] Where ApplicationID = @ApplicationID)=0 Begin Insert into [ApplicationDeposit]([DocumentName], [ContentType], [Size], [Data], [ApplicationID], [DepositAmount], DepositSource)values(@DocumentName,@ContentType, @Size, @Data, @ApplicationID, @DepositAmount, @DepositSource); End", connection))
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
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DepositAmount", System.Data.SqlDbType.Decimal, 20);
                    DocumentCategoryIDParameter.Value = DepositAmount;
                    SqlParameter DepositSourceParameter = new SqlParameter("@DepositSource", System.Data.SqlDbType.VarChar, 50);
                    DepositSourceParameter.Value = DepositSource;

                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter, DepositSourceParameter });
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void lnkProofOfDeposit_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("Select * from [ApplicationDeposit] Where ApplicationDepositID = @ApplicationDepositID", connection))
                {
                    command.Parameters.AddWithValue("@ApplicationDepositID", this.lnkProofOfDeposit.CommandArgument);
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

        protected void imbDownloadApplication_Click(object sender, ImageClickEventArgs e)
        {
            DataView dv;
            dv = ((DataView)this.sdsApplicationForm.Select(DataSourceSelectArguments.Empty));
            DataTable dt1 = new DataTable();
            dt1 = dv.ToTable("RDS");

            ReportDataSource rds1 = new ReportDataSource("DataSet1", dt1);

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;

            viewer.LocalReport.ReportPath = Server.MapPath("../applicant/appForm.rdlc");
            viewer.LocalReport.DataSources.Add(rds1);
            viewer.LocalReport.Refresh();

            string Fname = "ApplicationForm_" + DateTime.Now.ToString("yyyyMMddHHmmss");
            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + Fname + ".pdf");
            Response.AddHeader("Content-Type", "application/pdf");
            Response.BinaryWrite(bytes.ToArray());
            Response.End();
        }
    }


}

 using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class studentAppProfile : System.Web.UI.Page
    {
        clStudentApplication StudentApplication = new clStudentApplication();
        clStudentApplicant StudentApplicant = new clStudentApplicant();
        csStudentApplicationAccommodationUnit StudentApplicationAccommodationUnit = new csStudentApplicationAccommodationUnit();
        clStudentParent StudentParent = new clStudentParent();
        clStudentDeclaration StudentDeclaration = new clStudentDeclaration();
        clStudentFinancialSponsor StudentFinancialSponsor = new clStudentFinancialSponsor();
        protected void Page_Load(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            MainView.ActiveViewIndex = 0;

            FillProfile();
        }

        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            //Tab6.CssClass = "Initial";
            //Tab7.CssClass = "Initial";
            //Tab66.CssClass = "Initial";
            //Tab77.CssClass = "Initial";
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
            //Tab6.CssClass = "Initial";
            //Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            //Tab77.CssClass = "Initial";
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
            //Tab6.CssClass = "Initial";
            //Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            //Tab77.CssClass = "Initial";
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
            //Tab6.CssClass = "Initial";
            //Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            //Tab77.CssClass = "Initial";
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
            //Tab6.CssClass = "Initial";
            //Tab7.CssClass = "Initial"; Tab66.CssClass = "Initial";
            //Tab77.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 4;
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsStudentApplicationProfile.Select(DataSourceSelectArguments.Empty);
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
                    //Tab6.CssClass = "Initial";
                    Tab10.CssClass = "Clicked";
                    //Tab66.CssClass = "Initial";
                    //Tab7.CssClass = "Initial";
                    //Tab77.CssClass = "Initial";
                    MainView.ActiveViewIndex = 5;

                    this.pnlAddLease.Visible = true;
                }

                if (dt.Rows[0]["StudentLeaseID"].ToString() != "")
                {
                    Tab10.Visible = true;

                    Tab1.CssClass = "Initial";
                    Tab2.CssClass = "Initial";
                    Tab3.CssClass = "Initial";
                    Tab4.CssClass = "Initial";
                    Tab5.CssClass = "Initial";
                    //Tab6.CssClass = "Initial";
                    Tab10.CssClass = "Clicked";
                    //Tab66.CssClass = "Initial";
                    //Tab7.CssClass = "Initial";
                    //Tab77.CssClass = "Initial";
                    MainView.ActiveViewIndex = 5;

                    this.pnlAddLease.Visible = false;
                    this.pnlLease.Visible = true;
                    hfLeaseID.Value = dt.Rows[0]["LeaseID"].ToString();
                    Session["LeaseID"] = dt.Rows[0]["LeaseID"].ToString();
                }



                //  this.hfApplicationID.Value = dt.Rows[0]["ApplicationID"].ToString();
                Session["StudentApplicationID"] = dt.Rows[0]["StudentApplicationID"].ToString();


                //Its here. I dont think its necessary in my case
                //Session["ApplicantID"] = dt.Rows[0]["ApplicantID"].ToString();


                this.EmailAddress.Value = dt.Rows[0]["StudentEmailAddress"].ToString();
                this.IDNumber.Value = dt.Rows[0]["StudentIdentificationNumber"].ToString();
                this.Name.Value = dt.Rows[0]["StudentFirstName"].ToString();
                this.Mobile.Value = dt.Rows[0]["StudentMobileNumber"].ToString();

                var deposit = dt.Rows[0]["DepositAmount"].ToString();
                hDepositAmount.Value = string.IsNullOrWhiteSpace(deposit) ? Convert.ToDecimal(dt.Rows[0]["DepositRequired"].ToString()).ToString("0.00") : deposit;

                //((Label)AddLease1.FindControl("lblPropertyName")).Text = dt.Rows[0]["PropertyName"].ToString();
                // ((HiddenField)AddLease1.FindControl("hfPropertyID")).Value = dt.Rows[0]["PropertyID"].ToString();
                ((HiddenField)AddLease1.FindControl("hfApplicationID")).Value = dt.Rows[0]["StudentApplicationID"].ToString();

                if (dt.Rows[0]["StudentApplicationApproved"].ToString() == "Yes")
                {
                    pnlStatus.Visible = false;

                    gvStudentApplicationStatus.Columns[3].Visible = false;

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

            //To check where Session["ApplicationID"] is created/initialised
            int ApplicationID = Convert.ToInt32(Session["StudentApplicationID"]);
            

            this.frmStudentApplicant.GetStudentApplicantDetails(ApplicationID);
            //When existingStudentApplicationID session is not null 
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentApplicant.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentApplicant.FindControl("lblApplicantDetails")).Text = "Complete";
                    ((Label)this.frmStudentApplicant.FindControl("lblApplicantDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }



          //  this.frmStudentAccommodation.GetStudentApplicationAccommodationUnitDetails(ApplicationID);
            //this.frmStudentAccommodation.GetStudentApplicationPropertyUnitTypeDetails(ApplicationID);
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentApplicationAccommodationUnit.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentAccommodation.FindControl("lblAccommodationDetails")).Text = "Complete";
                    ((Label)this.frmStudentAccommodation.FindControl("lblAccommodationDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }


            this.frmStudentParent.GetStudentParentDetails(ApplicationID);
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentParent.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentParent.FindControl("lblParentDetails")).Text = "Complete";
                    ((Label)this.frmStudentParent.FindControl("lblParentDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }


            //this.frmStudentFinancialSponsor.
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentFinancialSponsor.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentFinancialSponsor.FindControl("lblFinancialSponsor")).Text = "Complete";
                    ((Label)this.frmStudentFinancialSponsor.FindControl("lblFinancialSponsor")).ForeColor = System.Drawing.Color.Green;
                }
            }


            this.frmStudentDeclaration.GetStudentDeclaration(ApplicationID);
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentDeclaration.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentDeclaration.FindControl("lblDeclarationDetails")).Text = "Complete";
                    ((Label)this.frmStudentDeclaration.FindControl("lblDeclarationDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }


            //this.frmApplicantEmployment.GetApplicantEmployment(ApplicantID);
            //this.frmApplicantGeneralDetails.GetApplicantGeneralDetails(ApplicantID);
            //int ApplicantSpouseID = 0;
            //ApplicantSpouseID = this.frmApplicantSpouse.GetApplicantSpouse(ApplicantID);
            //this.frmApplicantSpouseEmployment.GetApplicantEmployment(ApplicantSpouseID);
            //this.frmApplicantDeclaration.GetApplicantDeclaration(ApplicantID);
            //this.frmApplicantIncome.GetApplicantIncome(ApplicantID);
            //this.frmApplicantExpenditure.GetApplicantExpenditure(ApplicantID);

            //((HiddenField)this.frmApplicantDocument.FindControl("hfApplicantID")).Value = ApplicantID.ToString();
            //this.frmApplicantDocument.ShowUploadButton();

            //((TextBox)this.frmApplicantDeclaration.FindControl("txtCaptcha")).Visible = false;
            //((ImageButton)this.frmApplicantDeclaration.FindControl("Refresh")).Visible = false;
            //((MSCaptcha.CaptchaControl)this.frmApplicantDeclaration.FindControl("Captcha1")).Visible = false;

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

        protected void btnDeposit_Click(object sender, EventArgs e)
        {

        }

        protected void lnkProofOfDeposit_Click(object sender, EventArgs e)
        {

        }

        protected void imbDownloadApplication_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void hlnkAddLease_Click(object sender, EventArgs e)
        {

        }

        protected void Tab10_Click(object sender, EventArgs e)
        {

        }

        protected void lnkAddStatus_Click(object sender, EventArgs e)
        {

            if (this.txtComment.Value != "")
            {
                sdsStudentApplicationStatusUpdate.InsertParameters["Comment"].DefaultValue = this.txtComment.Value;
                sdsStudentApplicationStatusUpdate.InsertParameters["ApplicationStatusID"].DefaultValue = this.ddlStudentApplicationStatus.SelectedValue;
                sdsStudentApplicationStatusUpdate.InsertParameters["StudentApplicationID"].DefaultValue = Session["StudentApplicationID"].ToString();
                sdsStudentApplicationStatusUpdate.Insert();
                this.gvStudentApplicationStatus.DataBind();

                try
                {
                    if (ddlStudentApplicationStatus.SelectedItem.Text.Equals("Application Successful", StringComparison.OrdinalIgnoreCase))
                    {
                        clSendSMS sms = new clSendSMS();
                        //sms.SendMessage(Mobile.Value, "JOSHCO Ref: " + Session["ApplicationID"].ToString() + " Deposit: " + hDepositAmount.Value + " Acc Number: Test Account" );
                        sms.SendMessage(Mobile.Value, "JOSHCO Ref Number: " + Session["StudentApplicationID"].ToString() + " Amount: " + hDepositAmount.Value + " Number: XXXXX");
                    }
                    else
                    {
                        clSendSMS sms = new clSendSMS();
                        sms.SendMessage(Mobile.Value, "JOSHCO : " + Session["StudentApplicationID"].ToString() + " Status: " + this.ddlStudentApplicationStatus.SelectedItem.Text);
                    }
                }
                catch (Exception)
                {

                }

                try
                {
                    //Application reviewd message
                    //SendUserMail(this.EmailAddress.Value, this.IDNumber.Value, this.Name.Value, this.ddlStudentApplicationStatus.SelectedItem.Text, this.txtComment.Value);
                }
                catch { }

                //if (this.DropDownList1.SelectedValue == "4")
                //{
                //    FillProfile();
                //}

                Response.Redirect("StudentAppProfile.aspx");
                //this.DropDownList1.DataBind();
                //this.txtComment.Value = "";
                //this.DropDownList1.ClearSelection();
            }
            else { showMessageBox("Please enter a comment"); return; }

        }


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


        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
    }
}
    
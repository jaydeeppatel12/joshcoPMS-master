using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class studentAppForm : System.Web.UI.Page
    {
        clStudentApplication StudentApplication = new clStudentApplication();
        clStudentApplicant StudentApplicant = new clStudentApplicant();
        csStudentApplicationAccommodationUnit StudentApplicationAccommodationUnit = new csStudentApplicationAccommodationUnit();
        clStudentParent StudentParent = new clStudentParent();
        clStudentFinancialSponsor StudentFinancialSponsor = new clStudentFinancialSponsor();
        clStudentDeclaration StudentDeclaration = new clStudentDeclaration();
        //clStudentSponsor StudentSponsor = new clStudentSponsor();

        //string strApplicationID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                {
                    Response.Redirect("../logout.aspx");
                }

                this.frmStudentApplicant.Visible = true;
                this.frmStudentAccommodation.Visible = false;
                this.frmStudentParent.Visible = false;
                this.frmStudentFinancialSponsor.Visible = false;
                this.frmStudentDeclaration.Visible = false;

                FillStudentApplicationForm();

                //Check if student application record is registered already
                if (StudentApplicant.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentApplicant.FindControl("lblApplicantDetails")).Text = "Complete";
                    ((Label)this.frmStudentApplicant.FindControl("lblApplicantDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }
        }


        public void FillStudentApplicationForm()
        {
            if (Session["StudentApplicationID"] != null)
            {
                int ExistingStudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"]);

                this.frmStudentApplicant.GetStudentApplicantDetails(ExistingStudentApplicationID);
                this.frmStudentAccommodation.GetStudentApplicationAccommodationUnitDetails(ExistingStudentApplicationID);

                this.frmStudentParent.GetStudentParentDetails(ExistingStudentApplicationID);
                //Financial
                this.frmStudentDeclaration.GetStudentDeclaration(ExistingStudentApplicationID);
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            switch (btnSave.Text.Trim())
            {
                case "Save Applicant Details": //Save Applicant

                    //When existingStudentApplicationID session is not null 
                    if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                    {
                        //Check if student application record is registered already
                        if (StudentApplication.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                        {
                            showMessageBox("Applicant is already registered on this system.");
                            return;
                        }
                    }

                    string EmailAddress = ((TextBox)this.frmStudentApplicant.FindControl("txtStudentEmailAddress")).Text;
                    if (StudentApplicant.CheckEmailAddress(EmailAddress).Rows.Count > 0)
                    {
                        showMessageBox("Email address " + EmailAddress + " already registered with this system please use a different one");
                        return;
                    }

                    string StudentIdentificationNumber = ((TextBox)this.frmStudentApplicant.FindControl("txtStudentIdentificationNumber")).Text;
                    if (StudentApplicant.CheckIdentificationNumber(StudentIdentificationNumber).Rows.Count > 0)
                    {
                        showMessageBox("IdentificationNumber  " + StudentIdentificationNumber + " already registered witonh this system. Please, try again");
                        return;
                    }

                    string ApplicantIDI = this.frmStudentApplicant.SaveStudentApplicant();
                    showMessageBox("Applicant details saved succesfully");
                    break;
                case "Save Accommodation Details":

                    //When studentApplicationID session is not null 
                    if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                    {
                        //Check if student application record is registered already
                        if (StudentApplicationAccommodationUnit.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                        { 
                            showMessageBox("Applicant is already registered with this system.");
                            return;
                        }
                    }

                    this.frmStudentAccommodation.SaveStudentApplicationAccommodationUnit();
                    showMessageBox("Accommodation details saved successfully");
                    break; //Ignore
                case "Save Parent Details":
                    //When StudentApplicationID session is not null 
                    if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                    {
                        //Check and return if student application record is registered already
                        if (StudentParent.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                        {
                            showMessageBox("Applicant is already registered on this system.");
                            return;
                        }
                    }

                    string ParentEmailAddress = ((TextBox)this.frmStudentParent.FindControl("txtEmailAddress")).Text;
                    if (StudentParent.CheckEmailAddress(ParentEmailAddress).Rows.Count > 0)
                    {
                        showMessageBox("Email address " + ParentEmailAddress + " already registered with this system please try again");
                        return;
                    }


                    string ParentIdentificationNumber = ((TextBox)this.frmStudentParent.FindControl("txtIdentificationNumber")).Text;
                    if (StudentParent.CheckIdentificationNumber(ParentIdentificationNumber).Rows.Count > 0)
                    {
                        showMessageBox("IdentificationNumber  " + ParentIdentificationNumber + " already registered with this system. Please, try again");
                        return;
                    }

                    string ApplicantIDP = this.frmStudentParent.SaveStudentParent();
                    showMessageBox("Parent details saved successfully");
                    break;
                case "Save Sponsor Details":
                    //When StudentApplicationID session is not null 
                    if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                    {
                        //Check and return if student application record is registered already
                        if (StudentFinancialSponsor.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                        {
                            showMessageBox("Applicant is already registered on this system.");
                            return;
                        }
                    }

                    string ApplicantIDS = this.frmStudentFinancialSponsor.SaveStudentSponsor();
                    showMessageBox("Sponsor details saved successfully");
                    break; //Ignore
                case "Save Declaration Details":

                    //When existingStudentApplicationID session is not null 
                    if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                    {
                        //Check if student application record is registered already
                        if (StudentDeclaration.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                        {
                            showMessageBox("Student is already registered on this system.");
                            return;
                        }
                    }

                    string ApplicantIDD = this.frmStudentDeclaration.SaveStudentDeclaration();
                    showMessageBox("Declaration details saved successfully");
                    break; //Ignore
                default:
                    //Ignore
                    break;
            }
        }


        protected void btnStudentApplicantDetails_Click(object sender, EventArgs e)
        {
            this.btnSave.Visible = true;
            this.btnSave.Text = "Save Applicant Details";
            this.frmStudentApplicant.Visible = true;
            this.frmStudentAccommodation.Visible = false;
            this.frmStudentParent.Visible = false;
            this.frmStudentFinancialSponsor.Visible = false;
            this.frmStudentDeclaration.Visible = false;
            this.frmStudentOTPVerification.Visible = false;

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
        }

        protected void btnStudentAccommodation_Click(object sender, EventArgs e)
        {
            this.btnSave.Visible = true;
            this.btnSave.Text = "Save Accommodation Details";
            this.frmStudentAccommodation.Visible = true;
            this.frmStudentApplicant.Visible = false;
            this.frmStudentParent.Visible = false;
            this.frmStudentFinancialSponsor.Visible = false;
            this.frmStudentDeclaration.Visible = false;
            this.frmStudentOTPVerification.Visible = false;

         
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentApplicationAccommodationUnit.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentAccommodation.FindControl("lblAccommodationDetails")).Text = "Complete";
                    ((Label)this.frmStudentAccommodation.FindControl("lblAccommodationDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }
        }

        protected void btnStudentParent_Click(object sender, EventArgs e)
        {
            this.btnSave.Visible = true;
            this.btnSave.Text = "Save Parent Details";
            this.frmStudentParent.Visible = true;
            this.frmStudentApplicant.Visible = false;
            this.frmStudentAccommodation.Visible = false;
            this.frmStudentFinancialSponsor.Visible = false;
            this.frmStudentDeclaration.Visible = false;
            this.frmStudentOTPVerification.Visible = false;

            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentParent.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentParent.FindControl("lblParentDetails")).Text = "Complete";
                    ((Label)this.frmStudentParent.FindControl("lblParentDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }
        }

        protected void btnStudentSponsor_Click(object sender, EventArgs e)
        {
            this.btnSave.Visible = true;
            this.btnSave.Text = "Save Sponsor Details";
            this.frmStudentFinancialSponsor.Visible = true;
            this.frmStudentApplicant.Visible = false;
            this.frmStudentAccommodation.Visible = false;
            this.frmStudentParent.Visible = false;
            this.frmStudentDeclaration.Visible = false;
            this.frmStudentOTPVerification.Visible = false;

            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentFinancialSponsor.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                    ((Label)this.frmStudentFinancialSponsor.FindControl("lblFinancialSponsor")).Text = "Complete";
                    ((Label)this.frmStudentFinancialSponsor.FindControl("lblFinancialSponsor")).ForeColor = System.Drawing.Color.Green;
                }
            }
        }


        protected void btnStudentDeclaration_Click(object sender, EventArgs e)
        {

            this.btnSave.Text = "Save Declaration Details";
            this.btnSave.Visible = true;
            this.frmStudentDeclaration.Visible = true;
            this.frmStudentFinancialSponsor.Visible = false;
            this.frmStudentApplicant.Visible = false;
            this.frmStudentAccommodation.Visible = false;
            this.frmStudentParent.Visible = false;
            this.frmStudentOTPVerification.Visible = false;

            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Check if student application record is registered already
                if (StudentDeclaration.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0)
                {
                   ((Label)this.frmStudentDeclaration.FindControl("lblDeclarationDetails")).Text = "Complete";
                    ((Label)this.frmStudentDeclaration.FindControl("lblDeclarationDetails")).ForeColor = System.Drawing.Color.Green;
                }
            }
        }

        protected void btnStudentOTPVerification_Click(object sender, EventArgs e)
        {
            this.frmStudentOTPVerification.Visible = true;
            this.btnSave.Visible = false;
            this.btnSave.Text = "OTP Verification";
            this.frmStudentApplicant.Visible = false;
            this.frmStudentAccommodation.Visible = false;
            this.frmStudentParent.Visible = false;
            this.frmStudentFinancialSponsor.Visible = false;
            this.frmStudentDeclaration.Visible = false;

            this.frmStudentOTPVerification.validateOTPGeneration();           
        }


        protected void btnStudentFinalStep_Click(object sender, EventArgs e)
        {

            this.btnSave.Text = "Final Step";
            this.btnSave.Visible = false;
           this.frmStudentApplicant.Visible = false;
            this.frmStudentAccommodation.Visible = false;
            this.frmStudentParent.Visible = false;
            this.frmStudentFinancialSponsor.Visible = false;
            this.frmStudentDeclaration.Visible = false;
            this.frmStudentOTPVerification.Visible = false;
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




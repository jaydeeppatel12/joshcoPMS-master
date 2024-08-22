using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MSCaptcha;
using System.Data.SqlClient;
using System.Configuration;
using joshcoWA.External.Services;
using System.Threading.Tasks;
using joshcoWA.External.Models;
using System.Data;

namespace joshcoWA.applicant
{
  public partial class appForm : System.Web.UI.Page
  {
    //TpnService _tpnService = new TpnService();
    clApplication appl = new clApplication();
    protected void Page_PreInit(object sender, EventArgs e)
    {
      if (Request.QueryString["a"] != null)
      {
        Session["ApplicationID"] = null;
      }

      if (Session["ApplicationID"] != null)
      {
          if (Session["ApplicationID"].ToString() != "0")
          {
              this.MasterPageFile = "applicant.master";
          }
      }

      if (Session["UserGroupID"] != null)
      {
        if (Session["UserGroupID"].ToString() == "2")
        {
          if (Request.QueryString["admin"] != null)
          {
            this.MasterPageFile = "../application/admin.master";
          }
        }
      }
    }

        //Will get called from Client Side
        //Ensure that you have declared the method like WebMethod
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string CheckIdentityNumber(string IdentityNumber)
        {
            string result = string.Empty;
            //Get your connection string here
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            //Change your query here
            string qry = "Select * from Applicant Where IdentityNumber =" + IdentityNumber;
            SqlDataAdapter da = new SqlDataAdapter(qry, conn);
            //Pass the value to paramter
            da.SelectCommand.Parameters.AddWithValue("@IdentityNumber", IdentityNumber.Trim());
            DataSet ds = new DataSet();
            da.Fill(ds, "ApplicantTable");


            //Check if dataset is having any value
            //if (ds.Tables["ApplicantTable"].Rows.Count > 0)
            //{
            //    // User Name Not Available
            //    result = "Applicant Profile already exists";
            //}
            //else
            //{
            //    //User_Name is available
            //    result = "Applicant Profile does not exists";
            //}
            //Return the result
            return result;
        }
        private void Page_Error(object sender, EventArgs e)
    {
      Exception exc = Server.GetLastError();

      // Handle specific exception.
      //if (exc is HttpUnhandledException)
      {
        showMessageBox("An error occurred on this page. Please verify your " +
        "information to resolve the issue.");
      }
      // Clear the error from the server.
      Server.ClearError();
    }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ApplicationID"] != null)
                {
                    this.btnBegin.Text = "View Application Form";
                    FillApplicationForm();
                }
            }
            //Subscribe to the event of OTP.
            OTP.EnableSubmitApplicationButton += new OTP.ChildControlDelegate(OTP_EnableSubmitApplicationButton);
            OTP.DisableSubmitApplicationButton += new OTP.ChildControlDelegate(OTP_DisableSubmitApplicationButton);          
        }

        //Will execute when the event notification is received from the user control
        void OTP_EnableSubmitApplicationButton()
        {
            btnBegin.Enabled = true;
        }

        void OTP_DisableSubmitApplicationButton()
        {
            btnBegin.Enabled = false;
        }

        public void FillApplicationForm()
        {         

            if (Session["ApplicantID"] != null)
            {
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

                ((DropDownList)this.frmProperty.FindControl("ddlProperty")).DataBind();


                if (Session["PropertyID"] != null)
                {
                    ((DropDownList)this.frmProperty.FindControl("ddlProperty")).SelectedValue = Session["PropertyID"].ToString();
                }
            }          
                        
        }

        protected void btnBegin_Click(object sender, EventArgs e)
        {
            if (((DropDownList)this.frmProperty.FindControl("ddlProperty")).SelectedValue == "0")
            {
                showMessageBox("Please select a property to continue");
                return;
            }
            if (((DropDownList)this.frmProperty.FindControl("ddlPropertyUnit")).SelectedValue == "0"
              || ((DropDownList)this.frmProperty.FindControl("ddlPropertyUnit")).SelectedValue == "")
            {
                showMessageBox("Please select a property unit to continue");
                return;
            }
            //Set rental ammount
            this.frmApplicantExpenditure.GetRentalAmount(Convert.ToInt32(((DropDownList)this.frmProperty.FindControl("ddlPropertyUnit")).SelectedValue));

            if (this.hfIndex.Value == "1" && (((CheckBox)this.frmApplicant.FindControl("chkSMS")).Checked == false && ((CheckBox)this.frmApplicant.FindControl("chkEmail")).Checked == false))
            {
                showMessageBox("Please tick notification SMS/Email");
                return;
            }


            if (this.hfIndex.Value == "1" && (((TextBox)this.frmApplicant.FindControl("txtEmailAddress")).Text == "" && ((CheckBox)this.frmApplicant.FindControl("chkEmail")).Checked == true))
            {
                showMessageBox("Please enter email address");
                return;
            }

            string EmailAddress = ((TextBox)this.frmApplicant.FindControl("txtEmailAddress")).Text;
            if (this.hfIndex.Value == "1" && appl.CheckEmailAddress(EmailAddress).Rows.Count > 0)
            {
                showMessageBox("Email address " + EmailAddress + " already registered please use a different one");
                return;
            }

            string CellphoneNo = ((TextBox)this.frmApplicant.FindControl("txtMobileNumber")).Text;
            if (this.hfIndex.Value == "1" && appl.CheckCellphoneNo(CellphoneNo).Rows.Count > 0)
            {
                showMessageBox("Cellphone no. " + CellphoneNo + " already registered please use a different one");
                return;
            }

            //Validate Salary threshhold
            string ApplicantGrossSalary = ((TextBox)this.frmApplicantEmployment.FindControl("txtGrossSalary")).Text;
            if (this.hfIndex.Value == "2" && Convert.ToDouble(ApplicantGrossSalary, System.Globalization.CultureInfo.InvariantCulture) > Convert.ToDouble(ConfigurationManager.AppSettings["MaxSalaryAllowed"]))
            {
                showMessageBox("Our properties are limited to people earning R22000 or less per month. Gross salary of R" + ApplicantGrossSalary + " is more than the required maximum limit.");
                return;
            }


            //Validate Salary threshhold
            string ApplicantSpouseGrossSalary = ((TextBox)this.frmApplicantSpouseEmployment.FindControl("txtGrossSalary")).Text;
            if (this.hfIndex.Value == "5" && Convert.ToDouble(ApplicantSpouseGrossSalary, System.Globalization.CultureInfo.InvariantCulture) > Convert.ToDouble(ConfigurationManager.AppSettings["MaxSalaryAllowed"]))
            {
                showMessageBox("Our properties are limited to people earning R22000 or less per month. Groce salary of R" + ApplicantSpouseGrossSalary + " is more than the required maximum limit.");
                return;
            }


            if (this.btnBegin.Text == "Submit Application")
            {
                if (((CheckBox)this.frmApplicantDeclaration.FindControl("chkDeclaration1")).Checked == false || ((CheckBox)this.frmApplicantDeclaration.FindControl("chkDeclaration2")).Checked == false || ((CheckBox)this.frmApplicantDeclaration.FindControl("chkDeclaration3")).Checked == false)
                {
                    showMessageBox("***Please tick declarations to continue");
                    return;
                }

                string Name = "", IDnumber = "";


                try
                {
                    ((MSCaptcha.CaptchaControl)this.frmApplicantDeclaration.FindControl("Captcha1")).ValidateCaptcha(((TextBox)this.frmApplicantDeclaration.FindControl("txtCaptcha")).Text.Trim());
                }
                catch
                {
                    showMessageBox("Please refresh Captcha");
                    return;
                }

                if (((MSCaptcha.CaptchaControl)this.frmApplicantDeclaration.FindControl("Captcha1")).UserValidated)
                {
                }
                else
                {
                    showMessageBox("Sorry InValid Captcha");
                    return;
                }

                if (((HiddenField)this.OTP.FindControl("hfOTPPassed")).Value != "Passed")
                {
                    frmApplicantDeclaration.Visible = false;
                    this.OTP.Visible = true;
                    this.OTP.GenerateOTP(((TextBox)this.frmApplicant.FindControl("txtMobileNumber")).Text);
                    // btnBegin.Enabled = false;                    
                }
                else
                {
                    // btnBegin.Enabled = true;//When OTP is Valid to allow form submission
                    string propertyUnitID = ((DropDownList)this.frmProperty.FindControl("ddlPropertyUnit")).SelectedValue;
                    string ApplicantID = "", ApplicationID = "", PropertyID = "", ApplicantEmploymentID = "", ApplicantSpouseID = "", ApplicantSpouseEmploymentID = "", ApplicantDeclarationID = "", ApplicantIncomeID = "", ApplicantExpenditureID = "";
                    ApplicantID = this.frmApplicant.SaveApplicant();
                    PropertyID = ((DropDownList)this.frmProperty.FindControl("ddlProperty")).SelectedValue;
                    ApplicationID = this.frmApplicant.SaveApplication(ApplicantID, PropertyID, propertyUnitID);

                    ApplicantEmploymentID = this.frmApplicantEmployment.SaveApplicantEmployment(ApplicantID);
                    ApplicantSpouseID = this.frmApplicantSpouse.SaveApplicantSpouse(ApplicantID);
                    ApplicantSpouseEmploymentID = this.frmApplicantSpouseEmployment.SaveApplicantSpouseEmployment(ApplicantSpouseID);

                    ApplicantSpouseID = this.frmApplicantGeneralDetails.SaveApplicantGeneralDetails(ApplicantID);

                    ApplicantIncomeID = this.frmApplicantIncome.SaveApplicantIncome(ApplicantID);

                    ApplicantExpenditureID = this.frmApplicantExpenditure.SaveApplicantExpenditure(ApplicantID);

                    ApplicantDeclarationID = this.frmApplicantDeclaration.SaveApplicantDeclaration(ApplicantID);


                    Session["ApplicantID"] = ApplicantID;

                    this.frmApplicantDocument.UploadFiles();

                    this.OTP.Visible = false;
                    frmApplicantFinish.Visible = true;
                    frmApplicantDeclaration.Visible = false;
                    this.btnBegin.Visible = false;
                    this.btnBack.Visible = false;
                    this.lblIndex.Visible = false;


                    Name = ((TextBox)this.frmApplicant.FindControl("txtFullName")).Text;
                    IDnumber = ((TextBox)this.frmApplicant.FindControl("txtIdentityNumber")).Text;

                    //Do tpn enquiry
                    //Task.Run(() => TpnEnquiry(Convert.ToInt32(ApplicationID)));

                   // bool statusUpdated = TpnEnquiry(Convert.ToInt32(ApplicationID));


                    if (((CheckBox)this.frmApplicant.FindControl("chkEmail")).Checked == true)
                    {
                        try { SendUserMail(EmailAddress, Name, IDnumber); }
                        catch { }
                    }

                    string cellphoneNo = ((TextBox)this.frmApplicant.FindControl("txtMobileNumber")).Text;
                    //  string AppRef = ((Label)this.frmApplicant.FindControl("lblRefNo")).Text;
                    string AppRef = ((Label)this.frmApplicant.FindControl("lblReferenceNo")).Text;

                    if (((CheckBox)this.frmApplicant.FindControl("chkSMS")).Checked == true)
                    {
                        try
                        {
                            clSendSMS sendmail = new clSendSMS();

                            string mailbody = "";
                            mailbody += "JOSHCO Application received successfully, App Ref: " + AppRef;

                            sendmail.SendMessage(cellphoneNo, mailbody);

                            var deposit = this.frmApplicantExpenditure.GetRent(ApplicantID) ;

                            //if (statusUpdated)
                            //{
                            //    sendmail.SendMessage(cellphoneNo, "JOSHCO Ref Number: " + AppRef + " Amount: " + deposit + " Number: XXXXX");
                            //}

                        }
                        catch
                        {

                        }
                    }
                }

                return;
            }

            if (this.hfIndex.Value == "8")
            {
                foreach (GridViewRow row in ((GridView)this.frmApplicantDocument.FindControl("gvDocument")).Rows)
                {

                    if (((Label)row.FindControl("lblRequired")).Visible == true && ((HiddenField)row.FindControl("hfUploadname")).Value == "")
                    {
                        ((Label)row.FindControl("lblRequired")).Text = "** Required";
                        return;
                    }
                }
            }

            UserControl[] formPages = { frmProperty, frmApplicant, frmApplicantEmployment, frmApplicantGeneralDetails, frmApplicantSpouse, frmApplicantSpouseEmployment, frmApplicantIncome, frmApplicantExpenditure, frmApplicantDocument, frmApplicantDeclaration };
            this.hfIndex.Value = Convert.ToString(Convert.ToInt32(this.hfIndex.Value) + 1);


            if (this.hfIndex.Value != formPages.Length.ToString())
            {
                if (((DropDownList)this.frmApplicant.FindControl("cboMaritalStatusID")).SelectedItem.Text == "Single" && this.hfIndex.Value == "4")
                {
                    this.hfIndex.Value = Convert.ToString(Convert.ToInt32(this.hfIndex.Value) + 2);
                }

                this.lblIndex.Text = "Showing (" + this.hfIndex.Value + "/9)";
                this.btnBegin.Text = "Next >>";
                this.btnBack.Visible = true;
                this.frmApplicant.Visible = true;
                this.frmProperty.Visible = false;

                for (int i = 1; i <= formPages.Length - 1; i++)
                {
                    if (this.hfIndex.Value == i.ToString())
                    {
                        formPages[i].Visible = true;
                        this.btnBegin.ValidationGroup = formPages[i].ID;
                    }
                    else
                    {
                        formPages[i].Visible = false;
                    }
                }

                if (this.hfIndex.Value == "9")
                {
                    if (Session["ApplicationID"] != null)
                    {
                        this.btnBegin.Visible = false;
                    }
                    else
                    {
                        this.btnBegin.Text = "Submit Application";
                    }
                }
            }
            else { this.btnBegin.Text = "Submit Application"; }
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
        }

    protected void SendUserMail(string emailAddress, string name, string password)
    {
      clSendEmail sendmail = new clSendEmail();

      string mailbody = "";
      //mailbody += "To finalise your application process please upload the following documents  </br> ";
      //mailbody += "- Copy of your ID or Passport </br> ";
      //mailbody += "- Proof of your current residence </br> ";
      //mailbody += "- Copy of your recent payslip </br> ";
      //mailbody += "- Copy of your 3 months most recent bank statement ";
      //mailbody += "</br></br> ";

      mailbody += "Please use the details below to access your application online and upload documents </br></br> ";
      mailbody += "Url: <a href='" + ConfigurationManager.AppSettings["AppStatusLink"] + "' >Application form</a> </br></br>";
      mailbody += "Email Address: " + emailAddress + " </br> ";
      mailbody += "ID / Passport No: " + password + " </br></br> ";

      sendmail.SendMail(emailAddress, name, "Joshco: Application", mailbody, "");
    }

    public void showMessageBox(string message)
    {
      string sScript = null;
      message = message.Replace("'", "\\'");
      sScript = string.Format("alert('{0}');", message);
      ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
    }

        protected void btnBback_Click(object sender, EventArgs e)
        {
            this.btnBegin.Enabled = true;
            UserControl[] formPages = { frmProperty, frmApplicant, frmApplicantEmployment, frmApplicantGeneralDetails, frmApplicantSpouse, frmApplicantSpouseEmployment, frmApplicantIncome, frmApplicantExpenditure, frmApplicantDocument, frmApplicantDeclaration };
            this.hfIndex.Value = Convert.ToString(Convert.ToInt32(this.hfIndex.Value) - 1);

            if (this.hfIndex.Value != "0")
            {
                if (((DropDownList)this.frmApplicant.FindControl("cboMaritalStatusID")).SelectedItem.Text == "Single" && this.hfIndex.Value == "5")
                {
                    this.hfIndex.Value = Convert.ToString(Convert.ToInt32(this.hfIndex.Value) - 2);
                }

                this.lblIndex.Text = "Showing (" + this.hfIndex.Value + "/9)";
                this.btnBegin.Text = "Next";
                this.btnBegin.Visible = true;

                for (int i = 1; i <= formPages.Length - 1; i++)
                {
                    if (this.hfIndex.Value == i.ToString())
                    {
                        formPages[i].Visible = true;
                        this.btnBegin.ValidationGroup = formPages[i].ID;
                    }
                    else
                    {
                        formPages[i].Visible = false;
                    }
                }
            }
            else
            {
                if (Session["ApplicationID"] != null)
                {
                    this.btnBegin.Text = "View Application";
                    this.btnBack.Visible = false;
                    this.frmApplicant.Visible = false;
                    this.frmProperty.Visible = true;
                    this.lblIndex.Text = "";
                }
                else
                {
                    this.btnBegin.Text = "Start Application";
                    this.btnBack.Visible = false;
                    this.frmApplicant.Visible = false;
                    this.frmProperty.Visible = true;
                    this.lblIndex.Text = "";
                }
            }
        }

    //private bool TpnEnquiry(int applicationId)
    //{ 
    //  return _tpnService.ExecuteTenantTpnCheck(
    //    new TpnRequest
    //    {          
    //      SecurityCode = ConfigurationManager.AppSettings["TpnUsername"],
    //      Password = ConfigurationManager.AppSettings["TpnPassword"],
    //      LoginCode = ConfigurationManager.AppSettings["TpnLoginCode"],
    //      SurName = "Burger",
    //      FirstName = "Chris",
    //      //Personal Details
    //      ContactName = "Justin Bez",
    //      ContactNumber = "0821234567",
    //      AddressLine = "74 Test Street",
    //      Suburb = "Test Park",
    //      Province = "",
    //      NationalID = "7707077777087",
    //      //Bank
    //      Bank = "Capitec",
    //      BranchCode = "74001",
    //      AccountHolder = "Tester",
    //      AccountType = "Savings",
    //      AccountNumber = "123456773424",
    //      CreditAmount = 0,
    //      Terms = "No terms",
    //      ApplicationID = applicationId
          
    //    });
    //}
  }
}

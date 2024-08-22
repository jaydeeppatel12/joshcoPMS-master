using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class StudentOTPVerification : System.Web.UI.UserControl
    {

        clStudentApplicant StudentApplicant = new clStudentApplicant();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //
                
            }
        }

        public void validateOTPGeneration()
        {
            if (!string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
            {
                //Get student_applicant Details                     
                DataTable dt = new DataTable();
                StudentApplicant.StudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"].ToString());
                dt = StudentApplicant.GetStudentApplicantDetails();


                if (dt.Rows.Count > 0)
                {
                    bool isStudentOTPVerified = (dt.Rows[0]["StudentIsOTPVerified"] != DBNull.Value ? bool.Parse(dt.Rows[0]["StudentIsOTPVerified"].ToString()) : false);
                    hfCellphoneNo.Value = dt.Rows[0]["StudentMobileNumber"].ToString();
                    hfStudentApplicantID.Value = dt.Rows[0]["StudentApplicantID"].ToString();

                    if (isStudentOTPVerified)
                    {
                        btnOTP.Enabled = false;
                        lblReSend.Enabled = false;
                        lblMessage.Text = "Transaction was OTP validated!";
                        lblMessage.ForeColor = Color.Green;

                        lblOTPVerificationDetails.Text = "Complete";
                        lblOTPVerificationDetails.ForeColor = Color.Green;
                        return;
                    }

                    btnOTP.Enabled = true;
                    lblReSend.Enabled = true;
                    lblMessage.Text = "";
                    GenerateOTP(hfCellphoneNo.Value);
                }
                else
                {
                    btnOTP.Enabled = false;
                    lblReSend.Enabled = false;
                    lblMessage.Text = "Applicant does not exist. Please add Applicant details and Try again";
                    lblMessage.ForeColor = Color.Red;
                }
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }

        public void GenerateOTP(string cellphoneNo)
        {
            this.lblCellNo.Text = cellphoneNo;
            this.hfCellphoneNo.Value = cellphoneNo;

            Random rnd = new Random();
            this.hfOTP.Value = (rnd.Next(100000, 999999)).ToString();
            this.hfOTPTime.Value = DateTime.Now.ToString();

            clSendSMS sendmail = new clSendSMS();

            string mailbody = "";
            mailbody += "JOSHCO application OTP: " + this.hfOTP.Value;

            sendmail.SendMessage(cellphoneNo, mailbody);           
        }

               
        protected void btnOTP_Click(object sender, EventArgs e)
        {
            btnOTP.Enabled = true;
            lblReSend.Enabled = true;

            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "";

            if (this.txtOTP.Text != "")
            {
                if (this.hfOTP.Value != "" && this.hfOTPTime.Value != "")
                {
                    TimeSpan timeSub = DateTime.Now - Convert.ToDateTime(hfOTPTime.Value);
                    if (timeSub.TotalMinutes < 300)
                    {
                        if (this.txtOTP.Text == this.hfOTP.Value)
                        {
                            this.hfOTPPassed.Value = "Passed";

                            lblMessage.ForeColor = Color.Green;
                            lblMessage.Text = "Your OTP is valid. Please continue with your application ";
                            btnOTP.Enabled = false;
                            lblReSend.Enabled = false;

                            //UpdateOTPVerified
                            StudentApplicant.StudentApplicantID = Int32.Parse(hfStudentApplicantID.Value);
                            StudentApplicant.StudentIsOTPVerified = true;
                           string ID =  StudentApplicant.UpdateOTPVerified();

                            lblOTPVerificationDetails.Text = "Completed";
                            lblOTPVerificationDetails.ForeColor = Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "Invalid OTP entered.";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Your OTP has expired. Get a new one.";
                    }
                }
                else
                {
                    lblMessage.Text = "We could not validate you OTP. Please generate a new one.";
                }
            }
            else
            {
                lblMessage.Text = "OTP missing. Please try again.";
            }
        }

        protected void lblReSend_Click(object sender, EventArgs e)
        {
            GenerateOTP(this.hfCellphoneNo.Value);
        }

    }
}

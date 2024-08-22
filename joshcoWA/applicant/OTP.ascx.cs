using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class OTP : System.Web.UI.UserControl
    {
        public delegate void ChildControlDelegate();

        /// <summary>
        /// Events to which the Parent page will subscribe 
        /// </summary>
        public event ChildControlDelegate EnableSubmitApplicationButton;
        public event ChildControlDelegate DisableSubmitApplicationButton;

        protected void Page_Load(object sender, EventArgs e)
        {

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

            //Execute the event 
            if (DisableSubmitApplicationButton != null)
            {
                DisableSubmitApplicationButton();
            }
        }

        protected void btnOTP_Click(object sender, EventArgs e)
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "";

            //Execute the event 
            if (DisableSubmitApplicationButton != null)
            {
                DisableSubmitApplicationButton();
            }

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
                            lblMessage.Text = "OTP valid. Click submit application button to continue.";

                            //Execute the event 
                            if (EnableSubmitApplicationButton != null)
                            {
                                EnableSubmitApplicationButton();
                            }
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
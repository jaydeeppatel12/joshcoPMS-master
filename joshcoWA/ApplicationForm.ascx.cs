using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;

namespace joshcoWA
{
    public partial class ApplicationForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCountry.DataSource = CountryList();
                ddlCountry.DataBind();
                ddlCountry.SelectedValue = "South Africa";
                Same(); }
        }
        public static List<string> CountryList()
        {
            //Creating list
            List<string> CultureList = new List<string>();

            //getting  the specific  CultureInfo from CultureInfo class
            CultureInfo[] getCultureInfo = CultureInfo.GetCultures(CultureTypes.SpecificCultures);

            foreach (CultureInfo getCulture in getCultureInfo)
            {
                //creating the object of RegionInfo class
                RegionInfo GetRegionInfo = new RegionInfo(getCulture.LCID);
                //adding each county Name into the arraylist
                if (!(CultureList.Contains(GetRegionInfo.EnglishName)))
                {
                    CultureList.Add(GetRegionInfo.EnglishName);
                }
            }
            //sorting array by using sort method to get countries in order
            CultureList.Sort();
            //returning country list
            return CultureList;
        }

        protected void RefreshImage(object sender, EventArgs e)
        {
            //Call UserValidated function to refresh, as validation will be false image get's refreshed
            var Refesh = Captcha1.UserValidated;

        }

        public void Same()
        {
            String AddScript = "";
            AddScript = "var txt1 = document.getElementById('" + this.txtPostalAddress.ClientID + "');" +
            "var txt2 = document.getElementById('" + this.txtPostalAddressCode.ClientID + "');" +
            "var txt3 = document.getElementById('" + this.txtPhysicalAddress.ClientID + "');" +
            "var txt4 = document.getElementById('" + this.txtPhysicalAddressCode.ClientID + "');" +
            " txt1.value = txt3.value ;" +
            " txt2.value = txt4.value ;";
            this.hlnkSame1.Attributes.Add("onclick", AddScript);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.ddlProperty.SelectedValue == "0")
            {
                showMessageBox("Please select a property");
                return;
            }

            if (!this.chkCheck1.Checked)
            {
                showMessageBox("Credit check not checked");
                return;
            }

            if (!this.chkCheck2.Checked)
            {
                showMessageBox("Declaration not checked");
                return;
            }

            try
            {
                Captcha1.ValidateCaptcha(TextBox1.Text.Trim());
            }
            catch
            {
                showMessageBox("Please refresh Captcha");
                return;
            }

            //if valid code is entered
            if (Captcha1.UserValidated)
            {
            }
            else
            {
                showMessageBox("Sorry! InValid Captcha");
                return;
            }


            if (this.hfApplicationID.Value == "" || this.hfApplicationID.Value == "0")
            {
                DataView dv;
                dv = (DataView)this.sdsCheckEmailAddress.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count > 0)
                {
                    showMessageBox("Email address already registered please use a different one");
                    return;
                }

                this.sdsApplication.InsertParameters["Title"].DefaultValue = this.txtTitle.Value;
                this.sdsApplication.InsertParameters["Name"].DefaultValue = this.txtName.Value;
                this.sdsApplication.InsertParameters["Surname"].DefaultValue = this.txtSurname.Value;
                this.sdsApplication.InsertParameters["IDNumber"].DefaultValue = this.txtIDnumber.Value;
                this.sdsApplication.InsertParameters["MaritalStatus"].DefaultValue = this.rblMaritalStatus.SelectedValue;
                this.sdsApplication.InsertParameters["Gender"].DefaultValue = this.male.Checked ? "male" : (this.female.Checked ? "female" : "");
                this.sdsApplication.InsertParameters["Nationality"].DefaultValue = this.ddlCountry.SelectedValue;
                this.sdsApplication.InsertParameters["Telephone"].DefaultValue = this.txtTelephone.Value;
                this.sdsApplication.InsertParameters["Mobile"].DefaultValue = this.txtMobileNumber.Value;
                this.sdsApplication.InsertParameters["Fax"].DefaultValue = this.txtFaxNumber.Value;
                this.sdsApplication.InsertParameters["EmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsApplication.InsertParameters["Address"].DefaultValue = this.txtPostalAddress.Value;
                this.sdsApplication.InsertParameters["AddressCode"].DefaultValue = this.txtPostalAddressCode.Value;
                this.sdsApplication.InsertParameters["PhysicalAddress"].DefaultValue = this.txtPhysicalAddress.Value;
                this.sdsApplication.InsertParameters["PhysicalAddressCode"].DefaultValue = this.txtPhysicalAddressCode.Value;
                this.sdsApplication.InsertParameters["PropertyID"].DefaultValue = this.ddlProperty.SelectedValue;
                this.sdsApplication.InsertParameters["SMSNotification"].DefaultValue = this.chkSMS.Checked.ToString() == "True" ? "1" : "0";
                this.sdsApplication.InsertParameters["EmailNotification"].DefaultValue = this.chkEmail.Checked.ToString() == "True" ? "1" : "0";
                this.sdsApplication.InsertParameters["DoCreditCheck"].DefaultValue = this.chkCheck1.Checked.ToString() == "True" ? "1" : "0";
                this.sdsApplication.InsertParameters["CreditCheckStatus"].DefaultValue = this.chkCheck2.Checked.ToString() == "True" ? "1" : "0";



                this.sdsApplication.Insert();

                try { SendUserMail(this.txtEmailAddress.Value, this.txtName.Value, this.txtIDnumber.Value); }
                catch { }

                //Response.Redirect("ApplicationDetails.aspx?a=a");
            }
            else
            {
                this.sdsApplication.UpdateParameters["Title"].DefaultValue = this.txtTitle.Value;
                this.sdsApplication.UpdateParameters["Name"].DefaultValue = this.txtName.Value;
                this.sdsApplication.UpdateParameters["Surname"].DefaultValue = this.txtSurname.Value;
                this.sdsApplication.UpdateParameters["IDNumber"].DefaultValue = this.txtIDnumber.Value;
                this.sdsApplication.UpdateParameters["MaritalStatus"].DefaultValue = this.rblMaritalStatus.SelectedValue;
                this.sdsApplication.UpdateParameters["Gender"].DefaultValue = this.male.Checked ? "male" : (this.female.Checked ? "female" : "");
                this.sdsApplication.UpdateParameters["Nationality"].DefaultValue = this.ddlCountry.SelectedValue;
                this.sdsApplication.UpdateParameters["Telephone"].DefaultValue = this.txtTelephone.Value;
                this.sdsApplication.UpdateParameters["Mobile"].DefaultValue = this.txtMobileNumber.Value;
                this.sdsApplication.UpdateParameters["Fax"].DefaultValue = this.txtFaxNumber.Value;
                this.sdsApplication.UpdateParameters["EmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsApplication.UpdateParameters["Address"].DefaultValue = this.txtPostalAddress.Value;
                this.sdsApplication.UpdateParameters["AddressCode"].DefaultValue = this.txtPostalAddressCode.Value;
                this.sdsApplication.UpdateParameters["PhysicalAddress"].DefaultValue = this.txtPhysicalAddress.Value;
                this.sdsApplication.UpdateParameters["PhysicalAddressCode"].DefaultValue = this.txtPhysicalAddressCode.Value;
                this.sdsApplication.UpdateParameters["PropertyID"].DefaultValue = this.ddlProperty.SelectedValue;
                this.sdsApplication.UpdateParameters["SMSNotification"].DefaultValue = this.chkSMS.Checked.ToString() == "True" ? "1" : "0";
                this.sdsApplication.UpdateParameters["EmailNotification"].DefaultValue = this.chkEmail.Checked.ToString() == "True" ? "1" : "0";
                this.sdsApplication.UpdateParameters["ApplicationID"].DefaultValue = this.hfApplicationID.Value;

                this.sdsApplication.Update();
                showMessageBox("Updated successfully");
            }

            Response.Redirect("appList.aspx");

        }



        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void sdsApplication_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            hfApplicationID.Value = e.Command.Parameters["@ApplicationID"].Value.ToString();
            Session["ApplicationID"] = e.Command.Parameters["@ApplicationID"].Value.ToString();
        }

        protected void SendUserMail(string emailAddress, string name, string password)
        {
            clSendEmail sendmail = new clSendEmail();

            string mailbody = "";
            mailbody += "To finalise your application process please upload the following documents  </br> ";
            mailbody += "- Copy of your ID or Passport </br> ";
            mailbody += "- Proof of your current residence </br> ";
            mailbody += "- Copy of your recent payslip </br> ";
            mailbody += "- Copy of your 3 months most recent bank statement ";
            mailbody += "</br></br> ";
            mailbody += "Please use the details below to access your application online and upload documents </br></br> ";
            mailbody += "Url: <a href='http://www.quickpropsys.com/joshco/searchapplication.aspx' >Application form</a> </br></br>";
            mailbody += "Email Address: " + emailAddress + " </br> ";
            mailbody += "ID / Passport No: " + password + " </br></br> ";

            sendmail.SendMail(emailAddress, name, "Joshco: Application", mailbody, "");
        }

        protected void ddlPropertyTyepe_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlProperty.Items.Clear();
            this.ddlProperty.Items.Add(new ListItem("--", "0"));

            this.sdsProperty.DataBind();
            this.ddlProperty.DataBind();
        }
    }
}
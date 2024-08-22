using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace joshcoWA
{
    public partial class application : System.Web.UI.Page
    {
        csProperty csP = new csProperty();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["ApplicationID"] != null)
            {
                this.MasterPageFile = "application.master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // FillCapctha();
                ddlCountry.DataSource = CountryList();
                ddlCountry.DataBind();
                ddlCountry.SelectedValue ="South Africa";

                if(Request.QueryString["ID"] != null)
                {
                    this.ddlProperty.SelectedValue = Request.QueryString["ID"];
                }

                if (Session["ApplicationID"] != null)
                {
                    FillProfile();
                }

                Same(); }
        }


        protected void RefreshImage(object sender, EventArgs e)
        {
            //Call UserValidated function to refresh, as validation will be false image get's refreshed
            var Refesh = Captcha1.UserValidated;

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

        //void FillCapctha()
        //{
        //    //try
        //    {
        //        Random random = new Random();
        //        string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        //        StringBuilder captcha = new StringBuilder();
        //        for (int i = 0; i < 6; i++)
        //        {
        //            captcha.Append(combination[random.Next(combination.Length)]);
        //            Session["captcha"] = captcha.ToString();
        //            this.lblCaptcha.Text = captcha.ToString();
        //            //imgCaptcha.ImageUrl = "appForm.aspx?" + DateTime.Now.Ticks.ToString();
        //        }
        //    }
        //    //catch
        //    //{
        //    //    throw;
        //    //}
        //}

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
           // FillCapctha();
        }

        public void FillPropertyProfile(string PropertyID)
        {
            if (PropertyID != "0")
            { PropertyProfile.Visible = true; AboutJoshco.Visible = false; }
            else { PropertyProfile.Visible = false; AboutJoshco.Visible = true; }

            DataTable dt = new DataTable();

            dt = csP.GetProperty(PropertyID);

            if (dt.Rows.Count > 0)
            {
               // this.lblPropertyName.Text = dt.Rows[0]["PropertyName"].ToString();
           
                //this.lblDes.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["AddressCode"].ToString();

                if (File.Exists(Server.MapPath("~/propertypic/" + PropertyID + ".jpg")))
                {
                    this.Image1.ImageUrl = "~/propertypic/" + PropertyID + ".jpg";
                }

                this.lblTelephone.Text = dt.Rows[0]["Telephone"].ToString();
                this.lblContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                this.lblFaxNo.Text = dt.Rows[0]["Fax"].ToString();
                this.lblEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                this.lblPostalAddress.Text = dt.Rows[0]["PostalAddress"].ToString() + ", " + dt.Rows[0]["PostalAddressCode"].ToString();
                this.lblLat.Text = dt.Rows[0]["Lat"].ToString();
                this.lblLong.Text = dt.Rows[0]["Long"].ToString();
                this.lblPhysicalAddress.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["AddressCode"].ToString();
                this.lblArea.Text = dt.Rows[0]["PropertyArea"].ToString();
                //this.lblCity.Text = dt.Rows[0]["CityOrTown"].ToString();
                this.lblErf.Text = dt.Rows[0]["ErfNo"].ToString();
                this.lblPortion.Text = dt.Rows[0]["PortionNo"].ToString();
            }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsApplicationProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            { 
                if (dt.Rows[0]["ApplicationSuccessful"].ToString() != "0")
                {
                    this.Button1.Visible = false;
                }

                this.hfApplicationID.Value = dt.Rows[0]["ApplicationID"].ToString();
                this.ddlProperty.SelectedValue = dt.Rows[0]["PropertyID"].ToString();
     
                this.txtName.Value = dt.Rows[0]["Name"].ToString();

                this.txtSurname.Value = dt.Rows[0]["Surname"].ToString();
                this.txtIDnumber.Value = dt.Rows[0]["IDNumber"].ToString();
                //((RadioButtonList)ApplicationForm1.FindControl("rblGender")).SelectedValue = dt.Rows[0]["Gender"].ToString();
                this.txtTelephone.Value = dt.Rows[0]["Telephone"].ToString();
                this.txtMobileNumber.Value = dt.Rows[0]["Mobile"].ToString();
                this.txtFaxNumber.Value = dt.Rows[0]["Fax"].ToString();
                this.txtEmailAddress.Value = dt.Rows[0]["EmailAddress"].ToString();
                this.lblAppEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString(); 
                this.txtPostalAddress.Value = dt.Rows[0]["Address"].ToString();
                this.txtPostalAddressCode.Value = dt.Rows[0]["AddressCode"].ToString();
                this.txtPhysicalAddress.Value = dt.Rows[0]["PhysicalAddress"].ToString();
                this.txtPhysicalAddressCode.Value = dt.Rows[0]["PhysicalAddressCode"].ToString();
                
                this.ddlCountry.SelectedValue = dt.Rows[0]["Nationality"].ToString();
                //((RadioButtonList)ApplicationForm1.FindControl("rblMaritalStatus")).Text = dt.Rows[0]["MaritalStatus"].ToString();
                this.chkSMS.Checked = Convert.ToBoolean(dt.Rows[0]["SMSNotification"].ToString());
                this.chkEmail.Checked = Convert.ToBoolean(dt.Rows[0]["EmailNotification"].ToString());
                this.chkCheck1.Checked = true;
                this.chkCheck2.Checked = true;

                this.txtTitle.Value = "Title";
 
            }
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
            //SendSMS(this.txtMobileNumber.Value);
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

  
            if (this.ddlProperty.SelectedValue=="0")
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
                this.sdsApplication.InsertParameters["Gender"].DefaultValue = this.male.Checked?"male":(this.female.Checked?"female":"");
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

                Response.Redirect("appStatus.aspx?a=a");
            }
            else
            {
                DataView dv;
                dv = (DataView)this.sdsCheckEmailAddress.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count > 0 && (this.lblAppEmailAddress.Text != this.txtEmailAddress.Value))
                {
                    showMessageBox("Email address already registered please use a different one");
                    return;
                }

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
        protected void SendSMS(string cellphoneNo)
        {
            //clSendSMS sendmail = new clSendSMS();

            //string mailbody = "";
            //mailbody += "Application Received";
            ////: http://www.quickpropsys.com/joshco/searchapplication.aspx
            //sendmail.SendSMS(cellphoneNo, mailbody);
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

        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillPropertyProfile(this.ddlProperty.SelectedValue);
        }

 

    }
}
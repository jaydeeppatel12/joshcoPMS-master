using AjaxControlToolkit;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using joshcoWA.user;

namespace joshcoWA
{
    public partial class addUser : System.Web.UI.UserControl
    {
        clUser usr = new clUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
       
            }
        }

        public void FillUser()
        {
            DataView dv;
            dv = (DataView)this.sdsUser.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                //this.lblTenName.Text = dt.Rows[0]["LesseeName"].ToString();
                this.txtName.Value = dt.Rows[0]["UserFirstName"].ToString();
                this.txtSurname.Value = dt.Rows[0]["UserSurname"].ToString();
                this.txtEmailAddress.Value = dt.Rows[0]["UserEmailAddress"].ToString();
                this.txtContactNumber.Value = dt.Rows[0]["UserContactNo"].ToString();
                this.rblAcive.SelectedValue = dt.Rows[0]["UserActive"].ToString();

                this.hfEmailAddress.Value = dt.Rows[0]["UserEmailAddress"].ToString();

                this.lblPassword.Visible = false;
                this.lblRePassword.Visible = false;
                this.txtPassword.Visible = false;
                this.txtRePassword.Visible = false;
            }
        }

        public void ClearFields()
        {
            this.hfUserID.Value = "";
            this.txtName.Value = "";
            this.txtSurname.Value = "";
            this.txtEmailAddress.Value = "";
            this.txtContactNumber.Value = "";
            this.rblAcive.SelectedValue = "";
            this.ddlTenant.ClearSelection();
            this.ddlTenant.Enabled = true;

            this.lblPassword.Visible = true;
            this.lblRePassword.Visible = true;
            this.txtPassword.Visible = true;
            this.txtRePassword.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (usr.CheckEmailAddress(this.txtEmailAddress.Value).Rows.Count > 0 && (this.txtEmailAddress.Value != this.hfEmailAddress.Value))
            {
                showMessageBox("Email address " + this.txtEmailAddress.Value + " already registered please use a different one");
                return;
            }

            if (this.txtName.Value != "")
            {
                if (this.hfUserID.Value == "" || this.hfUserID.Value == "0")
                {
                    if (this.ddlTenant.SelectedValue == "0")
                    {
                        showMessageBox("Please select a tenant to continue");
                        return;
                    }


                    this.sdsUser.InsertParameters["UserFirstName"].DefaultValue = this.txtName.Value;
                    this.sdsUser.InsertParameters["UserSurname"].DefaultValue = this.txtSurname.Value;
                    this.sdsUser.InsertParameters["UserEmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                    this.sdsUser.InsertParameters["UserContactNo"].DefaultValue = this.txtContactNumber.Value;
                    this.sdsUser.InsertParameters["UserGroupID"].DefaultValue = "1";
                    this.sdsUser.InsertParameters["UserActive"].DefaultValue = this.rblAcive.SelectedValue;
                    this.sdsUser.InsertParameters["UserPassword"].DefaultValue = usr.EncodePasswordToBase64(this.txtRePassword.Value);
                    this.sdsUser.InsertParameters["LeaseID"].DefaultValue = this.ddlTenant.SelectedValue;

                    this.sdsUser.Insert();

                    SendUserMail(this.txtEmailAddress.Value, this.txtName.Value, this.txtRePassword.Value);
                }
                else
                {
                    this.sdsUser.UpdateParameters["UserFirstName"].DefaultValue = this.txtName.Value;
                    this.sdsUser.UpdateParameters["UserSurname"].DefaultValue = this.txtSurname.Value;
                    this.sdsUser.UpdateParameters["UserEmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                    this.sdsUser.UpdateParameters["UserContactNo"].DefaultValue = this.txtContactNumber.Value;
                    this.sdsUser.UpdateParameters["UserGroupID"].DefaultValue = "1";
                    this.sdsUser.UpdateParameters["UserActive"].DefaultValue = this.rblAcive.SelectedValue;
                    this.sdsUser.UpdateParameters["UserID"].DefaultValue = this.hfUserID.Value;
                    this.sdsUser.Update();
                }
                    showMessageBox("Updated successfully");

                    GridView parentPanel = this.Parent.FindControl("GridView1") as GridView;
                    parentPanel.DataBind();
                
            }
        }

        protected void SendUserMail(string emailAddress, string name, string password)
        {
            clSendEmail sendmail = new clSendEmail();

            string mailbody = "";
            mailbody += "A tenant user account has been created for you. Please use the following details to login to your online profile  </br></br> ";
            mailbody += "Url: <a href='" + ConfigurationManager.AppSettings["LoginLink"] + "' >Login</a> </br></br>";
            mailbody += "Username: " + emailAddress + " </br> ";
            mailbody += "Password: " + password + " </br></br> ";

            sendmail.SendMail(emailAddress, name, "Joshco: Tenant Profile", mailbody, "");
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void sdsUser_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["UserID"] = e.Command.Parameters["@UserID"].Value.ToString();
            //Response.Redirect("UserProfile.aspx");
        }

        protected void ddlTenant_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv;
            dv = (System.Data.DataView)this.sdsTenant.Select(DataSourceSelectArguments.Empty);
            dv.RowFilter = "LeaseID = "+this.ddlTenant.SelectedValue;
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.txtName.Value = dt.Rows[0]["Name"].ToString();
                this.txtSurname.Value = dt.Rows[0]["Surname"].ToString();
                this.txtEmailAddress.Value = dt.Rows[0]["EmailAddress"].ToString();
                this.txtContactNumber.Value = dt.Rows[0]["Telephone"].ToString();
            }

            ModalPopupExtender parentPanel = this.Parent.FindControl("mpeLeaseAdd") as ModalPopupExtender;
            parentPanel.Show();
        }


    }
}
using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.user
{
    public partial class UserProfile : System.Web.UI.UserControl
    {
        clUser usr = new clUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillUser();
            }
        }

        public void FillUser()
        {
            this.hfUserID.Value = Session["UserID"].ToString();
            this.hfUserGroupID.Value = Session["UserGroupID"].ToString();
            DataView dv;
            dv = (DataView)this.sdsUser.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                
                this.hfEmailAddress.Value = dt.Rows[0]["UserEmailAddress"].ToString();
                this.txtName.Value = dt.Rows[0]["UserFirstName"].ToString();
                this.txtSurname.Value = dt.Rows[0]["UserSurname"].ToString();
                this.txtEmailAddress.Value = dt.Rows[0]["UserEmailAddress"].ToString();
                this.txtContactNumber.Value = dt.Rows[0]["UserContactNo"].ToString();
                this.rblAcive.SelectedValue = dt.Rows[0]["UserActive"].ToString();
                //this.ddlUserGroup.SelectedValue = dt.Rows[0]["UserGroupID"].ToString();

                this.lblPassword.Visible = false;
                this.lblRePassword.Visible = false;
                this.txtPassword.Visible = false;
                this.txtRePassword.Visible = false;
                this.lblPassword0.Visible = false;
                this.lblRePassword0.Visible = false;
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (usr.CheckEmailAddress(this.txtEmailAddress.Value).Rows.Count > 0 && (this.txtEmailAddress.Value != this.hfEmailAddress.Value))
            {
                showMessageBox("Email address " + this.txtEmailAddress.Value + " already registered please use a different one");
                return;
            }

            if (this.hfUserID.Value == "" || this.hfUserID.Value == "0")
            {//
            }
            else
            {
                this.sdsUser.UpdateParameters["UserFirstName"].DefaultValue = this.txtName.Value;
                this.sdsUser.UpdateParameters["UserSurname"].DefaultValue = this.txtSurname.Value;
                this.sdsUser.UpdateParameters["UserEmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsUser.UpdateParameters["UserContactNo"].DefaultValue = this.txtContactNumber.Value;
                this.sdsUser.UpdateParameters["UserGroupID"].DefaultValue = this.hfUserGroupID.Value;
                this.sdsUser.UpdateParameters["UserActive"].DefaultValue = this.rblAcive.SelectedValue;
                this.sdsUser.UpdateParameters["UserID"].DefaultValue = this.hfUserID.Value;
                this.sdsUser.Update();

                if (this.rblChangePassword.SelectedValue == "True")
                {
                    this.sdsUserPassword.UpdateParameters["UserPassword"].DefaultValue = usr.EncodePasswordToBase64(this.txtRePassword.Value);
                    this.sdsUserPassword.UpdateParameters["UserID"].DefaultValue = this.hfUserID.Value;
                    this.sdsUserPassword.Update();
                }
                showMessageBox("Updated successfully");
            }

            ModalPopupExtender mpeUser = this.Parent.FindControl("mpeUser") as ModalPopupExtender;
            mpeUser.Show();
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void rblChangePassword_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.rblChangePassword.SelectedValue == "True")
            {
                this.lblPassword.Visible = true;
                this.lblRePassword.Visible = true;
                this.txtPassword.Visible = true;
                this.txtRePassword.Visible = true;
                this.lblPassword0.Visible = true;
                this.lblRePassword0.Visible = true;
                RequiredFieldValidator5.Enabled = true;
            }
            else { 
                this.lblPassword.Visible = false;
                this.lblRePassword.Visible = false;
                this.txtPassword.Visible = false;
                this.txtRePassword.Visible = false;
                this.lblPassword0.Visible = false;
                this.lblRePassword0.Visible = false;
                RequiredFieldValidator5.Enabled = false;
            }

            ModalPopupExtender mpeUser = this.Parent.FindControl("mpeUser") as ModalPopupExtender;
            mpeUser.Show();

        }
    }
}
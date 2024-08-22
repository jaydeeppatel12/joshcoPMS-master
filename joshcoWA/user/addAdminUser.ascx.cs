using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.user
{
    public partial class addAdminUser : System.Web.UI.UserControl
    {
        clUser usr = new clUser();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void FillUser()
        {
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
                this.ddlUserGroup.SelectedValue = dt.Rows[0]["UserGroupID"].ToString();

                this.lblPassword.Visible = false;
                this.lblRePassword.Visible = false;
                this.txtPassword.Visible = false;
                this.txtRePassword.Visible = false;
                this.lblPassword0.Visible = false;
                this.lblRePassword0.Visible = false;
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

            this.lblPassword.Visible = true;
            this.lblRePassword.Visible = true;
            this.txtPassword.Visible = true;
            this.txtRePassword.Visible = true;
            this.lblPassword0.Visible = true;
            this.lblRePassword0.Visible = true;

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (usr.CheckEmailAddress(this.txtEmailAddress.Value).Rows.Count > 0 && (this.txtEmailAddress.Value != this.hfEmailAddress.Value))
            {
                showMessageBox("Email address " + this.txtEmailAddress.Value + " already registered please use a different one");
                return;
            }

            if (this.hfUserID.Value == "" || this.hfUserID.Value == "0")
            {
                this.sdsUser.InsertParameters["UserFirstName"].DefaultValue = this.txtName.Value;
                this.sdsUser.InsertParameters["UserSurname"].DefaultValue = this.txtSurname.Value;
                this.sdsUser.InsertParameters["UserEmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsUser.InsertParameters["UserContactNo"].DefaultValue = this.txtContactNumber.Value;
                this.sdsUser.InsertParameters["UserGroupID"].DefaultValue = this.ddlUserGroup.SelectedValue;
                this.sdsUser.InsertParameters["UserActive"].DefaultValue = this.rblAcive.SelectedValue;
                this.sdsUser.InsertParameters["UserPassword"].DefaultValue = usr.EncodePasswordToBase64(this.txtRePassword.Value);
                this.sdsUser.InsertParameters["LeaseID"].DefaultValue = "0";

                this.sdsUser.Insert();
            }
            else
            {
                this.sdsUser.UpdateParameters["UserFirstName"].DefaultValue = this.txtName.Value;
                this.sdsUser.UpdateParameters["UserSurname"].DefaultValue = this.txtSurname.Value;
                this.sdsUser.UpdateParameters["UserEmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsUser.UpdateParameters["UserContactNo"].DefaultValue = this.txtContactNumber.Value;
                this.sdsUser.UpdateParameters["UserGroupID"].DefaultValue = this.ddlUserGroup.SelectedValue;
                this.sdsUser.UpdateParameters["UserActive"].DefaultValue = this.rblAcive.SelectedValue;
                this.sdsUser.UpdateParameters["UserID"].DefaultValue = this.hfUserID.Value;
                this.sdsUser.Update();

                showMessageBox("Updated successfully");
            }

            Response.Redirect("adminUserList.aspx");

            // GridView parentPanel = this.Parent.FindControl("GridView1") as GridView;
            //parentPanel.DataBind();
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


    }
}
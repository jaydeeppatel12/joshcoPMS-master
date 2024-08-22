using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.user
{
    public partial class UserGroupSetting : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.sdsUserGroup.InsertParameters["UserGroup"].DefaultValue = this.txtUserGroup.Value;
            this.sdsUserGroup.InsertParameters["UserGroupID"].DefaultValue = this.hfUserGroupID.Value;
            this.sdsUserGroup.Insert();

            this.hfUserGroupID.Value = "0";
            this.txtUserGroup.Value = "";
            this.gvUserGroup.DataBind();
        }
        protected void gvUserGroup_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editRecord")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);
                this.txtUserGroup.Value = row.Cells[0].Text;

                this.hfUserGroupID.Value = e.CommandArgument.ToString();
            }
        }

        protected void ddlUserGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.sdsSystemModule.DataBind();
            this.gvSystemModule.DataBind();
        }

        protected void gvSystemModule_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "updateRecord")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                this.sdsSystemModule.InsertParameters["UserGroupID"].DefaultValue = this.ddlUserGroup.SelectedValue;
                this.sdsSystemModule.InsertParameters["SystemModuleID"].DefaultValue = e.CommandArgument.ToString();
                this.sdsSystemModule.InsertParameters["Read"].DefaultValue = ((CheckBox)row.FindControl("chkRead")).Checked.ToString();
                this.sdsSystemModule.InsertParameters["Write"].DefaultValue = ((CheckBox)row.FindControl("chkWrite")).Checked.ToString();
                this.sdsSystemModule.InsertParameters["Edit"].DefaultValue = ((CheckBox)row.FindControl("chkEdit")).Checked.ToString();
                this.sdsSystemModule.InsertParameters["Delete"].DefaultValue = ((CheckBox)row.FindControl("chkDelete")).Checked.ToString();
                this.sdsSystemModule.Insert();

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
    }
}
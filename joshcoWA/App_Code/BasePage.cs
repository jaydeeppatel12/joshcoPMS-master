using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace joshcoWA
{

    public class BasePage : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            if (Session["UserGroup"] == null || Session["UserID"] == null)
            {
                Response.Redirect("../logout.aspx?s=s");
            }
            if (Session["UserGroup"].ToString() == "" || Session["UserID"].ToString() == "")
            {
                Response.Redirect("../logout.aspx?s=s");
            }


            if (Session["UserGroup"].ToString() == "Admin")
            { this.Page.MasterPageFile = "../application/admin.master"; }
            else if (Session["UserGroup"].ToString() == "Tenant")
            { this.Page.MasterPageFile = "../tenant/tenant.master"; }
            else if (Session["UserGroup"].ToString() == "Supplier")
            { this.Page.MasterPageFile = "serviceProvider.master"; }
            else if (Session["UserGroupID"].ToString() == "6"
                || Session["UserGroupID"].ToString() == "7"
                || Session["UserGroupID"].ToString() == "8"
                || Session["UserGroupID"].ToString() == "9"
                || Session["UserGroupID"].ToString() == "10")
            { this.Page.MasterPageFile = "../CRM/CRM.master"; }
        }

        //private void Page_Error(object sender, EventArgs e)
        //{
        //    //Exception exc = Server.GetLastError();

        //    //// Handle specific exception.
        //    //if (exc is HttpUnhandledException)
        //    //{
        //    //    showMessageBox("An error occurred on this page. Please verify your " +
        //    //    "information to resolve the issue.");
        //    //}
        //    //// Clear the error from the server.
        //    //Server.ClearError();
        //}


        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
    }
}

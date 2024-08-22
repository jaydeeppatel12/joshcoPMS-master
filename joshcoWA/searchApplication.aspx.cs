using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class searchApplication : System.Web.UI.Page
    {
        clApplication app = new clApplication();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["s"] != null)
            {
                lblErrorMessage.Text = "Your session expired, please login again";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            DataTable dt = new DataTable();
            dt = app.SearchApplication(this.txtIDnumber.Text, this.txtEmailAddress.Text);
            if (dt.Rows.Count > 0)
            {
                Session["ApplicationID"] = dt.Rows[0]["ApplicationID"].ToString();
                Session["ApplicantID"] = dt.Rows[0]["ApplicantID"].ToString();
                Session["PropertyID"] = dt.Rows[0]["PropID"].ToString();
                Session["FullName"] = dt.Rows[0]["FullName"].ToString();
                Response.Redirect("applicant/appStatus.aspx");
            }
            else
            {
                showMessageBox("No Application details found, please check your ID No. and Email Address / Cellphone No.");
                return;
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
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using joshcoWA.student;

namespace joshcoWA.Student
{
    public partial class studentLogin : System.Web.UI.Page
    {
        clStudentApplication StudentApplication = new clStudentApplication();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (this.txtEmailAddress.Text == "" || this.txtPassword.Text == "")
            {
                showMessageBox("Please enter username and password");
                return;
            }

            //
            if (this.txtEmailAddress.Text.Contains(" or ") || this.txtEmailAddress.Text.Contains(" = ") || this.txtPassword.Text.Contains(" or ") || this.txtPassword.Text.Contains(" = "))
            {
                showMessageBox("Invalid account. Please try again");
                return;
            }

            StudentApplication.StudentEmailAddress = txtEmailAddress.Text;
            StudentApplication.StudentPassword = txtPassword.Text;

            DataTable dsExists = new DataTable();
            dsExists  = StudentApplication.FindStudentApplication();          
            
            if (dsExists.Rows.Count > 0)
            {
                //Persit StudentApplicationID
                Session["StudentApplicationID"] = dsExists.Rows[0]["StudentApplicationID"].ToString();   //txtEmailAddress.Text;
                Response.Redirect("studentAppForm.aspx");                
            }
            else
            {
                showMessageBox("Your registration details were not found. Please try again");
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
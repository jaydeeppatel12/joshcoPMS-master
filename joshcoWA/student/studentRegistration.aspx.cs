using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using joshcoWA.student;

namespace joshcoWA.Student
{
    public partial class studentRegister : System.Web.UI.Page
    {
        clStudentApplication StudentApplication = new clStudentApplication();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                showMessageBox("Confirm Password is incorrect. Please try again!");
                return;
            }

            StudentApplication.StudentEmailAddress = txtEmailAddress.Text;
            StudentApplication.StudentName = txtName.Text;
            StudentApplication.StudentPassword = txtPassword.Text;

            string EmailAddress = this.txtEmailAddress.Text;
            if (StudentApplication.CheckEmailAddress(EmailAddress).Rows.Count > 0)
            {
                showMessageBox("Email address " + EmailAddress + " already registered with this system. Please login to continue");
                return;
            }
                     

            //Insert new Application and return application ID 
            string applicationID = StudentApplication.SaveStudentApplication();

            showMessageBox("Registration details were saved succesfully. Please login, to continue with you application");

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
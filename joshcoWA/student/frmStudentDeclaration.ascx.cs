using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class frmStudentDeclaration : System.Web.UI.UserControl
    {
        clStudentDeclaration StudentDeclaration = new clStudentDeclaration();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void GetStudentDeclaration(long ExistingStudentApplicationID)
        {
            DataTable dt = new DataTable();
            StudentDeclaration.StudentApplicationID = ExistingStudentApplicationID;
            dt = StudentDeclaration.GetStudentDeclarationByApplicationID();

            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["StudentDeclarationID"].ToString();
                chkStudentDeclaration1.Checked = Convert.ToBoolean(dt.Rows[0]["StudentDeclaration1"].ToString());
                chkStudentDeclaration2.Checked = Convert.ToBoolean(dt.Rows[0]["StudentDeclaration2"].ToString());
                chkStudentDeclaration3.Checked = Convert.ToBoolean(dt.Rows[0]["StudentDeclaration3"].ToString());

                txtSignedAtStudentPlace.Text = dt.Rows[0]["SignedAtStudentPlace"].ToString();               
            }
        }


        public string SaveStudentDeclaration()
        {
            string ID = "";
            StudentDeclaration.StudentDeclarationID = Convert.ToInt32(hfID.Value);
            StudentDeclaration.StudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"].ToString());      ;
            StudentDeclaration.StudentDeclaration1 = Convert.ToBoolean(chkStudentDeclaration1.Checked);
            StudentDeclaration.StudentDeclaration2 = Convert.ToBoolean(chkStudentDeclaration2.Checked);
            StudentDeclaration.StudentDeclaration3 = Convert.ToBoolean(chkStudentDeclaration3.Checked);
            StudentDeclaration.SignedAtStudentPlace = txtSignedAtStudentPlace.Text;
            StudentDeclaration.SignedAtStudentDate = DateTime.Today.Date.ToShortDateString();
      
            ID = StudentDeclaration.SaveApplicantDeclaration();

            return ID;
        }


        protected void RefreshImage(object sender, EventArgs e)
        {
            //Call UserValidated function to refresh, as validation will be false image get's refreshed
            var Refesh = Captcha1.UserValidated;

        }

    }
}
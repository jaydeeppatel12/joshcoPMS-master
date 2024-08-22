using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class StudentApplicationPayDeposit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["StudentApplicationID"] == null)
            {
                Response.Redirect("studentLogin.aspx?s=e");
                return;
            }

            if (!IsPostBack)
            {
                //Check if application Form Filled complete and dispay the relevsnt panels
                GetStudentApplicationStatus();
            }
        }

        private void GetStudentApplicationStatus()
        {
            clStudentApplication StudentApplication = new clStudentApplication();
            clStudentApplicant StudentApplicant = new clStudentApplicant();
            csStudentApplicationAccommodationUnit StudentApplicationAccommodationUnit = new csStudentApplicationAccommodationUnit();
            clStudentParent StudentParent = new clStudentParent();
            clStudentDeclaration StudentDeclaration = new clStudentDeclaration();
            clStudentFinancialSponsor StudentFinancialSponsor = new clStudentFinancialSponsor();
            //clStudentApplication StudentApplication = new clStudentApplication();
            // DataTable dt = StudentApplication.GetStudentApplicationStatuse(Session["SudentApplicationID"].ToString());

            bool ApplicationDetailsSaved = true;
            bool ApplicantDetailsSaved = StudentApplicant.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0;
            bool AccommodationDetailsSaved = StudentApplicationAccommodationUnit.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0;
            bool ParentDetailsSaved = StudentParent.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0;
            bool FinancialSponsorDetailsSaved = StudentFinancialSponsor.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0;
            bool DeclarationDetailsSaved = StudentDeclaration.CheckApplicationID(Session["StudentApplicationID"].ToString()).Rows.Count > 0;

            //Fix this when there is time
            bool OTPDetailsSaved = true;


            if (ApplicantDetailsSaved && AccommodationDetailsSaved && ApplicationDetailsSaved && ParentDetailsSaved && FinancialSponsorDetailsSaved && DeclarationDetailsSaved && OTPDetailsSaved == true)
            {
                pnlApplicationInProgress.Visible = false;
                pnlApplicationReceived.Visible = true;
            }
        }

    }
}
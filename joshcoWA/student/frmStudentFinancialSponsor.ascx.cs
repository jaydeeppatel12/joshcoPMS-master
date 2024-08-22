using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class frmStudentFinancialSponsor : System.Web.UI.UserControl
    {
        clStudentFinancialSponsor StudentFinancialSponsor = new clStudentFinancialSponsor();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //SaveStudentFinancialSponsor
        public string SaveStudentSponsor()
        {
            string ID = "";
            StudentFinancialSponsor.StudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"].ToString());
            StudentFinancialSponsor.FinancialSponsorType = ddlFundingList.SelectedValue;
            StudentFinancialSponsor.FinancialSponsorDescription = txtFinancialSponsorName.Text;
            StudentFinancialSponsor.FinancialSponsorDescription = txttFinancialSponsorContactNumber.Text;

            ID = StudentFinancialSponsor.SaveStudentFinancialSponsor();
            return ID;
        }


        public void GetStudentFinancialSponsorDetails(long ApplicationID)
        {
            DataTable dt = new DataTable();
            StudentFinancialSponsor.StudentApplicationID = ApplicationID;
            dt = StudentFinancialSponsor.GetStudentFinancialSponsorDetails();

            if (dt.Rows.Count > 0)
            {
                //lblStudentReferenceNo.Text = dt.Rows[0]["StudentReferenceNo"].ToString();
                //txtStudentFirstName.Text = dt.Rows[0]["StudentFirstName"].ToString();
                //txtStudentMiddleName.Text = dt.Rows[0]["StudentMiddleName"].ToString();
                //txtStudentLastName.Text = dt.Rows[0]["StudentLastName"].ToString();
                //ddlStudentGender.SelectedValue = dt.Rows[0]["StudentGender"].ToString();
                //txtStudentIdentificationNumber.Text = dt.Rows[0]["StudentIdentificationNumber"].ToString();
                //txtStudentEmailAddress.Text = dt.Rows[0]["StudentEmailAddress"].ToString();
                //txtStudentMobileNumber.Text = dt.Rows[0]["StudentMobileNumber"].ToString();
                //txtStudentHomeAddress.Text = dt.Rows[0]["StudentHomeAddress"].ToString();
                //ddlStudentNationality.SelectedValue = dt.Rows[0]["StudentNationality"].ToString();
                //txtInstitution.Text = dt.Rows[0]["StudentInstitution"].ToString();
                //txtFaculty.Text = dt.Rows[0]["StudentFaculty"].ToString();
                //txtCourse.Text = dt.Rows[0]["StudentCourse"].ToString();
                //txtStudentNumber.Text = dt.Rows[0]["StudentNumber"].ToString();
                //txtAcademicYear.Text = dt.Rows[0]["StudentAcademicYear"].ToString();
                //txtCourseDuration.Text = dt.Rows[0]["StudentCourseDuration"].ToString();
            }
        }


    }
}
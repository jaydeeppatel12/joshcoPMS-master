using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class frmStudentApplicant : System.Web.UI.UserControl
    {
        clStudentApplicant StudentApplicant = new clStudentApplicant();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //New applicant
                if (string.IsNullOrEmpty(Session["StudentApplicationID"] as string))
                {
                    long ticks = DateTime.Now.Ticks;
                    byte[] bytes = BitConverter.GetBytes(ticks);
                    string id = "APP" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

                    this.lblStudentReferenceNo.Text = id;
                }

                ddlStudentNationality.DataSource = CountryList();
                ddlStudentNationality.DataBind();
                ddlStudentNationality.SelectedValue = "South Africa";                     
            }
        }


        public static List<string> CountryList()
        {
            //Creating list
            List<string> CultureList = new List<string>();

            //getting  the specific  CultureInfo from CultureInfo class
            CultureInfo[] getCultureInfo = CultureInfo.GetCultures(CultureTypes.SpecificCultures);

            foreach (CultureInfo getCulture in getCultureInfo)
            {
                //creating the object of RegionInfo class
                RegionInfo GetRegionInfo = new RegionInfo(getCulture.LCID);
                //adding each county Name into the arraylist
                if (!(CultureList.Contains(GetRegionInfo.EnglishName)))
                {
                    CultureList.Add(GetRegionInfo.EnglishName);
                }
            }
            //sorting array by using sort method to get countries in order
            CultureList.Sort();
            //returning country list
            return CultureList;
        }

        public string SaveStudentApplicant()
        {
            string ID = "";
            StudentApplicant.StudentApplicantID = Convert.ToInt32(hfID.Value);
          
            StudentApplicant.StudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"].ToString());            

            StudentApplicant.StudentReferenceNo = this.lblStudentReferenceNo.Text;
            StudentApplicant.StudentFirstName = txtStudentFirstName.Text;
            StudentApplicant.StudentMiddleName = txtStudentMiddleName.Text;
            StudentApplicant.StudentLastName = txtStudentLastName.Text;
            StudentApplicant.StudentGender = ddlStudentGender.SelectedValue;
            StudentApplicant.StudentIdentificationNumber = txtStudentIdentificationNumber.Text;
            StudentApplicant.StudentEmailAddress = txtStudentEmailAddress.Text;
            StudentApplicant.StudentMobileNumber = txtStudentMobileNumber.Text;
            StudentApplicant.StudentHomeAddress = txtStudentHomeAddress.InnerText;
            StudentApplicant.StudentNationality = ddlStudentNationality.SelectedValue;
            StudentApplicant.StudentInstitution = txtInstitution.Text;
            StudentApplicant.StudentFaculty = txtFaculty.Text;
            StudentApplicant.StudentCourse = txtCourse.Text;
            StudentApplicant.StudentNumber = txtStudentNumber.Text;
            StudentApplicant.StudentAcademicYear = txtAcademicYear.Text;
            StudentApplicant.StudentCourseDuration = txtCourseDuration.Text;


            ID = StudentApplicant.SaveStudentApplicant();
            return ID;
        }


        public void GetStudentApplicantDetails(long ApplicationID)
         {
            DataTable dt = new DataTable();
            StudentApplicant.StudentApplicationID = ApplicationID;
            dt = StudentApplicant.GetStudentApplicantDetails();

            if (dt.Rows.Count > 0)
            {
               lblStudentReferenceNo.Text = dt.Rows[0]["StudentReferenceNo"].ToString();
                txtStudentFirstName.Text = dt.Rows[0]["StudentFirstName"].ToString();
                txtStudentMiddleName.Text = dt.Rows[0]["StudentMiddleName"].ToString();
                txtStudentLastName.Text = dt.Rows[0]["StudentLastName"].ToString();
                ddlStudentGender.SelectedValue = dt.Rows[0]["StudentGender"].ToString();
                txtStudentIdentificationNumber.Text = dt.Rows[0]["StudentIdentificationNumber"].ToString();
                txtStudentEmailAddress.Text = dt.Rows[0]["StudentEmailAddress"].ToString();
                txtStudentMobileNumber.Text = dt.Rows[0]["StudentMobileNumber"].ToString();
                txtStudentHomeAddress.InnerHtml = dt.Rows[0]["StudentHomeAddress"].ToString();
                ddlStudentNationality.SelectedValue = dt.Rows[0]["StudentNationality"].ToString();
                txtInstitution.Text = dt.Rows[0]["StudentInstitution"].ToString();
                txtFaculty.Text = dt.Rows[0]["StudentFaculty"].ToString();
                txtCourse.Text = dt.Rows[0]["StudentCourse"].ToString();
                txtStudentNumber.Text = dt.Rows[0]["StudentNumber"].ToString();
                txtAcademicYear.Text = dt.Rows[0]["StudentAcademicYear"].ToString();
                txtCourseDuration.Text = dt.Rows[0]["StudentCourseDuration"].ToString();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class StudentApplicationStatus : System.Web.UI.Page
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
                GetStudentApplicationStatuse();
                //  this.lblName.Text = Session["FullName"].ToString();

                //    GetApplicationProfile();

                ////Check if Deposit has been paid. Make Panel1 visible
                //if ((Convert.ToDouble(lblDepositRequired.Text) <= 0))
                //{
                //    Panel1.Visible = true;
                //}

                //Get lease by application ID
                //DataTable dtLeaseId = lrp.GetLeaseIdByApplicationID(Session["ApplicationID"].ToString());
                //if (dtLeaseId.Rows.Count > 0)
                //{
                //    Panel1.Visible = false;
                //    flUpload.Visible = false;
                //    Upload.Visible = false;
                //}
            }
        }


        private void GetStudentApplicationStatuse()
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
                pnlReceived.Visible = true;
            }



            //private void GetApplicationProfile()
            //{
            //   clPayFastDepositPayment th = new clPayFastDepositPayment();
            //    DataTable dt = th.GetApplicationProfile(Session["ApplicationID"].ToString());
            //    if (dt.Rows.Count > 0)
            //    {
            //        //ApplicationApproved
            //        if (dt.Rows[0]["ApplicationApproved"].ToString() == "Yes")
            //        {
            //          //  pnlPayfastDepositPayment.Visible = true;

            //            var depositRequired = dt.Rows[0]["DepositRequired"].ToString();
            //            var depositAmount = dt.Rows[0]["DepositAmount"].ToString();

            //          //  this.lblDepositRequired.Text = String.Format("{0:0.00}", dt.Rows[0]["DepositRequired"]);

            //            if (!string.IsNullOrWhiteSpace(depositRequired) &&
            //             !string.IsNullOrWhiteSpace(depositAmount))
            //            {
            //                var dr = Convert.ToDecimal(depositRequired);
            //                var da = Convert.ToDecimal(depositAmount);

            //               // this.lblDepositRequired.Text = (dr - da).ToString("0.00");
            //            }
            //        }

            //    }
            //}


        }

    }
}
        
    
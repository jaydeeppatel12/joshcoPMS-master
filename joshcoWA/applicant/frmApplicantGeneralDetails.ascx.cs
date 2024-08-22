using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class frmApplicantGeneralDetails : System.Web.UI.UserControl
    {
        clApplicantGeneralDetails appGD = new clApplicantGeneralDetails();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void GetApplicantGeneralDetails(long ApplicantID)
        {
            DataTable dt = new DataTable();
            appGD.ApplicantID = ApplicantID;
            dt = appGD.GetApplicantGeneralDetails();

            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["ApplicantGeneralDetailsID"].ToString();
                txtNumbefOfAdult.Text = dt.Rows[0]["NumbefOfAdult"].ToString();
                txtNomberOfChildrenUnder12.Text = dt.Rows[0]["NomberOfChildrenUnder12"].ToString();
            }
        }
        public string SaveApplicantGeneralDetails(string ApplicantID)
        {
            string ID = "";
            appGD.ApplicantGeneralDetailsID = Convert.ToInt32(hfID.Value);
            appGD.ApplicantID = Convert.ToInt32(ApplicantID);
            appGD.NumbefOfAdult = Convert.ToInt32(txtNumbefOfAdult.Text);
            appGD.NomberOfChildrenUnder12 = Convert.ToInt32(txtNomberOfChildrenUnder12.Text);
            ID = appGD.SaveApplicantGeneralDetails();

            return ID;
        }
    }
}
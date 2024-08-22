using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class frmApplicantDeclaration : System.Web.UI.UserControl
    {
        clApplicantDeclaration appD = new clApplicantDeclaration();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void GetApplicantDeclaration(long ApplicantID)
        {
            DataTable dt = new DataTable();
            appD.ApplicantID = ApplicantID;
            dt = appD.GetApplicantDeclaration();

            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["ApplicantDeclarationID"].ToString();
                chkDeclaration1.Checked = Convert.ToBoolean(dt.Rows[0]["Declaration1"].ToString());
                chkDeclaration2.Checked = Convert.ToBoolean(dt.Rows[0]["Declaration2"].ToString());
                chkDeclaration3.Checked = Convert.ToBoolean(dt.Rows[0]["Declaration3"].ToString());
                txtSignedByApplicantPlace.Text = dt.Rows[0]["SignedByApplicantPlace"].ToString();
                txtSignedByApplicantPlace.Text = dt.Rows[0]["SignedByApplicantSpousePlace"].ToString();
            }
        }
        public string SaveApplicantDeclaration(string ApplicantID)
        {
            string ID = "";
            appD.ApplicantDeclarationID = Convert.ToInt32(hfID.Value);
            appD.ApplicantID = Convert.ToInt32(ApplicantID);
            appD.Declaration1 = Convert.ToBoolean(chkDeclaration1.Checked);
            appD.Declaration2 = Convert.ToBoolean(chkDeclaration2.Checked);
            appD.Declaration3 = Convert.ToBoolean(chkDeclaration3.Checked);
            appD.SignedByApplicantPlace = txtSignedByApplicantPlace.Text;
            appD.SignedByApplicantDate =DateTime.Today.Date.ToShortDateString();
            appD.SignedByApplicantSpousePlace = txtSignedByApplicantPlace.Text;
            appD.SignedByApplicantSpouseDate = DateTime.Today.Date.ToShortDateString();

            ID = appD.SaveApplicantDeclaration();

            return ID;
        }

        protected void RefreshImage(object sender, EventArgs e)
        {
            //Call UserValidated function to refresh, as validation will be false image get's refreshed
            var Refesh = Captcha1.UserValidated;

        }
    }
}
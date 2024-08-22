using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class frmApplicantSpouse : System.Web.UI.UserControl
    {
        clApplicantSpouse appS = new clApplicantSpouse();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlNationality.DataSource = CountryList();
                ddlNationality.DataBind();
             //  ddlNationality.SelectedValue = "South Africa";
 
            }
        }
        public int GetApplicantSpouse(long ApplicantID)
        {
            DataTable dt = new DataTable();
            appS.ApplicantID = ApplicantID;
            dt = appS.GetApplicantSpouse();

            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["ApplicantSpouseID"].ToString();
                txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                txtMaidenName.Text = dt.Rows[0]["MaidenName"].ToString();
                txtIdentityNumber.Text = dt.Rows[0]["IdentityNumber"].ToString();
                ddlNationality.SelectedValue = dt.Rows[0]["Nationality"].ToString();
                txtWorkNumber.Text = dt.Rows[0]["WorkNumber"].ToString();
                txtMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                txtResidentialAddress.Text = dt.Rows[0]["ResidentialAddress"].ToString();
                chkSameAddress.SelectedValue = dt.Rows[0]["SameAddress"].ToString();
            }

            return Convert.ToInt32(hfID.Value);
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

        public string SaveApplicantSpouse(string ApplicantID)
        {
            string ID = "";
            appS.ApplicantSpouseID = Convert.ToInt32(hfID.Value);
            appS.ApplicantID = Convert.ToInt32(ApplicantID);
            appS.FullName = txtFullName.Text;
            appS.MaidenName = txtMaidenName.Text;
            appS.IdentityNumber = txtIdentityNumber.Text;
            appS.Nationality = ddlNationality.SelectedValue;
            appS.WorkNumber = txtWorkNumber.Text;
            appS.MobileNumber = txtMobileNumber.Text;
            appS.EmailAddress = txtEmailAddress.Text;
            appS.SameAddress = Convert.ToBoolean(chkSameAddress.SelectedValue);
            appS.ResidentialAddress = txtResidentialAddress.Text;
            ID = appS.SaveApplicantSpouse();

           return ID;
        }

        protected void chkSameAddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(this.chkSameAddress.SelectedValue))
            {
                TextBox txt = (((UserControl)this.Parent.FindControl("frmApplicant")).FindControl("txtResidentialAddress")) as TextBox;
            this.txtResidentialAddress.Text = txt.Text;
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
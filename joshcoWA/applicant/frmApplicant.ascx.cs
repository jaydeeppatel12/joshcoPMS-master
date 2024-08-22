using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class appForm1 : System.Web.UI.UserControl
    {
        clApplicant app = new clApplicant();
        clApplication appl = new clApplication();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            long ticks = DateTime.Now.Ticks;
            byte[] bytes = BitConverter.GetBytes(ticks);
            string id = "APP" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

            this.lblReferenceNo.Text = id;

            ddlNationality.DataSource = CountryList();
            ddlNationality.DataBind();
            ddlNationality.SelectedValue = "South Africa";

            GetMaritalStatus();
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


        

        public void GetMaritalStatus()
        {
            this.cboMaritalStatusID.DataSource = app.GetMaritalStatus();
            this.cboMaritalStatusID.DataTextField = "MaritalStatus";
            this.cboMaritalStatusID.DataValueField = "MaritalStatusID";
            this.cboMaritalStatusID.DataBind();
        }

        public string SaveApplicant()
        {         
            string ID="";
            app.ApplicantID = Convert.ToInt32(hfID.Value);
            app.ReferenceNo = this.lblReferenceNo.Text;
            app.FullName = txtFullName.Text;
            app.MaidenName = txtMaidenName.Text;
            app.IdentityNumber = txtIdentityNumber.Text;
            app.Nationality = ddlNationality.SelectedValue;
            app.WorkNumber = txtWorkNumber.Text;
            app.MobileNumber = txtMobileNumber.Text;
            app.EmailAddress = txtEmailAddress.Text;
            app.ResidentialAddress = txtResidentialAddress.Text;
            app.MaritalStatusID = Convert.ToInt32(cboMaritalStatusID.SelectedValue);
            app.AlternativeContactPersonFullName = txtAlternativeContactPersonFullName.Text;
            app.AlternativeContactPersonMobile = txtAlternativeContactPersonMobile.Text;
            app.PropertyOwner = Convert.ToBoolean(chkPropertyOwner.SelectedValue);
            app.SMSNotification = Convert.ToBoolean(this.chkSMS.Checked);
            app.EmailNotification = Convert.ToBoolean(chkEmail.Checked);
            ID = app.SaveApplicant();
   
            return ID;
        }
        public void GetApplicant(long ApplicantID)
        {
            DataTable dt = new DataTable();
            app.ApplicantID = ApplicantID;
            dt = app.GetApplicant();

            if (dt.Rows.Count > 0)
            {
                this.lblProperty.Visible = true;
                this.lblPropertyHeader.Visible = true;

                this.lblReferenceNo.Visible = true;
                this.lblRefNo.Visible = true;

                lblProperty.Text = dt.Rows[0]["PropertyName"].ToString();

                hfID.Value = dt.Rows[0]["ApplicantID"].ToString();
                txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                txtMaidenName.Text = dt.Rows[0]["MaidenName"].ToString();
                txtIdentityNumber.Text = dt.Rows[0]["IdentityNumber"].ToString();
                ddlNationality.SelectedValue = dt.Rows[0]["Nationality"].ToString();
                txtWorkNumber.Text = dt.Rows[0]["WorkNumber"].ToString();
                txtMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                txtResidentialAddress.Text = dt.Rows[0]["ResidentialAddress"].ToString();
                cboMaritalStatusID.SelectedValue = dt.Rows[0]["MaritalStatusID"].ToString();
                txtAlternativeContactPersonFullName.Text = dt.Rows[0]["AlternativeContactPersonFullName"].ToString();
                txtAlternativeContactPersonMobile.Text = dt.Rows[0]["AlternativeContactPersonMobile"].ToString();
                chkPropertyOwner.SelectedValue = dt.Rows[0]["PropertyOwner"].ToString();
                chkSMS.Checked = Convert.ToBoolean(dt.Rows[0]["SMSNotification"].ToString());
                chkEmail.Checked = Convert.ToBoolean(dt.Rows[0]["EmailNotification"].ToString());
            }
        }


    public string SaveApplication(string ApplicantID, string PropertyID, string PropertyUnitID)
    {
      string ID = "";
      appl.ApplicantID = Convert.ToInt32(ApplicantID);
      appl.PropertyID = Convert.ToInt32(PropertyID);
      appl.PropertyUnitID = Convert.ToInt32(PropertyUnitID);
      ID = appl.SaveApplication();

            return ID;
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

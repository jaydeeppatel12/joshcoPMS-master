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
    public partial class frmApplicantSpouseEmployment : System.Web.UI.UserControl
    {
        clApplicantSpouseEmployment appSE = new clApplicantSpouseEmployment();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void GetApplicantEmployment(long ApplicantSpouseID)
        {
            DataTable dt = new DataTable();
            appSE.ApplicantSpouseID = ApplicantSpouseID;
            dt = appSE.GetApplicantSpouseEmployment();

            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["ApplicantSpouseEmploymentID"].ToString();

                chkSelfEmployed.SelectedValue = dt.Rows[0]["SelfEmployed"].ToString();
                txtOccupation.Text = dt.Rows[0]["Occupation"].ToString();
                txtCurrentEmployer.Text = dt.Rows[0]["CurrentEmployer"].ToString();
                txtEmployerAddress.Text = dt.Rows[0]["EmployerAddress"].ToString();
                txtEmploymentPeriod.Text = dt.Rows[0]["EmploymentPeriod"].ToString();
                txtGrossSalary.Text = dt.Rows[0]["GrossSalary"].ToString(); //!= DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["GrossSalary"].ToString())); ? decimal.Parse(dt.Rows[0]["GrossSalary"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00";
                txtDay.Text = dt.Rows[0]["SalaryPaymentDay"].ToString(); 
            }

        }
        public string SaveApplicantSpouseEmployment(string ApplicantSpouseID)
        {
            string ID = "";
            appSE.ApplicantSpouseEmploymentID = Convert.ToInt32(hfID.Value);
            appSE.ApplicantSpouseID = Convert.ToInt32(ApplicantSpouseID);
            appSE.SelfEmployed = Convert.ToBoolean(chkSelfEmployed.SelectedValue);
            appSE.Occupation = txtOccupation.Text;
            appSE.CurrentEmployer = txtCurrentEmployer.Text;
            appSE.EmployerAddress = txtEmployerAddress.Text;
            appSE.EmploymentPeriod = txtEmploymentPeriod.Text;
            appSE.GrossSalary = txtGrossSalary.Text;
            //appSE.SalaryPaymentMonth = ddlMonth.SelectedValue;
            appSE.SalaryPaymentDay = txtDay.Text; 
            ID = appSE.SaveApplicantSpouseEmployment();


            return ID;
        }

        protected void chkSelfEmployed_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (chkSelfEmployed.SelectedValue == "True")
            {
                this.RangeValidator1.Enabled = false;

                this.sCurrentEmployer.Visible = false;
                this.sEmployerEmailAddress.Visible = false;
                this.sEmploymentPeriod.Visible = false;


                this.txtCurrentEmployer.Enabled = false;
                this.txtEmployerAddress.Enabled = false;
                txtEmploymentPeriod.Enabled = false;
                ddlYearMonth.Enabled = false;
            }

            if (chkSelfEmployed.SelectedValue == "False")
            {
                this.RangeValidator1.Visible = true;

                this.sCurrentEmployer.Visible = true;
                this.sEmployerEmailAddress.Visible = true;
                this.sEmploymentPeriod.Visible = true;

                this.txtCurrentEmployer.Enabled = true;
                this.txtEmployerAddress.Enabled = true;
                this.txtEmploymentPeriod.Enabled = true;
                this.ddlYearMonth.Enabled = true;
            }
        }

    }
}
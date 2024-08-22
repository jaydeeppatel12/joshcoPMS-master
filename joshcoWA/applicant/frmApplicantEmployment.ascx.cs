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
    public partial class frmApplicantEmployment : System.Web.UI.UserControl
    {
        clApplicantEmployment appEm = new clApplicantEmployment();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void GetApplicantEmployment(long ApplicantID)
        {
            DataTable dt = new DataTable();
            appEm.ApplicantID = ApplicantID;
            dt = appEm.GetApplicantEmployment();

            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["ApplicantEmploymentID"].ToString();

                chkSelfEmployed.SelectedValue = dt.Rows[0]["SelfEmployed"].ToString();
                txtOccupation.Text = dt.Rows[0]["Occupation"].ToString();
                txtCurrentEmployer.Text = dt.Rows[0]["CurrentEmployer"].ToString();
                txtEmployerAddress.Text = dt.Rows[0]["EmployerAddress"].ToString();
                txtEmploymentPeriod.Text = dt.Rows[0]["EmploymentPeriod"].ToString();
                txtGrossSalary.Text = dt.Rows[0]["GrossSalary"].ToString();               
                txtDay.Text = dt.Rows[0]["SalaryPaymentDay"].ToString();
            }
        }
        public string SaveApplicantEmployment(string ApplicantID)
        {
            string ID = "";
            appEm.ApplicantEmploymentID = Convert.ToInt32(hfID.Value);
            appEm.ApplicantID = Convert.ToInt32(ApplicantID);
            appEm.SelfEmployed = Convert.ToBoolean(chkSelfEmployed.SelectedValue);
            appEm.Occupation = txtOccupation.Text;
            appEm.CurrentEmployer = txtCurrentEmployer.Text;
            appEm.EmployerAddress = txtEmployerAddress.Text;
            appEm.EmploymentPeriod = txtEmploymentPeriod.Text;
            appEm.GrossSalary = txtGrossSalary.Text;
            //appEm.SalaryPaymentMonth = ddlMonth.SelectedValue;
            appEm.SalaryPaymentDay = txtDay.Text; 
            ID = appEm.SaveApplicantEmployment();

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
                this.txtEmploymentPeriod.Enabled = false;
                this.ddlYearMonth.Enabled = false;
            }

            if (chkSelfEmployed.SelectedValue == "False")
            {
                this.RangeValidator1.Enabled = true;

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
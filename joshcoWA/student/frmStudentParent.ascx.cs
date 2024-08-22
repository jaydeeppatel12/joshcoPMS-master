using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class frmStudentParent : System.Web.UI.UserControl
    {
        clStudentParent clStudentParent = new clStudentParent();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Session["ExistingStudentApplicationID"] as string))
                {
                    long ticks = DateTime.Now.Ticks;
                    byte[] bytes = BitConverter.GetBytes(ticks);
                    string id = "PAR" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

                    this.lblParentReferenceNo.Text = id;
                }
            }
        }

        public string SaveStudentParent()
        {
            string ID = "";
            clStudentParent.StudentParentID = Convert.ToInt32(hfID.Value);

            //existing application
            clStudentParent.StudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"].ToString());           

            clStudentParent.ReferenceNo = this.lblParentReferenceNo.Text;
            clStudentParent.FullName = txtFullName.Text;
            clStudentParent.IdentificationNumber = txtIdentificationNumber.Text;
            clStudentParent.ResidentialAddress = txtResidentialAddress.Text;
            clStudentParent.EmailAddress = txtEmailAddress.Text;
            clStudentParent.MobileNumber = txtMobileNumber.Text;
            clStudentParent.CurrentEmployer = txtEmployer.Text;
            clStudentParent.MonthlyIncome = Int32.Parse(txtMonthlyIncome.Text);
            clStudentParent.Bank = txtBank.Text;
            clStudentParent.AccountNumber = txtAccountNumber.Text;
            clStudentParent.BillingDay = txtBillingDay.Text;

            ID = clStudentParent.SaveStudentParent();
            return ID;
        }


        public void GetStudentParentDetails(long ApplicationID)
        {
            DataTable dt = new DataTable();
            clStudentParent.StudentApplicationID = ApplicationID;
            dt = clStudentParent.GetStudentParentApplicantDetails();

            if (dt.Rows.Count > 0)
            {
                lblParentReferenceNo.Text = dt.Rows[0]["ReferenceNo"].ToString();
                txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                txtIdentificationNumber.Text = dt.Rows[0]["IdentificationNumber"].ToString();
                txtResidentialAddress.Text = dt.Rows[0]["ResidentialAddress"].ToString();
                txtEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                txtMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtEmployer.Text = dt.Rows[0]["CurrentEmployer"].ToString();
                txtMonthlyIncome.Text = dt.Rows[0]["MonthlyIncome"].ToString();
                txtBank.Text = dt.Rows[0]["Bank"].ToString();
                txtAccountNumber.Text = dt.Rows[0]["AccountNumber"].ToString();
                txtBillingDay.Text = dt.Rows[0]["BillingDay"].ToString();
            }
        }

    }
}
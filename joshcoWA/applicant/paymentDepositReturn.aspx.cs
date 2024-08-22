using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class paymentDepositReturn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            this.BindApplicationDepositPayments();
        }

        private void BindApplicationDepositPayments()
        {
            if (Session["ApplicationID"] == null)
            {
                showMessageBox("Your session has expired!. Please login and try again");
                return;
            }
            clPayFastDepositPayment PayFastDepositPayment = new clPayFastDepositPayment();
            DataTable dt = PayFastDepositPayment.GetApplicationDepositPayment(Session["ApplicationID"].ToString());
            this.gvApplicationDeposit.DataSource = dt;
            this.gvApplicationDeposit.DataBind();

           // this.mpeApplicationDeposit.Show();
            showMessageBox("Deposit paid successfully!");
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
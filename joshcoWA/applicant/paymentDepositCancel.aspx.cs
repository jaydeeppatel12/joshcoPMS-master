using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    //PayFast will send a post back to your notify_url, before the user is redirected back to your return_url, 
    //    when a payment is completed.If a payment is cancelled the user will be returned to your cancel_url.
    //    It is important to note that no payment data ever gets posted to the return_url or cancel_url.
    public partial class paymentDepositCancel : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindApplicationDepositPayments();
            }
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

            this.gvApplicationDepositCancel.DataSource = dt;
            this.gvApplicationDepositCancel.DataBind();
            showMessageBox("We are sorry, you cancelled your deposit payment transaction!");
            //this.mpePaymentStatus.Show();
        }                

    }
}
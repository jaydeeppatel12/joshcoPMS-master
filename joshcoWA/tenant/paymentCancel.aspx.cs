using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class paymentCancel : joshcoWA.BasePage
    {
        //PayFast will send a post back to your notify_url, before the user is redirected back to your return_url, 
        //    when a payment is completed.If a payment is cancelled the user will be returned to your cancel_url.
        //    It is important to note that no payment data ever gets posted to the return_url or cancel_url.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindLeaseRentPaid();
            }
        }

        private void BindLeaseRentPaid()
        {
            if (Session["LeaseID"] == null)
            {
                showMessageBox("Your session has expired!. Please login and try again");
                this.gvPaymentHistory.DataBind();
                return;
            }
            clLeaseRentPaid lrp = new clLeaseRentPaid();
            DataTable dt = lrp.GetLeaseRentPaidListByLeaseID(Session["LeaseID"].ToString());
            this.gvPaymentHistory.DataSource = dt;
            this.gvPaymentHistory.DataBind();

             showMessageBox("We are sorry, you cancelled your payment transaction!");

            //this.mpePaymentStatus.Show();
        }

    }
}
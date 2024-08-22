using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class PaymentReturn : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            this.BindLeaseRentPaid();
        }

        private void BindLeaseRentPaid()
        {
            if (string.IsNullOrEmpty(Session["LeaseID"] as string))
            {
                showMessageBox("Your session has expired!. Please login and try again");
                this.gvPaymentHistory.DataBind();
                return;
            }

            clLeaseRentPaid lrp = new clLeaseRentPaid();
            DataTable dt = lrp.GetLeaseRentPaidListByLeaseID(Session["LeaseID"].ToString());
            this.gvPaymentHistory.DataSource = dt;
            this.gvPaymentHistory.DataBind();

            //this.mpePaymentStatus.Show();
            showMessageBox("Your rental was paid successfully!");
        }

        //public void showMessageBox(string message)
        //{
        //    string sScript = null;
        //    message = message.Replace("'", "\\'");
        //    sScript = string.Format("alert('{0}');", message);
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        //}

    }
}
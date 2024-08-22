using joshcoWA.External.Models;
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
    public partial class paymentNotify : System.Web.UI.Page
    {
        //PayFast will send a post back to your notify_url, before the user is redirected back to your return_url, when a payment is completed.
        // If a payment is cancelled the user will be returned to your cancel_url.
        // It is important to note that no payment data ever gets posted to the return_url or cancel_url.           
        protected void Page_Load(object sender, EventArgs e)
        {
            // Can't have a postback on this page, it is called
            // once by the payment processor.
            if (IsPostBack) return;

            string LeaseRentID = !string.IsNullOrEmpty(this.Page.Request.Form["custom_str1"]) ? this.Page.Request.Form["custom_str1"].ToString() : "0";
            string PaymentStatus = !string.IsNullOrEmpty(this.Page.Request.Form["payment_status"]) ? this.Page.Request.Form["payment_status"].ToString() : "UNKNOWN";
            string AmountPaid = !string.IsNullOrEmpty(this.Page.Request.Form["amount_gross"]) ? this.Page.Request.Form["amount_gross"].ToString() : "0";
            string PaymentSource = "Pay Fast";
            //Unique payment ID on the merchant System
            string ReferenceNo = !string.IsNullOrEmpty(this.Page.Request.Form["m_payment_id"]) ? this.Page.Request.Form["m_payment_id"].ToString() : "0";
            //Unique transation ID on Payfast
            string PayFastPaymentId = !string.IsNullOrEmpty(this.Page.Request.Form["pf_payment_id"]) ? this.Page.Request.Form["pf_payment_id"].ToString() : "0";

            if (PaymentStatus.ToUpper() == "COMPLETE".ToUpper())
            {
                clLeaseRentPaid leaseRentPaid = new clLeaseRentPaid();
                DateTime dtDueDate = FirstDayOfMonthFromDateTime(DateTime.Now);

                leaseRentPaid.SaveLeaseRentPaidDetails(LeaseRentID, dtDueDate, AmountPaid, PaymentSource, ReferenceNo, PayFastPaymentId);
            }
        }

        //Set due Date
        public DateTime FirstDayOfMonthFromDateTime(DateTime dateTime)
        {
            return new DateTime(dateTime.Year, dateTime.Month, Int32.Parse(ConfigurationManager.AppSettings["RentPaymentDueDay"]));
        }
    }
}
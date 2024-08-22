using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using joshcoWA.External.Services;
using System.Threading.Tasks;
using joshcoWA.External.Models;
using System.ComponentModel;
using Microsoft;

namespace joshcoWA
{
    public partial class testt : System.Web.UI.Page
    {
        //TpnService _tpnService = new TpnService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SendSMS("+27815254291");
             //TpnEnquiry(454);
        }

        protected void SendSMS(string cellphoneNo)
        {
            clSendSMS sendmail = new clSendSMS();

            string mailbody = "";
            mailbody += "Test SMS Application";
            //: http://www.quickpropsys.com/joshco/searchapplication.aspx
            sendmail.SendMessage(cellphoneNo, mailbody);
        }

        //private void TpnEnquiry(int applicationId)
        //{
        //    _tpnService.ExecuteTenantTpnCheck(
        //      new TpnRequest
        //      {
        //          SecurityCode = ConfigurationManager.AppSettings["TpnUsername"],
        //          Password = ConfigurationManager.AppSettings["TpnPassword"],
        //          LoginCode = ConfigurationManager.AppSettings["TpnLoginCode"],
        //          SurName = "Burger",
        //          FirstName = "Chris",
        //          //Personal Details
        //          ContactName = "Justin Bez",
        //          ContactNumber = "0821234567",
        //          AddressLine = "74 Test Street",
        //          Suburb = "Test Park",
        //          Province = "",
        //          NationalID = "7707077777087",
        //          //Bank
        //          Bank = "Capitec",
        //          BranchCode = "74001",
        //          AccountHolder = "Tester",
        //          AccountType = "Savings",
        //          AccountNumber = "123456773424",
        //          CreditAmount = 0,
        //          Terms = "No terms",
        //          ApplicationID = applicationId

        //      });
        //}
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using joshcoWA.user;
namespace joshcoWA
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        clUser usr = new clUser();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        protected void imbSubmit_Click(object sender, EventArgs e)
        {
            DataTable dsExists = new DataTable();

            string strSQL = "";
            string sqlConnString = ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString;

            strSQL = "SELECT * FROM [User] WHERE UserActive = 1 and UserEmailAddress = '" + this.txtUserName.Text + "'";

            SqlConnection sqlConn = new SqlConnection(sqlConnString);
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();

            ExistsAdapter.SelectCommand = sqlCmd;
            sqlCmd.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            sqlConn.Close();

            if (dsExists.Rows.Count > 0)
            {
                SendUserMail(dsExists.Rows[0]["UserUserName"].ToString(), dsExists.Rows[0]["UserFirstName"].ToString(), usr.DecodeFrom64(dsExists.Rows[0]["UserPassword"].ToString()));
                this.lblDetails.Visible = true;
                this.lblDetails.Text = "Your password has been sent to your email";
                return;
            }
            else
            {
                this.lblDetails.Visible = true;
                this.lblDetails.Text = "Your email does not match any active account, please contact your administrator.";
                return;
            }

        }

        protected void SendUserMail(string emailAddress, string name, string password)
        {
            clSendEmail sendmail = new clSendEmail();

            string mailbody = "";
            mailbody += "We have found your password, your login details below.</br></br>";
            mailbody += "Username: " + emailAddress + "</br>";
            mailbody += "Password: " + password + "</br></br>";
            mailbody += "Url: <a href='" + ConfigurationManager.AppSettings["LoginLink"] + "' >login</a> </br></br>";
            sendmail.SendMail(this.txtUserName.Text, name, "JOSHCO: Password Recovery", mailbody, "");
        }
    }
}
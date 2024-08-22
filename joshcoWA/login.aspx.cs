using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using joshcoWA.user;

namespace joshcoWA
{
    public partial class login : System.Web.UI.Page
    {
        clUser usr = new clUser();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["se"] != null)
                {

                    if (Request.QueryString["se"].ToString() == "se")
                    {
                        lblErrorMessage.Text = "Your session expired, please login again";
                    }
                }
            }
            catch { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblErrorMessage.Text = "";

            login_(this.txtUserName.Value, this.txtPassword.Value);
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }


        public void login_(string username, string password)
        {
            if (this.txtUserName.Value == "" || this.txtPassword.Value == "")
            {
                showMessageBox("Please enter username and password");
                return;
            }

            if (this.txtUserName.Value.Contains(" or ") || this.txtUserName.Value.Contains(" = ") || this.txtPassword.Value.Contains(" or ") || this.txtPassword.Value.Contains(" = "))
            {
                showMessageBox("Invalid account");
                return;
            }

            // try
            //{

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Select Top(1) A.*, UserGroup, L.ApplicationID, PU.PropertyID From [dbo].[User]A join [dbo].[UserGroup]B on A.UserGroupID = B.UserGroupID  left join [dbo].[Lease]L on L.LeaseID = A.LeaseID left join [dbo].[PropertyUnit]PU on PU.PropertyUnitID = L.PropertyUnitID Where  UserUserName = @UserUserName and UserPassword = @UserPassword ; ", conn);
            CmdSql.Parameters.Add("@UserUserName", System.Data.SqlDbType.NVarChar).Value = username;
            CmdSql.Parameters.Add("@UserPassword", System.Data.SqlDbType.NVarChar).Value = usr.EncodePasswordToBase64(password);
            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            if (dsExists.Rows.Count > 0)
            {
                Session["UserID"] = dsExists.Rows[0]["UserID"].ToString();
                Session["UserGroup"] = dsExists.Rows[0]["UserGroup"].ToString();
                Session["UserGroupID"] = dsExists.Rows[0]["UserGroupID"].ToString();
                Session["UserFullName"] = dsExists.Rows[0]["UserFirstName"].ToString() + " " + dsExists.Rows[0]["UserSurname"].ToString();

                if (dsExists.Rows[0]["UserGroupID"].ToString() == "2")
                {
                    Response.Redirect("application/Home.aspx");
                }

                if (dsExists.Rows[0]["UserGroupID"].ToString() == "6" ||
                    dsExists.Rows[0]["UserGroupID"].ToString() == "7" ||
                    dsExists.Rows[0]["UserGroupID"].ToString() == "8" ||
                    dsExists.Rows[0]["UserGroupID"].ToString() == "9" ||
                    dsExists.Rows[0]["UserGroupID"].ToString() == "10")
                {
                    Response.Redirect("CRM/CRMDash.aspx");
                }

                if (dsExists.Rows[0]["UserGroupID"].ToString() == "5")
                {
                    Response.Redirect("lease/Home.aspx");
                }


                if (dsExists.Rows[0]["UserGroupID"].ToString() == "1")
                {
                    Session["LeaseID"] = dsExists.Rows[0]["LeaseID"].ToString();
                    Session["AppLeaseID"] = dsExists.Rows[0]["LeaseID"].ToString();
                    Session["ApplicationID"] = dsExists.Rows[0]["ApplicationID"].ToString();
                    Session["PropertyID"] = dsExists.Rows[0]["PropertyID"].ToString();

                    Response.Redirect("tenant/tenantHome.aspx");
                }
                if (dsExists.Rows[0]["UserGroupID"].ToString() == "3")
                {
                    Session["ServiceProviderID"] = dsExists.Rows[0]["SupplierID"].ToString();

                    Response.Redirect("serviceProviderHome.aspx");
                }

            }
            else
            {
                showMessageBox("Invalid username or password please try again");
                return;
            }
            //}
            //catch
            //{
            //    showMessageBox("Invalid username or password please try again");
            //    return;
            //}
        }
    }
}
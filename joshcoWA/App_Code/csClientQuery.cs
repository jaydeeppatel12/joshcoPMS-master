using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace joshcoWA
{
    class csClientQuery
    {
        public DataTable GetQueryCategory()
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select * from [dbo].[FM_QueryCategory] Order by QueryCategory Asc";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetClientQueryCount(string UserID)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec FM_GetClientQueryCount '" + UserID + "';";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetQueryDetails(string QueryID)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[FM_GetQueryDetails] '" + QueryID + "' ; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }


        public DataTable GetComplaintDetails(string ComplaintID)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[GetComplaintDetails] '" + ComplaintID + "' ; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetClientQuery(string UserID, string Filter)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[FM_GetClientQuery] '" + UserID + "','" + Filter + "'; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetNotifications(string NotificationType, string SentSuccessful)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            if(!string.IsNullOrEmpty(SentSuccessful))
                cmd.CommandText = "Exec [dbo].[FM_GetNotifications] '" + NotificationType + "','" + SentSuccessful + "'; ";
            else
                cmd.CommandText = "Exec [dbo].[FM_GetNotifications] '" + NotificationType + "'; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public void UpdateComplaintStatus(string ComplaintID, string status)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Update  [dbo].[Complaint] set [Status] = '" + status + "', StatusDate = GetDate() Where ComplaintID = '" + ComplaintID + "'; ";
            con.Open();
            //ID = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.ExecuteNonQuery();
            con.Close();

        }


        public void UpdateQueryStatus(string QueryID, string status)
        {
             
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Update  [dbo].[FM_Query] set [Status] = '" + status + "', StatusDate = GetDate() Where QueryID = '" + QueryID + "'; ";
            con.Open();
            //ID = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.ExecuteNonQuery();
            con.Close();
 
        }

        public DataTable GetClientComplaint(string UserID, string Filter)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[GetClientComplaint] '" + UserID + "','" + Filter + "'; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetQuotation(string PropertyID, string InvitationToQuoteID)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[FM_SelectInvitationToQuote] '" + PropertyID + "','" + InvitationToQuoteID + "'; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public int AddClientQuery(string ReferenceNo, string PropertyUnitID, string UserID, string QueryCategoryID, string QueryDescription, string Severity)
        {
            int ID = 0;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "IF(Select Count(*) From [dbo].[FM_Query] Where ReferenceNo = '" + ReferenceNo + "')=0 Begin Insert into [dbo].[FM_Query] (ReferenceNo, PropertyUnitID, UserID, QueryCategoryID, QueryDescription, Severity, DateAdded) values ('" + ReferenceNo + "', " + PropertyUnitID + ", " + UserID + ", '" + QueryCategoryID + "', '" + QueryDescription + "', '" + Severity + "', GetDate()); Select @@Identity; END";
            con.Open();
            ID = Convert.ToInt32(cmd.ExecuteScalar());
            //cmd.ExecuteNonQuery();
            con.Close();


            return ID;
        }


        public int AddClientComplaint(string ReferenceNo, string PropertyUnitID, string UserID, string ComplaintCategoryID, string ComplaintSubCategoryID, string ComplaintDescription, string Severity)
        {
            int ID = 0;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Insert into [dbo].[Complaint] (ReferenceNo, PropertyUnitID, UserID, ComplaintCategoryID, ComplaintSubCategoryID, ComplaintDescription, Severity, DateAdded) values ('" + ReferenceNo + "', " + PropertyUnitID + ", " + UserID + ", '" + ComplaintCategoryID + "', '" + ComplaintSubCategoryID + "', '" + ComplaintDescription + "', '" + Severity + "', GetDate()); Select @@Identity;";
            con.Open();
            ID = Convert.ToInt32(cmd.ExecuteScalar());
            //cmd.ExecuteNonQuery();
            con.Close();


            return ID;
        }

        public void UpdateClientStatus(string QueryID, string Status, string FacilityManagementID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Update [dbo].[FM_Query] Set [Status] = '" + Status + "', [StatusDate] = GetDate()  where QueryID = " + QueryID + "  ; Delete [QueryWorkOrder] where QueryID = '" + QueryID + "'; insert into [QueryWorkOrder](QueryID, FacilityManagementID, DateAdded) values('" + QueryID + "', '" + FacilityManagementID + "', GetDate());";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void DelQueryWorkOrder(string QueryID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Delete [FM_QueryWorkOrder] where QueryID = '" + QueryID + "';";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
public void AddQueryComment(string Comment, string QueryID, string AdminUserID)
    {
      SqlConnection con = new SqlConnection();
      con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

      SqlCommand cmd = new SqlCommand();
      cmd.Connection = con;
      cmd.CommandType = CommandType.Text;
      cmd.CommandText = "Insert into [dbo].[FM_QueryComment] (QueryID, Comment, AdminUserID, DateAdded) values ('" + QueryID + "', '"+ Comment + "','" + AdminUserID + "', GetDate());";
      con.Open();
      cmd.ExecuteScalar();
      //cmd.ExecuteNonQuery();
      con.Close();
    }

        public DataTable GetQueryComments(string QueryID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[FM_SelectQueryComment] '" + QueryID + "'; ";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetPropertyById(string PropertyID)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT Top(1) * FROM [dbo].[Property]  Where PropertyID =  '" + PropertyID + "' ; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }


        public void AddComplaintComment(string Comment, string ComplaintID, string UserID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Insert into [dbo].[ComplaintComment] (ComplaintID, Comment, CommentFromUserID, DateAdded) values ('" + ComplaintID + "', '" + Comment + "','" + UserID + "', GetDate());";
            con.Open();
            cmd.ExecuteScalar();
            //cmd.ExecuteNonQuery();
            con.Close();
        }


        public DataTable GetComplaintComments(string ComplaintID)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[SelectComplaintComment] '" + ComplaintID + "'; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetPropertyUnitById(string PropertyID, string PropertyUnitID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT Top(1) * FROM [dbo].[PropertyUnit]  Where PropertyID = '" + PropertyID + "' AND  PropertyUnitID = '" + PropertyUnitID + "' ; ";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }


        public DataTable GetTenantByPropertyUnitId(string PropertyUnitID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); 

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec [dbo].[SelectTenantByUnitID] '" + PropertyUnitID + "' ; ";


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA
{
    public class clNotification
    {
        public DataTable SelectNotificationLog()
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec SelectNotificationLog";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public void InsertNotificationLog(string NotificationType, object Notification, string RecipientID, string SentSuccessful, string reference, string body, string to)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec InsertNotificationLog '" + NotificationType + "', '" + Notification + "','" + RecipientID + "','" + SentSuccessful + "' ;";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class clStudentApplication
    {
        private long _StudentApplicationID;
        public long StudentApplicationID
        {
            get { return _StudentApplicationID; }
            set { _StudentApplicationID = value; }
        }

        private string _StudentEmailAddress;
        public string StudentEmailAddress
        {
            get { return _StudentEmailAddress; }
            set { _StudentEmailAddress = value; }
        }

        private string _StudentName;
        public string StudentName
        {
            get { return _StudentName; }
            set { _StudentName = value; }
        }

        private string _StudentPassword;
        public string StudentPassword
        {
            get { return _StudentPassword; }
            set { _StudentPassword = value; }
        }

        public DataTable GetStudentApplicationStatus(string StudentApplicationID)
        {
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = Connection.GetConnection();
            SqlCommand selectCommand = new SqlCommand();
            selectCommand.Connection = sqlConnection;
            selectCommand.CommandType = CommandType.Text;
            selectCommand.CommandText = "Exec SelectStudentApplicationStatus " + StudentApplicationID;
            DataTable dataTable = new DataTable();
            new SqlDataAdapter(selectCommand).Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }

        public DataTable GetApplicationProfile(string ApplicationID)
        {
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = Connection.GetConnection();
            SqlCommand selectCommand = new SqlCommand();
            selectCommand.Connection = sqlConnection;
            selectCommand.CommandType = CommandType.Text;
            selectCommand.CommandText = "Exec SelectStudentApplicationProfile " + ApplicationID;
            DataTable dataTable = new DataTable();
            new SqlDataAdapter(selectCommand).Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }

        //Find By EmaillAddress and Password
        public DataTable FindStudentApplication()
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Select * FROM [dbo].[Student_Application] Where  [StudentEmailAddress] = @StudentEmailAddress and [StudentPassword] = @StudentPassword ; ", conn);
            CmdSql.Parameters.Add("@StudentEmailAddress", System.Data.SqlDbType.NVarChar).Value = StudentEmailAddress;
            CmdSql.Parameters.Add("@StudentPassword", System.Data.SqlDbType.NVarChar).Value = StudentPassword;
            
            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }


        //public DataTable SearchStudentApplication(string IDNumber, string StudentEmailAddress)
        //{
        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
        //    SqlCommand CmdSql = new SqlCommand("SELECT Top(1) * FROM [dbo].[Student_Application] Where StudentIdentificationNumber = '" + IDNumber + "' and ([StudentEmailAddress] = '" + StudentEmailAddress + "') ;", conn);

        //    DataTable dsExists = new DataTable();
        //    SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
        //    ExistsAdapter.SelectCommand = CmdSql;

        //    conn.Open();
        //    CmdSql.ExecuteNonQuery();
        //    ExistsAdapter.Fill(dsExists);
        //    conn.Close();

        //    return dsExists;
        //}


        public string SaveStudentApplication()
        {
            string ID = StudentApplicationID.ToString();
        
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            //Opens a connection to the database.
            Connection.Open();
            SqlCommand Command;             
            String InsertSQL = "Insert into [dbo].[Student_Application] ([StudentEmailAddress],[StudentDateAdded], [StudentName], [StudentPassword] ) VALUES (@StudentEmailAddress, GetDate(), @StudentName, @StudentPassword); select Scope_identity(); ";
            Command = new SqlCommand(InsertSQL, Connection);
            Command.Parameters.AddWithValue("@StudentEmailAddress", StudentEmailAddress);
            Command.Parameters.AddWithValue("@StudentName", StudentName);
            Command.Parameters.AddWithValue("@StudentPassword", StudentPassword);
            
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            
            //Go to the Summary page 
            return ID;
        }

        public DataTable CheckEmailAddress(string EmailAddress)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + EmailAddress + "' <>'') Begin SELECT * From [dbo].[Student_Application] Where StudentEmailAddress = '" + EmailAddress + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable CheckIdentificationNumber(string IdentificationNumber)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + IdentificationNumber + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Applicant]A Where A.StudentIdentificationNumber = '" + IdentificationNumber + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable CheckApplicationID(string StudentApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + StudentApplicationID + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Applicant]A Where A.StudentApplicationID = '" + StudentApplicationID + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }
        
    }
}
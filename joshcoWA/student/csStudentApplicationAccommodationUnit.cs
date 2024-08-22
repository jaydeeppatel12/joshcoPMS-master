using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class csStudentApplicationAccommodationUnit
    {
        private long _StudentApplicationID;
        public long StudentApplicationID
        {
            get { return _StudentApplicationID; }
            set { _StudentApplicationID = value; }
        }


        private long _StudentAccommodationID;
        public long StudentAccommodationID
        {
            get { return _StudentAccommodationID; }
            set { _StudentAccommodationID = value; }
        }


        private long _StudentAccommodationUnitID;
        public long StudentAccommodationUnitID
        {
            get { return _StudentAccommodationUnitID; }
            set { _StudentAccommodationUnitID = value; }
        }

       
        public DataTable CheckApplicationID(string StudentApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + StudentApplicationID + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_ApplicationAccommodationUnit]A Where A.StudentApplicationID = '" + StudentApplicationID + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }



        public DataTable GetStudentApplicationAccommodationUnitDetails()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT A.* FROM [dbo].[Student_ApplicationAccommodationUnit]A join [dbo].[Student_Application]B on A.StudentApplicationID = B.StudentApplicationID Where A.StudentApplicationID = " + StudentApplicationID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }



        public void SaveStudentApplicationAccommodationUnit()
        {           
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            Connection.Open();
            SqlCommand Command;

            String InsertSQL = "Insert into [dbo].[Student_ApplicationAccommodationUnit] ([StudentApplicationID], [StudentAccommodationID], [StudentAccommodationUnitID]) VALUES (@StudentApplicationID, @StudentAccommodationID, @StudentAccommodationUnitID); select Scope_identity(); ";
           
      
                Command = new SqlCommand(InsertSQL, Connection);
                Command.Parameters.AddWithValue("@StudentApplicationID", StudentApplicationID);
                Command.Parameters.AddWithValue("@StudentAccommodationID", StudentAccommodationID);
                Command.Parameters.AddWithValue("@StudentAccommodationUnitID", StudentAccommodationUnitID);

                Command.ExecuteScalar();
                Connection.Close();          
                          
        }


        //public DataTable LoadPropertyUnitList()
        //{
        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
        //    SqlCommand CmdSql = new SqlCommand("SELECT * FROM   Student_Accommodation_Unit ", conn);

        //    DataTable dsExists = new DataTable();
        //    SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
        //    ExistsAdapter.SelectCommand = CmdSql;

        //    conn.Open();
        //    CmdSql.ExecuteNonQuery();
        //    ExistsAdapter.Fill(dsExists);
        //    conn.Close();

        //    return dsExists;
        //}

    }
}
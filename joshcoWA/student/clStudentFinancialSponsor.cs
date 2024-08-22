using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class clStudentFinancialSponsor
    {
        private long _StudentFinancialSponsorID;
        public long StudentFinancialSponsorID
        {
            get { return _StudentFinancialSponsorID; }
            set { _StudentFinancialSponsorID = value; }
        }

        private long _StudentApplicationID;
        public long StudentApplicationID
        {
            get { return _StudentApplicationID; }
            set { _StudentApplicationID = value; }
        }

        private String _FinancialSponsorType;
        public String FinancialSponsorType
        {
            get { return _FinancialSponsorType; }
            set { _FinancialSponsorType = value; }
        }

        private String _FinancialSponsorDescription;
        public String FinancialSponsorDescription
        {
            get { return _FinancialSponsorDescription; }
            set { _FinancialSponsorDescription = value; }
        }



        public DataTable CheckApplicationID(string StudentApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + StudentApplicationID + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_FinancialSponsor]A Where A.StudentApplicationID = '" + StudentApplicationID + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }


        //Save Financial Sponsor details
        public string SaveStudentFinancialSponsor()
        {
            string ID = StudentFinancialSponsorID.ToString();

            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            Connection.Open();
            SqlCommand Command;

            String InsertSQL = "Insert into [dbo].[Student_FinancialSponsor] ([StudentApplicationID], [FinancialSponsorType], [FinancialSponsorDescription]) VALUES (@StudentApplicationID, @FinancialSponsorType, @FinancialSponsorDescription); select Scope_identity(); ";
            //String UpdateSQL = "Update [dbo].[Student_FinancialSponsor] set [FinancialSponsorType] = @FinancialSponsorType, [FinancialSponsorDescription] = @FinancialSponsorDescription where [StudentApplicationID] = @StudentApplicationID; select  @StudentApplicantID;";


            if (String.IsNullOrEmpty(ID) || ID == "0")
            {//Insert
                Command = new SqlCommand(InsertSQL, Connection);


                Command.Parameters.AddWithValue("@StudentApplicationID", StudentApplicationID);
                Command.Parameters.AddWithValue("@FinancialSponsorType", FinancialSponsorType);
                Command.Parameters.AddWithValue("@FinancialSponsorDescription", FinancialSponsorDescription);

                ID = Convert.ToString(Command.ExecuteScalar());
                Connection.Close();
            }
            return ID;
        }


        public DataTable GetStudentFinancialSponsorDetails()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT A.* FROM [dbo].[Student_FinancialSponsor]A inner join [dbo].[Student_Application]B on A.StudentApplicationID = B.StudentApplicationID Where A.StudentApplicationID = " + StudentApplicationID + "  ;", conn);

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





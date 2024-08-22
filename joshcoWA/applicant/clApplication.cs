using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplication
    {
        private long mApplicationID;
        public long ApplicationID
        {
            get { return mApplicationID; }
            set { mApplicationID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }


        private long mPropertyUnitID;
        public long PropertyUnitID
        {
            get { return mPropertyUnitID; }
            set { mPropertyUnitID = value; }
        }

        private long mPropertyID;
        public long PropertyID
        {
            get { return mPropertyID; }
            set { mPropertyID = value; }
        }


        public string SaveApplication()
        {
            string ID = ApplicationID.ToString();

            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[Application] ([PropertyID], [ApplicantID], [DateAdded], [PropertyUnitID] ) VALUES ( @PropertyID, @ApplicantID, GetDate(), @PropertyUnitID ); select Scope_identity(); ";

            // 
            //Create a new Command object for inserting a new record. 
            Command = new SqlCommand(InsertSQL, Connection);
            // 

            Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);

            Command.Parameters.AddWithValue("@PropertyID", PropertyID);

            Command.Parameters.AddWithValue("@PropertyUnitID", PropertyUnitID);

            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public DataTable CheckEmailAddress(string EmailAddress)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + EmailAddress + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Applicant]A Where A.EmailAddress = '" + EmailAddress + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable CheckCellphoneNo(string CellphoneNo)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) A.* From [dbo].[Applicant]A Where A.MobileNumber = '" + CellphoneNo + "'  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable SearchApplication(string IDNumber, string EmailAddress)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) B. *, A.ApplicationID, A.PropertyID as PropID FROM [dbo].[Application]A join [dbo].[Applicant]B on A.ApplicantID = B.ApplicantID Where B.[IdentityNumber] = '" + IDNumber + "' and (B.[EmailAddress] = '" + EmailAddress + "' or B.[MobileNumber] = '" + EmailAddress + "') ;", conn);

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

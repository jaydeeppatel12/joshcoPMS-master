using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicantGeneralDetails
    {
        private long mApplicantGeneralDetailsID;
        public long ApplicantGeneralDetailsID
        {
            get { return mApplicantGeneralDetailsID; }
            set { mApplicantGeneralDetailsID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }

        private long mNumbefOfAdult;
        public long NumbefOfAdult
        {
            get { return mNumbefOfAdult; }
            set { mNumbefOfAdult = value; }
        }

        private long mNomberOfChildrenUnder12;
        public long NomberOfChildrenUnder12
        {
            get { return mNomberOfChildrenUnder12; }
            set { mNomberOfChildrenUnder12 = value; }
        }

        public DataTable GetApplicantGeneralDetails()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1)  * FROM [dbo].[ApplicantGeneralDetails]  Where ApplicantID = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveApplicantGeneralDetails()
        {
            string ID = ApplicantGeneralDetailsID.ToString();

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
            String InsertSQL = "Insert into [dbo].[ApplicantGeneralDetails] ([ApplicantID], [NumbefOfAdult], [NomberOfChildrenUnder12] ) VALUES ( @ApplicantID, @NumbefOfAdult, @NomberOfChildrenUnder12 ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantGeneralDetails] set [NumbefOfAdult] = @NumbefOfAdult, [NomberOfChildrenUnder12] = @NomberOfChildrenUnder12 where [ApplicantGeneralDetailsID] = @ApplicantGeneralDetailsID; select  @ApplicantGeneralDetailsID;  ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ApplicantGeneralDetailsID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantGeneralDetailsID", ID);

            }
            Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);
                Command.Parameters.AddWithValue("@NumbefOfAdult", NumbefOfAdult);
                Command.Parameters.AddWithValue("@NomberOfChildrenUnder12", NomberOfChildrenUnder12);

            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();

            // 
            //End event Save click 

            return ID;
        }

    }
}

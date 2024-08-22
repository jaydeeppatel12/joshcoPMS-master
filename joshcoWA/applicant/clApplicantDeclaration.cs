using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicantDeclaration
    {
        private long mApplicantDeclarationID;
        public long ApplicantDeclarationID
        {
            get { return mApplicantDeclarationID; }
            set { mApplicantDeclarationID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }

        private Boolean mIsNullDeclaration1;
        public Boolean IsNullDeclaration1
        {
            get { return mIsNullDeclaration1; }
            set { mIsNullDeclaration1 = value; }
        }

        private Boolean mDeclaration1;
        public Boolean Declaration1
        {
            get { return mDeclaration1; }
            set { mDeclaration1 = value; }
        }

        private Boolean mIsNullDeclaration2;
        public Boolean IsNullDeclaration2
        {
            get { return mIsNullDeclaration2; }
            set { mIsNullDeclaration2 = value; }
        }

        private Boolean mDeclaration2;
        public Boolean Declaration2
        {
            get { return mDeclaration2; }
            set { mDeclaration2 = value; }
        }

        private Boolean mIsNullDeclaration3;
        public Boolean IsNullDeclaration3
        {
            get { return mIsNullDeclaration3; }
            set { mIsNullDeclaration3 = value; }
        }

        private Boolean mDeclaration3;
        public Boolean Declaration3
        {
            get { return mDeclaration3; }
            set { mDeclaration3 = value; }
        }

        private Boolean mIsNullSignedByApplicantPlace;
        public Boolean IsNullSignedByApplicantPlace
        {
            get { return mIsNullSignedByApplicantPlace; }
            set { mIsNullSignedByApplicantPlace = value; }
        }

        private String mSignedByApplicantPlace;
        public String SignedByApplicantPlace
        {
            get { return mSignedByApplicantPlace; }
            set { mSignedByApplicantPlace = value; }
        }

        private Boolean mIsNullSignedByApplicantDate;
        public Boolean IsNullSignedByApplicantDate
        {
            get { return mIsNullSignedByApplicantDate; }
            set { mIsNullSignedByApplicantDate = value; }
        }

        private String mSignedByApplicantDate;
        public String SignedByApplicantDate
        {
            get { return mSignedByApplicantDate; }
            set { mSignedByApplicantDate = value; }
        }

        private Boolean mIsNullSignedByApplicantSpousePlace;
        public Boolean IsNullSignedByApplicantSpousePlace
        {
            get { return mIsNullSignedByApplicantSpousePlace; }
            set { mIsNullSignedByApplicantSpousePlace = value; }
        }

        private String mSignedByApplicantSpousePlace;
        public String SignedByApplicantSpousePlace
        {
            get { return mSignedByApplicantSpousePlace; }
            set { mSignedByApplicantSpousePlace = value; }
        }

        private Boolean mIsNullSignedByApplicantSpouseDate;
        public Boolean IsNullSignedByApplicantSpouseDate
        {
            get { return mIsNullSignedByApplicantSpouseDate; }
            set { mIsNullSignedByApplicantSpouseDate = value; }
        }

        private String mSignedByApplicantSpouseDate;
        public String SignedByApplicantSpouseDate
        {
            get { return mSignedByApplicantSpouseDate; }
            set { mSignedByApplicantSpouseDate = value; }
        }

        public DataTable GetApplicantDeclaration()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) * FROM [dbo].[ApplicantDeclaration]  Where ApplicantID = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveApplicantDeclaration()
        {
            string ID = ApplicantDeclarationID.ToString();

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
            String InsertSQL = "Insert into [dbo].[ApplicantDeclaration] ([ApplicantID], [Declaration1], [Declaration2], [Declaration3], [SignedByApplicantPlace], [SignedByApplicantDate], [SignedByApplicantSpousePlace], [SignedByApplicantSpouseDate] ) VALUES ( @ApplicantID, @Declaration1, @Declaration2, @Declaration3, @SignedByApplicantPlace, @SignedByApplicantDate, @SignedByApplicantSpousePlace, @SignedByApplicantSpouseDate ); select Scope_identity(); ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantDeclaration] set [ApplicantID] = @ApplicantID, [Declaration1] = @Declaration1, [Declaration2] = @Declaration2, [Declaration3] = @Declaration3, [SignedByApplicantPlace] = @SignedByApplicantPlace, [SignedByApplicantDate] = @SignedByApplicantDate, [SignedByApplicantSpousePlace] = @SignedByApplicantSpousePlace, [SignedByApplicantSpouseDate] = @SignedByApplicantSpouseDate where [ApplicantDeclarationID] = @ApplicantDeclarationID; select  @ApplicantDeclarationID;  ";

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
                //Set the @ApplicantDeclarationID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantDeclarationID", ID);

            }

                Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);

            Command.Parameters.AddWithValue("@Declaration1", Declaration1);

            Command.Parameters.AddWithValue("@Declaration2", Declaration2);

            Command.Parameters.AddWithValue("@Declaration3", Declaration3);

            Command.Parameters.AddWithValue("@SignedByApplicantPlace", SignedByApplicantPlace);
            Command.Parameters.AddWithValue("@SignedByApplicantSpousePlace", SignedByApplicantPlace);

            Command.Parameters.AddWithValue("@SignedByApplicantDate", SignedByApplicantDate);
            Command.Parameters.AddWithValue("@SignedByApplicantSpouseDate", SignedByApplicantSpouseDate);

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

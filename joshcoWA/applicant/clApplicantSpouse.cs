using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicantSpouse
    {
        private long mApplicantSpouseID;
        public long ApplicantSpouseID
        {
            get { return mApplicantSpouseID; }
            set { mApplicantSpouseID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }

        private String mFullName;
        public String FullName
        {
            get { return mFullName; }
            set { mFullName = value; }
        }

        private Boolean mIsNullMaidenName;
        public Boolean IsNullMaidenName
        {
            get { return mIsNullMaidenName; }
            set { mIsNullMaidenName = value; }
        }

        private String mMaidenName;
        public String MaidenName
        {
            get { return mMaidenName; }
            set { mMaidenName = value; }
        }

        private String mIdentityNumber;
        public String IdentityNumber
        {
            get { return mIdentityNumber; }
            set { mIdentityNumber = value; }
        }

        private String mNationality;
        public String Nationality
        {
            get { return mNationality; }
            set { mNationality = value; }
        }

        private Boolean mIsNullWorkNumber;
        public Boolean IsNullWorkNumber
        {
            get { return mIsNullWorkNumber; }
            set { mIsNullWorkNumber = value; }
        }

        private String mWorkNumber;
        public String WorkNumber
        {
            get { return mWorkNumber; }
            set { mWorkNumber = value; }
        }

        private String mMobileNumber;
        public String MobileNumber
        {
            get { return mMobileNumber; }
            set { mMobileNumber = value; }
        }

        private String mEmailAddress;
        public String EmailAddress
        {
            get { return mEmailAddress; }
            set { mEmailAddress = value; }
        }

        private Boolean mSameAddress;
        public Boolean SameAddress
        {
            get { return mSameAddress; }
            set { mSameAddress = value; }
        }

        private String mResidentialAddress;
        public String ResidentialAddress
        {
            get { return mResidentialAddress; }
            set { mResidentialAddress = value; }
        }


        public DataTable GetApplicantSpouse()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) * FROM [dbo].[ApplicantSpouse]  Where ApplicantID = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveApplicantSpouse()
        {
            string ID = ApplicantSpouseID.ToString();


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
            String InsertSQL = "Insert into [dbo].[ApplicantSpouse] ([ApplicantID], [FullName], [MaidenName], [IdentityNumber], [Nationality], [WorkNumber], [MobileNumber], [EmailAddress], [SameAddress], [ResidentialAddress] ) VALUES ( @ApplicantID, @FullName, @MaidenName, @IdentityNumber, @Nationality, @WorkNumber, @MobileNumber, @EmailAddress, @SameAddress, @ResidentialAddress ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantSpouse] set [FullName] = @FullName, [MaidenName] = @MaidenName, [IdentityNumber] = @IdentityNumber, [Nationality] = @Nationality, [WorkNumber] = @WorkNumber, [MobileNumber] = @MobileNumber, [EmailAddress] = @EmailAddress, [SameAddress] = @SameAddress, ResidentialAddress = @ResidentialAddress where [ApplicantSpouseID] = @ApplicantSpouseID; select  @ApplicantSpouseID; ";

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
                //Set the @ApplicantSpouseID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantSpouseID", ID);

            }
            Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);

            Command.Parameters.AddWithValue("@FullName", FullName);

            Command.Parameters.AddWithValue("@MaidenName", MaidenName);

            Command.Parameters.AddWithValue("@IdentityNumber", IdentityNumber);

            Command.Parameters.AddWithValue("@Nationality", Nationality);

            Command.Parameters.AddWithValue("@WorkNumber", WorkNumber);

            Command.Parameters.AddWithValue("@MobileNumber", MobileNumber);

            Command.Parameters.AddWithValue("@EmailAddress", EmailAddress);

            Command.Parameters.AddWithValue("@SameAddress", SameAddress);

            Command.Parameters.AddWithValue("@ResidentialAddress", ResidentialAddress);

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

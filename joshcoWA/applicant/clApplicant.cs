using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicant
    {
        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }


        private String mReferenceNo;
        public String ReferenceNo
        {
            get { return mReferenceNo; }
            set { mReferenceNo = value; }
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


        private Boolean mSMSNotification;
        public Boolean SMSNotification
        {
            get { return mSMSNotification; }
            set { mSMSNotification = value; }
        }

        private Boolean mEmailNotification;
        public Boolean EmailNotification
        {
            get { return mEmailNotification; }
            set { mEmailNotification = value; }
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

        private String mResidentialAddress;
        public String ResidentialAddress
        {
            get { return mResidentialAddress; }
            set { mResidentialAddress = value; }
        }

        private Boolean mIsNullMaritalStatusID;
        public Boolean IsNullMaritalStatusID
        {
            get { return mIsNullMaritalStatusID; }
            set { mIsNullMaritalStatusID = value; }
        }

        private long mMaritalStatusID;
        public long MaritalStatusID
        {
            get { return mMaritalStatusID; }
            set { mMaritalStatusID = value; }
        }

        private String mAlternativeContactPersonFullName;
        public String AlternativeContactPersonFullName
        {
            get { return mAlternativeContactPersonFullName; }
            set { mAlternativeContactPersonFullName = value; }
        }

        private String mAlternativeContactPersonMobile;
        public String AlternativeContactPersonMobile
        {
            get { return mAlternativeContactPersonMobile; }
            set { mAlternativeContactPersonMobile = value; }
        }

        private Boolean mPropertyOwner;
        public Boolean PropertyOwner
        {
            get { return mPropertyOwner; }
            set { mPropertyOwner = value; }
        }

        private Boolean mRecordFound = false;
        public Boolean RecordFound()
        {
            return mRecordFound;
        }

        public DataTable GetMaritalStatus()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT * FROM [dbo].[MaritalStatus];", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable GetApplicant()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT A.*, C.[PropertyName], B.[PropertyID] FROM [dbo].[Applicant]A join [dbo].[Application]B on A.ApplicantID = B.ApplicantID left join [dbo].[Property]C on C.PropertyID = B.PropertyID  Where A.ApplicantID = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

    
        //Check if applicant already exist before saving 
        public string SaveApplicant()
        {
            string ID = ApplicantID.ToString();

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
            String InsertSQL = "Insert into [dbo].[Applicant] ([ReferenceNo], [FullName], [MaidenName], [IdentityNumber], [Nationality], [WorkNumber], [MobileNumber], [EmailAddress], [ResidentialAddress], [MaritalStatusID], [AlternativeContactPersonFullName], [AlternativeContactPersonMobile], [PropertyOwner], SMSNotification, EmailNotification ) VALUES ( @ReferenceNo, @FullName, @MaidenName, @IdentityNumber, @Nationality, @WorkNumber, @MobileNumber, @EmailAddress, @ResidentialAddress, @MaritalStatusID, @AlternativeContactPersonFullName, @AlternativeContactPersonMobile, @PropertyOwner, @SMSNotification, @EmailNotification ); select Scope_identity(); ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[Applicant] set [FullName] = @FullName, [MaidenName] = @MaidenName, [IdentityNumber] = @IdentityNumber, [Nationality] = @Nationality, [WorkNumber] = @WorkNumber, [MobileNumber] = @MobileNumber, [EmailAddress] = @EmailAddress, [ResidentialAddress] = @ResidentialAddress, [MaritalStatusID] = @MaritalStatusID, [AlternativeContactPersonFullName] = @AlternativeContactPersonFullName, [AlternativeContactPersonMobile] = @AlternativeContactPersonMobile, [PropertyOwner] = @PropertyOwner SMSNotification = @SMSNotification, EmailNotification = @EmailNotification where [ApplicantID] = @ApplicantID; select  @ApplicantID;";

           
            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID=="0")
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
                //Set the @ApplicantID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantID", ID);

            }
            Command.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);

            Command.Parameters.AddWithValue("@SMSNotification", SMSNotification);

            Command.Parameters.AddWithValue("@EmailNotification", EmailNotification);

            Command.Parameters.AddWithValue("@FullName", FullName);

            Command.Parameters.AddWithValue("@MaidenName", MaidenName);

            Command.Parameters.AddWithValue("@IdentityNumber", IdentityNumber);

            Command.Parameters.AddWithValue("@Nationality", Nationality);

            Command.Parameters.AddWithValue("@WorkNumber", WorkNumber);

            Command.Parameters.AddWithValue("@MobileNumber", MobileNumber);

            Command.Parameters.AddWithValue("@EmailAddress", EmailAddress);

            Command.Parameters.AddWithValue("@ResidentialAddress", ResidentialAddress);

            if (MaritalStatusID > 0)
            {
                Command.Parameters.AddWithValue("@MaritalStatusID", MaritalStatusID);
            }
            else
            {
                Command.Parameters.AddWithValue("@MaritalStatusID", DBNull.Value);

            }

            Command.Parameters.AddWithValue("@AlternativeContactPersonFullName", AlternativeContactPersonFullName);

            Command.Parameters.AddWithValue("@AlternativeContactPersonMobile", AlternativeContactPersonMobile);

            Command.Parameters.AddWithValue("@PropertyOwner", PropertyOwner);

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

    }
}

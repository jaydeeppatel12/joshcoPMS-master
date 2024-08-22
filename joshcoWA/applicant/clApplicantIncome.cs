using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicantIncome
    {

        private long mApplicantIncomeID;
        public long ApplicantIncomeID
        {
            get { return mApplicantIncomeID; }
            set { mApplicantIncomeID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }

        private Boolean mIsNullGrossIncome;
        public Boolean IsNullGrossIncome
        {
            get { return mIsNullGrossIncome; }
            set { mIsNullGrossIncome = value; }
        }

        private  double mGrossIncome;
        public  double GrossIncome
        {
            get { return mGrossIncome; }
            set { mGrossIncome = value; }
        }

        private  double mPeriodicAllowance;
        public  double PeriodicAllowance
        {
            get { return mPeriodicAllowance; }
            set { mPeriodicAllowance = value; }
        }

        private  double mFinancialObligationByEmployer;
        public  double FinancialObligationByEmployer
        {
            get { return mFinancialObligationByEmployer; }
            set { mFinancialObligationByEmployer = value; }
        }

        private  double mHousingAllowancePayable;
        public  double HousingAllowancePayable
        {
            get { return mHousingAllowancePayable; }
            set { mHousingAllowancePayable = value; }
        }

        private Boolean mIsNullCommissionsReceived;
        public Boolean IsNullCommissionsReceived
        {
            get { return mIsNullCommissionsReceived; }
            set { mIsNullCommissionsReceived = value; }
        }

        private  double mCommissionsReceived;
        public  double CommissionsReceived
        {
            get { return mCommissionsReceived; }
            set { mCommissionsReceived = value; }
        }

        private Boolean mIsNullPensionDisabilityMaintenanceGrant;
        public Boolean IsNullPensionDisabilityMaintenanceGrant
        {
            get { return mIsNullPensionDisabilityMaintenanceGrant; }
            set { mIsNullPensionDisabilityMaintenanceGrant = value; }
        }

        private  double mPensionDisabilityMaintenanceGrant;
        public  double PensionDisabilityMaintenanceGrant
        {
            get { return mPensionDisabilityMaintenanceGrant; }
            set { mPensionDisabilityMaintenanceGrant = value; }
        }

        private Boolean mIsNullOther;
        public Boolean IsNullOther
        {
            get { return mIsNullOther; }
            set { mIsNullOther = value; }
        }

        private  double mOther;
        public  double Other
        {
            get { return mOther; }
            set { mOther = value; }
        }

        private Boolean mIsNullTotalIncome;
        public Boolean IsNullTotalIncome
        {
            get { return mIsNullTotalIncome; }
            set { mIsNullTotalIncome = value; }
        }

        private  double mTotalIncome;
        public  double TotalIncome
        {
            get { return mTotalIncome; }
            set { mTotalIncome = value; }
        }



        private  double mGrossIncomeSpouse;
        public  double GrossIncomeSpouse
        {
            get { return mGrossIncomeSpouse; }
            set { mGrossIncomeSpouse = value; }
        }

        private  double mPeriodicAllowanceSpouse;
        public  double PeriodicAllowanceSpouse
        {
            get { return mPeriodicAllowanceSpouse; }
            set { mPeriodicAllowanceSpouse = value; }
        }

        private  double mFinancialObligationByEmployerSpouse;
        public  double FinancialObligationByEmployerSpouse
        {
            get { return mFinancialObligationByEmployerSpouse; }
            set { mFinancialObligationByEmployerSpouse = value; }
        }

        private  double mHousingAllowancePayableSpouse;
        public  double HousingAllowancePayableSpouse
        {
            get { return mHousingAllowancePayableSpouse; }
            set { mHousingAllowancePayableSpouse = value; }
        }

        private  double mTotalIncomeSpouse;
        public  double TotalIncomeSpouse
        {
            get { return mTotalIncomeSpouse; }
            set { mTotalIncomeSpouse = value; }
        }

        public DataTable GetApplicantIncome()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("select Top(1) * from [dbo].[ApplicantIncome] where [ApplicantID] = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveApplicantIncome()
        {
            string ID = ApplicantIncomeID.ToString();

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
            String InsertSQL = "Insert into [dbo].[ApplicantIncome] ([ApplicantID], [GrossIncome], [PeriodicAllowance], [FinancialObligationByEmployer], [HousingAllowancePayable], [TotalIncome], [GrossIncomeSpouse], [PeriodicAllowanceSpouse], [FinancialObligationByEmployerSpouse], [HousingAllowancePayableSpouse], [TotalIncomeSpouse] ) VALUES (@ApplicantID,  @GrossIncome, @PeriodicAllowance, @FinancialObligationByEmployer, @HousingAllowancePayable, @TotalIncome,  @GrossIncomeSpouse, @PeriodicAllowanceSpouse, @FinancialObligationByEmployerSpouse, @HousingAllowancePayableSpouse, @TotalIncomeSpouse); select Scope_identity();   ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantIncome] set [GrossIncome] = @GrossIncome, [PeriodicAllowance] = @PeriodicAllowance, [FinancialObligationByEmployer] = @FinancialObligationByEmployer, [HousingAllowancePayable] = @HousingAllowancePayable,  [TotalIncome] = @TotalIncome, [GrossIncomeSpouse] = @GrossIncomeSpouse, [PeriodicAllowanceSpouse] = @PeriodicAllowanceSpouse, [FinancialObligationByEmployerSpouse] = @FinancialObligationByEmployerSpouse, [HousingAllowancePayableSpouse] = @HousingAllowancePayableSpouse,  [TotalIncomeSpouse] = @TotalIncomeSpouse where [ApplicantIncomeID] = @ApplicantIncomeID; select  @ApplicantIncomeID; ";

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
                //Set the @ApplicantIncomeID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantIncomeID", ID);

            }
            Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);

            Command.Parameters.AddWithValue("@GrossIncome", GrossIncome);

            Command.Parameters.AddWithValue("@PeriodicAllowance", PeriodicAllowance);

            Command.Parameters.AddWithValue("@FinancialObligationByEmployer", FinancialObligationByEmployer);

            Command.Parameters.AddWithValue("@HousingAllowancePayable", HousingAllowancePayable);

            Command.Parameters.AddWithValue("@TotalIncome", TotalIncome);

            Command.Parameters.AddWithValue("@GrossIncomeSpouse", GrossIncomeSpouse);

            Command.Parameters.AddWithValue("@PeriodicAllowanceSpouse", PeriodicAllowanceSpouse);

            Command.Parameters.AddWithValue("@FinancialObligationByEmployerSpouse", FinancialObligationByEmployerSpouse);

            Command.Parameters.AddWithValue("@HousingAllowancePayableSpouse", HousingAllowancePayableSpouse);

            Command.Parameters.AddWithValue("@TotalIncomeSpouse", TotalIncomeSpouse);

            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();

            // 
            //End event Save click 

            return ID;

        }

        public string SaveAdminApplicantIncome()
        {
            string ID = ApplicantIncomeID.ToString();

            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;
            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantIncome] set [CommissionsReceived] = @CommissionsReceived, [PensionDisabilityMaintenanceGrant] = @PensionDisabilityMaintenanceGrant, [Other] = @Other where [ApplicantIncomeID] = @ApplicantIncomeID; select  @ApplicantIncomeID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ApplicantIncomeID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantIncomeID", ID);


            Command.Parameters.AddWithValue("@CommissionsReceived", CommissionsReceived);

            Command.Parameters.AddWithValue("@PensionDisabilityMaintenanceGrant", PensionDisabilityMaintenanceGrant);

            Command.Parameters.AddWithValue("@Other", Other);


            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();

            // 
            //End event Save click 

            return ID;

        }
    }
}
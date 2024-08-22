using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicantExpenditure
    {
        private long mApplicantExpenditureID;
        public long ApplicantExpenditureID
        {
            get { return mApplicantExpenditureID; }
            set { mApplicantExpenditureID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }

        private double mCellphoneAccount;
        public double CellphoneAccount
        {
            get { return mCellphoneAccount; }
            set { mCellphoneAccount = value; }
        }

        private double mClothingAccount;
        public double ClothingAccount
        {
            get { return mClothingAccount; }
            set { mClothingAccount = value; }
        }

        private double mDSTVAccount;
        public double DSTVAccount
        {
            get { return mDSTVAccount; }
            set { mDSTVAccount = value; }
        }

        private double mFurnitureAccount;
        public double FurnitureAccount
        {
            get { return mFurnitureAccount; }
            set { mFurnitureAccount = value; }
        }

        private double mGroceries;
        public double Groceries
        {
            get { return mGroceries; }
            set { mGroceries = value; }
        }

        private double mInsurancePolicies;
        public double InsurancePolicies
        {
            get { return mInsurancePolicies; }
            set { mInsurancePolicies = value; }
        }

        private double mLoans;
        public double Loans
        {
            get { return mLoans; }
            set { mLoans = value; }
        }

        private double mChildMaintenance;
        public double ChildMaintenance
        {
            get { return mChildMaintenance; }
            set { mChildMaintenance = value; }
        }

        private double mMedicalAid;
        public double MedicalAid
        {
            get { return mMedicalAid; }
            set { mMedicalAid = value; }
        }

        private double mMotorVehicleInsurance;
        public double MotorVehicleInsurance
        {
            get { return mMotorVehicleInsurance; }
            set { mMotorVehicleInsurance = value; }
        }

        private double mMotorVehicleInstalment;
        public double MotorVehicleInstalment
        {
            get { return mMotorVehicleInstalment; }
            set { mMotorVehicleInstalment = value; }
        }

        private double mRent;
        public double Rent
        {
            get { return mRent; }
            set { mRent = value; }
        }

        private double mSavings;
        public double Savings
        {
            get { return mSavings; }
            set { mSavings = value; }
        }

        private double mSchoolFees;
        public double SchoolFees
        {
            get { return mSchoolFees; }
            set { mSchoolFees = value; }
        }

        private double mTransportCosts;
        public double TransportCosts
        {
            get { return mTransportCosts; }
            set { mTransportCosts = value; }
        }

        private double mWaterAndElectricity;
        public double WaterAndElectricity
        {
            get { return mWaterAndElectricity; }
            set { mWaterAndElectricity = value; }
        }

        private double mOther;
        public double Other
        {
            get { return mOther; }
            set { mOther = value; }
        }

        private double mTotalExpenditure;
        public double TotalExpenditure
        {
            get { return mTotalExpenditure; }
            set { mTotalExpenditure = value; }
        }
/****************************/

        private   double mCellphoneAccountSpouse;
        public   double CellphoneAccountSpouse
        {
            get { return mCellphoneAccountSpouse; }
            set { mCellphoneAccountSpouse = value; }
        }

        private   double mClothingAccountSpouse;
        public   double ClothingAccountSpouse
        {
            get { return mClothingAccountSpouse; }
            set { mClothingAccountSpouse = value; }
        }

        private   double mDSTVAccountSpouse;
        public   double DSTVAccountSpouse
        {
            get { return mDSTVAccountSpouse; }
            set { mDSTVAccountSpouse = value; }
        }

        private   double mFurnitureAccountSpouse;
        public   double FurnitureAccountSpouse
        {
            get { return mFurnitureAccountSpouse; }
            set { mFurnitureAccountSpouse = value; }
        }

        private   double mGroceriesSpouse;
        public   double GroceriesSpouse
        {
            get { return mGroceriesSpouse; }
            set { mGroceriesSpouse = value; }
        }

        private   double mInsurancePoliciesSpouse;
        public   double InsurancePoliciesSpouse
        {
            get { return mInsurancePoliciesSpouse; }
            set { mInsurancePoliciesSpouse = value; }
        }

        private   double mLoansSpouse;
        public   double LoansSpouse
        {
            get { return mLoansSpouse; }
            set { mLoansSpouse = value; }
        }

        private   double mChildMaintenanceSpouse;
        public   double ChildMaintenanceSpouse
        {
            get { return mChildMaintenanceSpouse; }
            set { mChildMaintenanceSpouse = value; }
        }

        private   double mMedicalAidSpouse;
        public   double MedicalAidSpouse
        {
            get { return mMedicalAidSpouse; }
            set { mMedicalAidSpouse = value; }
        }

        private   double mMotorVehicleInsuranceSpouse;
        public   double MotorVehicleInsuranceSpouse
        {
            get { return mMotorVehicleInsuranceSpouse; }
            set { mMotorVehicleInsuranceSpouse = value; }
        }

        private   double mMotorVehicleInstalmentSpouse;
        public   double MotorVehicleInstalmentSpouse
        {
            get { return mMotorVehicleInstalmentSpouse; }
            set { mMotorVehicleInstalmentSpouse = value; }
        }

        private   double mRentSpouse;
        public   double RentSpouse
        {
            get { return mRentSpouse; }
            set { mRentSpouse = value; }
        }

        private   double mSavingsSpouse;
        public   double SavingsSpouse
        {
            get { return mSavingsSpouse; }
            set { mSavingsSpouse = value; }
        }

        private   double mSchoolFeesSpouse;
        public   double SchoolFeesSpouse
        {
            get { return mSchoolFeesSpouse; }
            set { mSchoolFeesSpouse = value; }
        }

        private   double mTransportCostsSpouse;
        public   double TransportCostsSpouse
        {
            get { return mTransportCostsSpouse; }
            set { mTransportCostsSpouse = value; }
        }

        private   double mWaterAndElectricitySpouse;
        public   double WaterAndElectricitySpouse
        {
            get { return mWaterAndElectricitySpouse; }
            set { mWaterAndElectricitySpouse = value; }
        }

        private   double mOtherSpouse;
        public   double OtherSpouse
        {
            get { return mOtherSpouse; }
            set { mOtherSpouse = value; }
        }

        private   double mTotalExpenditureSpouse;
        public   double TotalExpenditureSpouse
        {
            get { return mTotalExpenditureSpouse; }
            set { mTotalExpenditureSpouse = value; }
        }

        private int mPropertyUnitID;
        public int PropertyUnitID
        {
            get { return mPropertyUnitID; }
            set { mPropertyUnitID = value; }
        }


        public DataTable GetRentalAmount()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Select * FROM [dbo].[PropertyUnit]  Where PropertyUnitID = " + PropertyUnitID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable GetApplicantExpenditure()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) * FROM [dbo].[ApplicantExpenditure]  Where ApplicantID = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveApplicantExpenditure()
        {
            string ID = ApplicantExpenditureID.ToString();


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
            String InsertSQL = "Insert into [dbo].[ApplicantExpenditure] ([ApplicantID], [CellphoneAccount], [ClothingAccount], [DSTVAccount], [FurnitureAccount], [Groceries], [InsurancePolicies], [Loans], [ChildMaintenance], [MedicalAid], [MotorVehicleInsurance], [MotorVehicleInstalment], [Rent], [Savings], [SchoolFees], [TransportCosts], [WaterAndElectricity], [Other], [TotalExpenditure], [CellphoneAccountSpouse], [ClothingAccountSpouse], [DSTVAccountSpouse], [FurnitureAccountSpouse], [GroceriesSpouse], [InsurancePoliciesSpouse], [LoansSpouse], [ChildMaintenanceSpouse], [MedicalAidSpouse], [MotorVehicleInsuranceSpouse], [MotorVehicleInstalmentSpouse], [SavingsSpouse], [SchoolFeesSpouse], [TransportCostsSpouse], [WaterAndElectricitySpouse], [OtherSpouse], [TotalExpenditureSpouse] ) VALUES ( @ApplicantID, @CellphoneAccount, @ClothingAccount, @DSTVAccount, @FurnitureAccount, @Groceries, @InsurancePolicies, @Loans, @ChildMaintenance, @MedicalAid, @MotorVehicleInsurance, @MotorVehicleInstalment, @Rent, @Savings, @SchoolFees, @TransportCosts, @WaterAndElectricity, @Other, @TotalExpenditure, @CellphoneAccountSpouse, @ClothingAccountSpouse, @DSTVAccountSpouse, @FurnitureAccountSpouse, @GroceriesSpouse, @InsurancePoliciesSpouse, @LoansSpouse, @ChildMaintenanceSpouse, @MedicalAidSpouse, @MotorVehicleInsuranceSpouse, @MotorVehicleInstalmentSpouse, @SavingsSpouse, @SchoolFeesSpouse, @TransportCostsSpouse, @WaterAndElectricitySpouse, @OtherSpouse, @TotalExpenditureSpouse ); select Scope_identity();   ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantExpenditure] set [CellphoneAccount] = @CellphoneAccount, [ClothingAccount] = @ClothingAccount, [DSTVAccount] = @DSTVAccount, [FurnitureAccount] = @FurnitureAccount, [Groceries] = @Groceries, [InsurancePolicies] = @InsurancePolicies, [Loans] = @Loans, [ChildMaintenance] = @ChildMaintenance, [MedicalAid] = @MedicalAid, [MotorVehicleInsurance] = @MotorVehicleInsurance, [MotorVehicleInstalment] = @MotorVehicleInstalment, [Rent] = @Rent, [Savings] = @Savings, [SchoolFees] = @SchoolFees, [TransportCosts] = @TransportCosts, [WaterAndElectricity] = @WaterAndElectricity, [Other] = @Other, [TotalExpenditure] = @TotalExpenditure, [CellphoneAccountSpouse] = @CellphoneAccountSpouse, [ClothingAccountSpouse] = @ClothingAccountSpouse, [DSTVAccountSpouse] = @DSTVAccountSpouse, [FurnitureAccountSpouse] = @FurnitureAccountSpouse, [GroceriesSpouse] = @GroceriesSpouse, [InsurancePoliciesSpouse] = @InsurancePoliciesSpouse, [LoansSpouse] = @LoansSpouse, [ChildMaintenanceSpouse] = @ChildMaintenanceSpouse, [MedicalAidSpouse] = @MedicalAidSpouse, [MotorVehicleInsuranceSpouse] = @MotorVehicleInsuranceSpouse, [MotorVehicleInstalmentSpouse] = @MotorVehicleInstalmentSpouse, [SavingsSpouse] = @SavingsSpouse, [SchoolFeesSpouse] = @SchoolFeesSpouse, [TransportCostsSpouse] = @TransportCostsSpouse, [WaterAndElectricitySpouse] = @WaterAndElectricitySpouse, [OtherSpouse] = @OtherSpouse, [TotalExpenditureSpouse] = @TotalExpenditureSpouse where [ApplicantExpenditureID] = @ApplicantExpenditureID;  select  @ApplicantExpenditureID;  ";

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
                //Set the @ApplicantExpenditureID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantExpenditureID", ID);

            }
            Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);

            Command.Parameters.AddWithValue("@CellphoneAccount", CellphoneAccount);

            Command.Parameters.AddWithValue("@ClothingAccount", ClothingAccount);

            Command.Parameters.AddWithValue("@DSTVAccount", DSTVAccount);

            Command.Parameters.AddWithValue("@FurnitureAccount", FurnitureAccount);

            Command.Parameters.AddWithValue("@Groceries", Groceries);

            Command.Parameters.AddWithValue("@InsurancePolicies", InsurancePolicies);

            Command.Parameters.AddWithValue("@Loans", Loans);

            Command.Parameters.AddWithValue("@ChildMaintenance", ChildMaintenance);

            Command.Parameters.AddWithValue("@MedicalAid", MedicalAid);

            Command.Parameters.AddWithValue("@MotorVehicleInsurance", MotorVehicleInsurance);

            Command.Parameters.AddWithValue("@MotorVehicleInstalment", MotorVehicleInstalment);

            Command.Parameters.AddWithValue("@Rent", Rent);

            Command.Parameters.AddWithValue("@Savings", Savings);

            Command.Parameters.AddWithValue("@SchoolFees", SchoolFees);

            Command.Parameters.AddWithValue("@TransportCosts", TransportCosts);

            Command.Parameters.AddWithValue("@WaterAndElectricity", WaterAndElectricity);

            Command.Parameters.AddWithValue("@Other", Other);
            Command.Parameters.AddWithValue("@TotalExpenditure", TotalExpenditure);

            Command.Parameters.AddWithValue("@CellphoneAccountSpouse", CellphoneAccountSpouse);

            Command.Parameters.AddWithValue("@ClothingAccountSpouse", ClothingAccountSpouse);

            Command.Parameters.AddWithValue("@DSTVAccountSpouse", DSTVAccountSpouse);

            Command.Parameters.AddWithValue("@FurnitureAccountSpouse", FurnitureAccountSpouse);

            Command.Parameters.AddWithValue("@GroceriesSpouse", GroceriesSpouse);

            Command.Parameters.AddWithValue("@InsurancePoliciesSpouse", InsurancePoliciesSpouse);

            Command.Parameters.AddWithValue("@LoansSpouse", LoansSpouse);

            Command.Parameters.AddWithValue("@ChildMaintenanceSpouse", ChildMaintenanceSpouse);

            Command.Parameters.AddWithValue("@MedicalAidSpouse", MedicalAidSpouse);

            Command.Parameters.AddWithValue("@MotorVehicleInsuranceSpouse", MotorVehicleInsuranceSpouse);

            Command.Parameters.AddWithValue("@MotorVehicleInstalmentSpouse", MotorVehicleInstalmentSpouse);

 

            Command.Parameters.AddWithValue("@SavingsSpouse", SavingsSpouse);

            Command.Parameters.AddWithValue("@SchoolFeesSpouse", SchoolFeesSpouse);

            Command.Parameters.AddWithValue("@TransportCostsSpouse", TransportCostsSpouse);

            Command.Parameters.AddWithValue("@WaterAndElectricitySpouse", WaterAndElectricitySpouse);

            Command.Parameters.AddWithValue("@OtherSpouse", OtherSpouse);
            Command.Parameters.AddWithValue("@TotalExpenditureSpouse", TotalExpenditureSpouse);
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
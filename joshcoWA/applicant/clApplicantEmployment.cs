﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA.applicant
{
    class clApplicantEmployment
    {
              private long mApplicantEmploymentID;
        public long ApplicantEmploymentID
        {
            get { return mApplicantEmploymentID; }
            set { mApplicantEmploymentID = value; }
        }

        private long mApplicantID;
        public long ApplicantID
        {
            get { return mApplicantID; }
            set { mApplicantID = value; }
        }

        private Boolean mSelfEmployed;
        public Boolean SelfEmployed
        {
            get { return mSelfEmployed; }
            set { mSelfEmployed = value; }
        }

        private String mOccupation;
        public String Occupation
        {
            get { return mOccupation; }
            set { mOccupation = value; }
        }

        private Boolean mIsNullCurrentEmployer;
        public Boolean IsNullCurrentEmployer
        {
            get { return mIsNullCurrentEmployer; }
            set { mIsNullCurrentEmployer = value; }
        }

        private String mCurrentEmployer;
        public String CurrentEmployer
        {
            get { return mCurrentEmployer; }
            set { mCurrentEmployer = value; }
        }

        private Boolean mIsNullEmployerAddress;
        public Boolean IsNullEmployerAddress
        {
            get { return mIsNullEmployerAddress; }
            set { mIsNullEmployerAddress = value; }
        }

        private String mEmployerAddress;
        public String EmployerAddress
        {
            get { return mEmployerAddress; }
            set { mEmployerAddress = value; }
        }

        private String mEmploymentPeriod;
        public String EmploymentPeriod
        {
            get { return mEmploymentPeriod; }
            set { mEmploymentPeriod = value; }
        }

        private String mGrossSalary;
        public String GrossSalary
        {
            get { return mGrossSalary; }
            set { mGrossSalary = value; }
        }

        private String mSalaryPaymentMonth;
        public String SalaryPaymentMonth
        {
            get { return mSalaryPaymentMonth; }
            set { mSalaryPaymentMonth = value; }
        }

        private string mSalaryPaymentDay;
        public string SalaryPaymentDay
        {
            get { return mSalaryPaymentDay; }
            set { mSalaryPaymentDay = value; }
        }

        private Boolean mRecordFound = false;
        public Boolean RecordFound()
        {
            return mRecordFound;
        }

        public DataTable GetApplicantEmployment()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) * FROM [dbo].[ApplicantEmployment]  Where ApplicantID = " + ApplicantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveApplicantEmployment()
        {
            string ID = ApplicantEmploymentID.ToString();

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
            String InsertSQL = "Insert into [dbo].[ApplicantEmployment] ([ApplicantID], [SelfEmployed], [Occupation], [CurrentEmployer], [EmployerAddress], [EmploymentPeriod], [GrossSalary], [SalaryPaymentDay] ) VALUES ( @ApplicantID, @SelfEmployed, @Occupation, @CurrentEmployer, @EmployerAddress, @EmploymentPeriod, @GrossSalary, @SalaryPaymentDay ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ApplicantEmployment] set [SelfEmployed] = @SelfEmployed, [Occupation] = @Occupation, [CurrentEmployer] = @CurrentEmployer, [EmployerAddress] = @EmployerAddress, [EmploymentPeriod] = @EmploymentPeriod, [GrossSalary] = @GrossSalary, SalaryPaymentDay = @SalaryPaymentDay where [ApplicantEmploymentID] = @ApplicantEmploymentID; select  @ApplicantEmploymentID; ";

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
                //Set the @ApplicantEmploymentID field for updates. 
                Command.Parameters.AddWithValue("@ApplicantEmploymentID", ID);

            }
            Command.Parameters.AddWithValue("@ApplicantID", ApplicantID);
            Command.Parameters.AddWithValue("@SelfEmployed", SelfEmployed);

            Command.Parameters.AddWithValue("@Occupation", Occupation);

            Command.Parameters.AddWithValue("@CurrentEmployer", CurrentEmployer);

            Command.Parameters.AddWithValue("@EmployerAddress", EmployerAddress);

            Command.Parameters.AddWithValue("@EmploymentPeriod", EmploymentPeriod);

            Command.Parameters.AddWithValue("@GrossSalary", GrossSalary);

            Command.Parameters.AddWithValue("@SalaryPaymentDay", SalaryPaymentDay);

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
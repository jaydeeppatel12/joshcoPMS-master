using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class clStudentParent
    {
        private long _StudentParentID;
        public long StudentParentID
        {
            get { return _StudentParentID; }
            set { _StudentParentID = value; }
        }


        private long _StudentApplicationID;
        public long StudentApplicationID
        {
            get { return _StudentApplicationID; }
            set { _StudentApplicationID = value; }
        }


        private String _ReferenceNo;
        public String ReferenceNo
        {
            get { return _ReferenceNo; }
            set { _ReferenceNo = value; }
        }

        private String _FullName;
        public String FullName
        {
            get { return _FullName; }
            set { _FullName = value; }
        }

        private String _IdentificationNumber;
        public String IdentificationNumber
        {
            get { return _IdentificationNumber; }
            set { _IdentificationNumber = value; }
        }

        private String _ResidentialAddress;
        public String ResidentialAddress
        {
            get { return _ResidentialAddress; }
            set { _ResidentialAddress = value; }
        }

        private String _EmailAddress;
        public String EmailAddress
        {
            get { return _EmailAddress; }
            set { _EmailAddress = value; }
        }

        private String _MobileNumber;
        public String MobileNumber
        {
            get { return _MobileNumber; }
            set { _MobileNumber = value; }
        }

        private String _CurrentEmployer;
        public String CurrentEmployer
        {
            get { return _CurrentEmployer; }
            set { _CurrentEmployer = value; }
        }


        private decimal _MonthlyIncome;
        public decimal MonthlyIncome
        {
            get { return _MonthlyIncome; }
            set { _MonthlyIncome = value; }
        }


        private String _Bank;
        public String Bank
        {
            get { return _Bank; }
            set { _Bank = value; }
        }


        private String _AccountNumber;
        public String AccountNumber
        {
            get { return _AccountNumber; }
            set { _AccountNumber = value; }
        }


        private String _BillingDay;
        public String BillingDay
        {
            get { return _BillingDay; }
            set { _BillingDay = value; }
        }


        public DataTable CheckApplicationID(string StudentApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + StudentApplicationID + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Parent]A Where A.StudentApplicationID = '" + StudentApplicationID + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable GetStudentParentApplicantDetails()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT A.* FROM [dbo].[Student_Parent]A join [dbo].[Student_Application]B on A.StudentApplicationID = B.StudentApplicationID Where A.StudentApplicationID = " + StudentApplicationID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }


        //Save applicant details
        public string SaveStudentParent()
        {
            string ID = StudentParentID.ToString();

            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            Connection.Open();
            SqlCommand Command;
                 
            String InsertSQL = "Insert into [dbo].[Student_Parent] ([StudentApplicationID], [ReferenceNo], [FullName], [IdentificationNumber], [ResidentialAddress], [EmailAddress], [MobileNumber], [CurrentEmployer], [MonthlyIncome], [Bank], [AccountNumber], [BillingDay]) VALUES (@StudentApplicationID, @ReferenceNo, @FullName, @IdentitificationNumber,  @ResidentialAddress, @EmailAddress, @MobileNumber, @CurrentEmployer, @MonthlyIncome, @Bank, @AccountNumber, @BillingDay); select Scope_identity(); ";
            String UpdateSQL = "Update [dbo].[Student_Parent] set [FullName] = @FullName, [IdentificationNumber] = @IdentificationNumber, [ResidentialAddress] = @ResidentialAddress, [EmailAddress] = @EmailAddress, [MobileNumber] = @MobileNumber, [CurrentEmployer] = @CurrentEmployer, [MonthlyIncome] = @MonthlyIncome, [Bank] = @Bank, [AccountNumber] = @AccountNumber, [BillingDay] = @BillingDay where [StudentApplicationID] = @StudentApplicationID; select  @StudentApplicantID;";


            if (String.IsNullOrEmpty(ID) || ID == "0")
            {//Insert
                Command = new SqlCommand(InsertSQL, Connection);
            }
            else
            {//update                   
                Command = new SqlCommand(UpdateSQL, Connection);
                Command.Parameters.AddWithValue("@StudentApplicationID", ID);
            }
            Command.Parameters.AddWithValue("@StudentApplicationID", StudentApplicationID);
            Command.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);
            Command.Parameters.AddWithValue("@FullName", FullName);
            Command.Parameters.AddWithValue("@IdentitificationNumber", IdentificationNumber);
            Command.Parameters.AddWithValue("@ResidentialAddress", ResidentialAddress);
            Command.Parameters.AddWithValue("@EmailAddress", EmailAddress);
            Command.Parameters.AddWithValue("@MobileNumber", MobileNumber);
            Command.Parameters.AddWithValue("@CurrentEmployer", CurrentEmployer);
            Command.Parameters.AddWithValue("@MonthlyIncome", MonthlyIncome);
            Command.Parameters.AddWithValue("@Bank", Bank);
            Command.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            Command.Parameters.AddWithValue("@BillingDay", BillingDay);

            ID = Convert.ToString(Command.ExecuteScalar());
            Connection.Close();
            return ID;
        }


        public DataTable CheckEmailAddress(string EmailAddress)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + EmailAddress + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Parent]A Where A.EmailAddress = '" + EmailAddress + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable CheckIdentificationNumber(string IdentificationNumber)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + IdentificationNumber + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Parent]A Where A.IdentificationNumber = '" + IdentificationNumber + "' ; End", conn);

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
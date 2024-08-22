using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class clStudentApplicant
    {    
        private long _StudentApplicantID;
        public long StudentApplicantID
        {
            get { return _StudentApplicantID; }
            set { _StudentApplicantID = value; }
        }

        private long _StudentApplicationID;
        public long StudentApplicationID
        {
            get { return _StudentApplicationID; }
            set { _StudentApplicationID = value; }
        }

        private String _StudentReferenceNo;
        public String StudentReferenceNo
        {
            get { return _StudentReferenceNo; }
            set { _StudentReferenceNo = value; }
        }

        private String _StudentFirstName;
        public String StudentFirstName
        {
            get { return _StudentFirstName; }
            set { _StudentFirstName = value; }
        }

        private String _StudentMiddleName;
        public String StudentMiddleName
        {
            get { return _StudentMiddleName; }
            set { _StudentMiddleName = value; }
        }

        private String _StudentLastName;
        public String StudentLastName
        {
            get { return _StudentLastName; }
            set { _StudentLastName = value; }
        }

        private String _StudentGender;
        public String StudentGender
        {
            get { return _StudentGender; }
            set { _StudentGender = value; }
        }

        private String _StudentIdentificationNumber;
        public String StudentIdentificationNumber
        {
            get { return _StudentIdentificationNumber; }
            set { _StudentIdentificationNumber = value; }
        }

        private String _StudentEmailAddress;
        public String StudentEmailAddress
        {
            get { return _StudentEmailAddress; }
            set { _StudentEmailAddress = value; }
        }

        private String _StudentMobileNumber;
        public String StudentMobileNumber
        {
            get { return _StudentMobileNumber; }
            set { _StudentMobileNumber = value; }
        }

        private String _StudentHomeAddress;
        public String StudentHomeAddress
        {
            get { return _StudentHomeAddress; }
            set { _StudentHomeAddress = value; }
        }

        private String _StudentNationality;
        public String StudentNationality
        {
            get { return _StudentNationality; }
            set { _StudentNationality = value; }
        }

        private String _StudentOccupation;
        public String StudentOccupation
        {
            get { return _StudentOccupation; }
            set { _StudentOccupation = value; }
        }

        private String _StudentEmploymentStatus;
        public String StudentEmploymentStatus
        {
            get { return _StudentEmploymentStatus; }
            set { _StudentEmploymentStatus = value; }
        }

        private String _StudentIndustryclassification;
        public String StudentIndustryclassification
        {
            get { return _StudentIndustryclassification; }
            set { _StudentIndustryclassification = value; }
        }

        private Boolean _StudentIsProcurementPublicOfficial;
        public Boolean StudentIsProcurementPublicOfficial
        {
            get { return _StudentIsProcurementPublicOfficial; }
            set { _StudentIsProcurementPublicOfficial = value; }
        }


        private String _StudentInstitution;
        public String StudentInstitution
        {
            get { return _StudentInstitution; }
            set { _StudentInstitution = value; }
        }

        private String _StudentFaculty;
        public String StudentFaculty
        {
            get { return _StudentFaculty; }
            set { _StudentFaculty = value; }
        }


        private String _StudentCourse;
        public String StudentCourse
        {
            get { return _StudentCourse; }
            set { _StudentCourse = value; }
        }


        private String _StudentNumber;
        public String StudentNumber
        {
            get { return _StudentNumber; }
            set { _StudentNumber = value; }
        }


        private String _StudentAcademicYear;
        public String StudentAcademicYear
        {
            get { return _StudentAcademicYear; }
            set { _StudentAcademicYear = value; }
        }


        private String _StudentCourseDuration;
        public String StudentCourseDuration
        {
            get { return _StudentCourseDuration; }
            set { _StudentCourseDuration = value; }
        }

        private Boolean _StudentIsOTPVerified;
        public bool StudentIsOTPVerified
        {
            get { return _StudentIsOTPVerified; }
            set { _StudentIsOTPVerified = value; }
        }


        public DataTable CheckApplicationID(string StudentApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + StudentApplicationID + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Applicant]A Where A.StudentApplicationID = '" + StudentApplicationID + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string UpdateOTPVerified()
        {
            string ID = StudentApplicantID.ToString();

            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            Connection.Open();
            SqlCommand Command;

            String UpdateSQL = "Update [dbo].[Student_Applicant] set [StudentIsOTPVerified] = @StudentIsOTPVerified where [StudentApplicantID] = @StudentApplicantID; select  @StudentApplicantID;";
                            
            Command = new SqlCommand(UpdateSQL, Connection);
            Command.Parameters.AddWithValue("@StudentApplicantID", ID);            
            Command.Parameters.AddWithValue("@StudentIsOTPVerified", StudentIsOTPVerified);
           
            ID = Convert.ToString(Command.ExecuteScalar());
            Connection.Close();
            return ID;
        }

        public DataTable CheckEmailAddress(string EmailAddress)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + EmailAddress + "' <>'') Begin SELECT * From [dbo].[Student_Applicant] Where StudentEmailAddress = '" + EmailAddress + "' ; End", conn);

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
            SqlCommand CmdSql = new SqlCommand("IF('" + IdentificationNumber + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Applicant]A Where A.StudentIdentificationNumber = '" + IdentificationNumber + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }



        public DataTable GetStudentApplicantDetails()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT A.* FROM [dbo].[Student_Applicant]A inner join [dbo].[Student_Application]B on A.StudentApplicationID = B.StudentApplicationID Where A.StudentApplicationID = " + StudentApplicationID + "  ;", conn);

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
        public string SaveStudentApplicant()
        {
            string ID = StudentApplicantID.ToString();

            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            Connection.Open();
            SqlCommand Command;

            String InsertSQL = "Insert into [dbo].[Student_Applicant] ([StudentApplicationID], [StudentReferenceNo], [StudentFirstName], [StudentMiddleName], [StudentLastName], [StudentGender], [StudentIdentificationNumber], [StudentEmailAddress], [StudentMobileNumber], [StudentHomeAddress], [StudentNationality], [StudentInstitution], [StudentFaculty], [StudentCourse], [StudentNumber], [StudentAcademicYear], [StudentCourseDuration]) VALUES (@StudentApplicationID, @StudentReferenceNo, @StudentFirstName, @StudentMiddleName,  @StudentLastName, @StudentGender, @StudentIdentificationNumber, @StudentEmailAddress, @StudentMobileNumber, @StudentHomeAddress, @StudentNationality, @StudentInstitution,  @StudentFaculty,  @StudentCourse,  @StudentNumber,  @StudentAcademicYear,  @StudentCourseDuration); select Scope_identity(); ";
            String UpdateSQL = "Update [dbo].[Student_Applicant] set [StudentFirstName] = @StudentFirstName, [StudentMiddleName] = @StudentMiddleName, [StudentLastName] = @StudentLastName, [StudentIdentificationNumber] = @StudentIdentitificationNumber, [StudentEmailAddress] = @StudentEmailAddress, [StudentMobileNumber] = @StudentMobileNumber, [StudentHomeAddress] = @StudentHomeAddress, [StudentNationality] = @StudentNationality where [StudentApplicationID] = @StudentApplicationID; select  @StudentApplicantID;";

    
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {//Insert
                Command = new SqlCommand(InsertSQL, Connection);
            }
            else
            {//update                   
                Command = new SqlCommand(UpdateSQL, Connection);
                Command.Parameters.AddWithValue("@StudentApplicantID", ID);
            }
            Command.Parameters.AddWithValue("@StudentApplicationID", StudentApplicationID);
            Command.Parameters.AddWithValue("@StudentReferenceNo", StudentReferenceNo);
            Command.Parameters.AddWithValue("@StudentFirstName", StudentFirstName);
            Command.Parameters.AddWithValue("@StudentMiddleName", StudentMiddleName);
            Command.Parameters.AddWithValue("@StudentLastName", StudentLastName);
            Command.Parameters.AddWithValue("@StudentGender", StudentGender);
            Command.Parameters.AddWithValue("@StudentIdentificationNumber", StudentIdentificationNumber);
            Command.Parameters.AddWithValue("@StudentEmailAddress", StudentEmailAddress);
            Command.Parameters.AddWithValue("@StudentMobileNumber", StudentMobileNumber);
            Command.Parameters.AddWithValue("@StudentHomeAddress", StudentHomeAddress);
            Command.Parameters.AddWithValue("@StudentNationality", StudentNationality);
            Command.Parameters.AddWithValue("@StudentInstitution", StudentInstitution);
            Command.Parameters.AddWithValue("@StudentFaculty", StudentFaculty);
            Command.Parameters.AddWithValue("@StudentCourse", StudentCourse);
            Command.Parameters.AddWithValue("@StudentNumber", StudentNumber);
            Command.Parameters.AddWithValue("@StudentAcademicYear", StudentAcademicYear);
            Command.Parameters.AddWithValue("@StudentCourseDuration", StudentCourseDuration);


            ID = Convert.ToString(Command.ExecuteScalar());
            Connection.Close();
            return ID;
        }
    }
}
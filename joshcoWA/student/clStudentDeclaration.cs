using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{   
    public class clStudentDeclaration
    {	

		private long _StudentDeclarationID;
		public long StudentDeclarationID
		{
			get { return _StudentDeclarationID; }
			set { _StudentDeclarationID = value; }
		}

		private long _StudentApplicationID;
		public long StudentApplicationID
		{
			get { return _StudentApplicationID; }
			set { _StudentApplicationID = value; }
		}

		private Boolean _StudentDeclaration1;
		public bool StudentDeclaration1
		{
			get { return _StudentDeclaration1; }
			set { _StudentDeclaration1 = value; }
		}

		private Boolean _StudentDeclaration2;
		public bool StudentDeclaration2
		{
			get { return _StudentDeclaration2; }
			set { _StudentDeclaration2 = value; }
		}

		private Boolean _StudentDeclaration3;
		public bool StudentDeclaration3
		{
			get { return _StudentDeclaration3; }
			set { _StudentDeclaration3 = value; }
		}

		private String _SignedAtStudentPlace;
		public String SignedAtStudentPlace
        {
			get { return _SignedAtStudentPlace; }
			set { _SignedAtStudentPlace = value; }
		}


		private String _SignedAtStudentDate;
		public String SignedAtStudentDate
		{
			get { return _SignedAtStudentDate; }
			set { _SignedAtStudentDate = value; }
		}


        public DataTable CheckApplicationID(string StudentApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("IF('" + StudentApplicationID + "' <>'') Begin SELECT Top(1) A.* From [dbo].[Student_Declaration]A Where A.StudentApplicationID = '" + StudentApplicationID + "' ; End", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }


        public DataTable GetStudentDeclarationByApplicationID()
		{
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
			SqlCommand CmdSql = new SqlCommand("SELECT Top(1) * FROM [dbo].[Student_Declaration]  Where  StudentApplicationID = " + StudentApplicationID + "  ;", conn);

			DataTable dsExists = new DataTable();
			SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
			ExistsAdapter.SelectCommand = CmdSql;

			conn.Open();
			CmdSql.ExecuteNonQuery();
			ExistsAdapter.Fill(dsExists);
			conn.Close();

			return dsExists;
		}


      
  
      
      //,[SignedByStudentPlace]
      //,[SignedByStudentDate]
      //  FROM[joshco_pms].[dbo].[Student_Declaration]

        public string SaveApplicantDeclaration()
        {
            string ID = StudentDeclarationID.ToString();

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
            String InsertSQL = "Insert into [dbo].[Student_Declaration] ([StudentApplicationID], [StudentDeclaration1], [StudentDeclaration2], [StudentDeclaration3], [SignedAtStudentPlace], [SignedAtStudentDate] ) VALUES ( @StudentApplicationID, @StudentDeclaration1, @StudentDeclaration2, @StudentDeclaration3, @SignedAtStudentPlace, @SignedAtStudentDate ); select Scope_identity(); ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[Student_Declaration] set [StudentApplicationID] = @StudentApplicationID, [StudentDeclaration1] = @StudentDeclaration1, [StudentDeclaration2] = @StudentDeclaration2, [StudentDeclaration3] = @StudentDeclaration3, [SignedByApplicantPlace] = @SignedAtApplicantPlace, [SignedAtStudentDate] = @SignedAtStudentDate where [StudentDeclarationID] = @StudentDeclarationID; select  @StudentDeclarationID;  ";

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
                Command.Parameters.AddWithValue("@StudentDeclarationID", ID);

            }

            Command.Parameters.AddWithValue("@StudentApplicationID", StudentApplicationID);

            Command.Parameters.AddWithValue("@StudentDeclaration1", StudentDeclaration1);

            Command.Parameters.AddWithValue("@StudentDeclaration2", StudentDeclaration2);

            Command.Parameters.AddWithValue("@StudentDeclaration3", StudentDeclaration3);

            Command.Parameters.AddWithValue("@SignedAtStudentPlace", SignedAtStudentPlace);

            Command.Parameters.AddWithValue("@SignedAtStudentDate", SignedAtStudentDate);
         

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
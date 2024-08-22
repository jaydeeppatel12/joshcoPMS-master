using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace joshcoWA
{
  class csProperty
  {
    public DataTable GetTenantsByPropertyName(string PropertyName)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand(" Exec GetTenantFormReportDetailsByProjectName '" + PropertyName + "'", conn);
      DataTable dsExists = new DataTable();
      SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
      ExistsAdapter.SelectCommand = CmdSql;

      conn.Open();
      CmdSql.ExecuteNonQuery();
      ExistsAdapter.Fill(dsExists);
      conn.Close();

      return dsExists;
    }
        public DataTable GetProperty(string PropertyID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT * FROM [dbo].[Property] A LEFT OUTER JOIN [dbo].[PropertyImage] pi on a.PropertyID = pi.PropertyID Where A.PropertyID = " + PropertyID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }
        public DataTable GetPropertyEmployee(string PropertyID)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand("SELECT Top(1) A.* FROM [dbo].[Employee]A join [EmployeeProperty]B on A.EmployeeID = B.EmployeeID  Where B.PropertyID = " + PropertyID + "  ;", conn);

      DataTable dsExists = new DataTable();
      SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
      ExistsAdapter.SelectCommand = CmdSql;

      conn.Open();
      CmdSql.ExecuteNonQuery();
      ExistsAdapter.Fill(dsExists);
      conn.Close();

      return dsExists;
    }

        public void SavePropertyImageDetails(string PropertyID, string ImageFileName)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand sqlCommand = new SqlCommand("Insert into [PropertyImage]([PropertyID], [ImageFileName])values(@PropertyID,@ImageFileName);", connection))
                {
                    SqlParameter sqlParameter1 = new SqlParameter("@PropertyID", SqlDbType.BigInt);
                    sqlParameter1.Value = (object)PropertyID;
                    SqlParameter sqlParameter2 = new SqlParameter("@ImageFileName", SqlDbType.VarChar, 800);
                    sqlParameter2.Value = (object)ImageFileName;
                    sqlCommand.Parameters.AddRange(new SqlParameter[2] { sqlParameter1, sqlParameter2 });
                    sqlCommand.ExecuteNonQuery();
                }
            }
        }

        public DataTable GetPropertyDocument(string PropertyID)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand("SELECT A.* "
      + ", case when  [ContentType] like '%word%' or  [ContentType] like '%doc%' or [ContentType] like '%docx%'  then '~/images/doc/doc.png'"
      + " when  [ContentType] like '%jpg%' or [ContentType] like '%jpeg%'   then '~/images/doc/jpg.png'"
      + " when  [ContentType] like '%png%' then '~/images/doc/png.png'"
      + " when  [ContentType] like '%pdf%'  then '~/images/doc/pdf.png'"
      + " when  [ContentType] like '%zip%'  then '~/images/doc/zip.png'"
      + " else '~/images/doc/unknown.png'"
      + " end as IconUrl"
      + " FROM [dbo].[PropertyDocument]A  Where A.PropertyID = " + PropertyID + "  order by A.DocumentName;", conn);

      DataTable dsExists = new DataTable();
      SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
      ExistsAdapter.SelectCommand = CmdSql;

      conn.Open();
      CmdSql.ExecuteNonQuery();
      ExistsAdapter.Fill(dsExists);
      conn.Close();

      return dsExists;
    }
    public void DeletePropertyDocument(string PropertyDocumentID)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand(" delete from [dbo].[PropertyDocument]  Where PropertyDocumentID = " + PropertyDocumentID + ";", conn);

      DataTable dsExists = new DataTable();
      SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
      ExistsAdapter.SelectCommand = CmdSql;

      conn.Open();
      CmdSql.ExecuteNonQuery();
      conn.Close();
    }
    public DataTable GetPropertyLease(string PropertyID)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand(""
+ " SELECT  "
+ " [LeaseID]"
+ " , Frequency"
+ " ,A.[PropertyUnitID]"
+ " ,A.[TenantID]"
+ " ,CAST([InitialValue] AS DECIMAL(15,2)) AS [InitialValue]"
+ " ,[Vatable]"
+ " ,ISNULL([Escalation], '0') AS [Escalation]"
+ " ,[Commencement] as LeaseStartDate"
+ " ,[Termination] as LeaseEndDate"
+ " ,ISNULL([InterestPercentage], '0') AS [InterestPercentage]"
+ " ,case when [PersonOrCompany] = 1 then [Name]+' '+[Surname] else [CompanyName] end LesseeName"
+ " ,[PropertyName]"
+ " ,Case when [TypeOfLease] =2 then 'Yearly' else 'Monthly' end as TypeOfLease"
+ " ,[Interest]"
+ " , LeaseStatus"
+ " , (Select top(1) lr.January From [LeaseRent]lr Where lr.LeaseID = a.LeaseID and lr.FinYear = '2018') as AmountDueThisMonth"
+ " ,Lat"
+ " ,Long"
+ " , Approved"
+ " , Comment"
+ " ,LesseeFinYear,"
+ " FinYearNoOfDays"
+ ", PropertyUnit"
+ " , FinYearEndDate"
+ " FROM [dbo].[Lease] A"
+ " join PropertyUnit pu on A.PropertyUnitID = pu.PropertyUnitID"
+ " join [Property]p"
+ " on pu.PropertyID = p.PropertyID"
+ " join [Tenant]T"
+ " on A.TenantID = T.TenantID"
+ " WHERE  P.PropertyID = " + PropertyID + "  Order by LesseeName Asc;", conn);

      DataTable dsExists = new DataTable();
      SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
      ExistsAdapter.SelectCommand = CmdSql;

      conn.Open();
      CmdSql.ExecuteNonQuery();
      ExistsAdapter.Fill(dsExists);
      conn.Close();

      return dsExists;
    }
    public DataTable GetPropertyApplication(string PropertyID)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand(""
+ " Select * From( "
+ " SELECT App.[ApplicationID] "
+ " ,App.[Title] "
+ " ,App.[Name] "
+ " ,App.[Surname] "
+ " ,App.[Designation] "
+ " ,App.[IDNumber] "
+ " ,App.[Gender] "
+ " ,App.[Telephone] "
+ " ,App.[Mobile] "
+ " ,App.[Fax] "
+ " ,App.[EmailAddress] "
+ " ,App.[ProfilePic] "
+ " ,App.[Address] "
+ " ,App.[AddressCode] "
+ " ,App.[PhysicalAddress] "
+ " ,App.[PhysicalAddressCode] "
+ " ,App.[DOB] "
+ " ,App.[Address]+', '+cast(App.[AddressCode] as varchar(10)) as FullAddress "
+ " ,App.[DateStarted] "
+ " ,App.[CompanyRegNumber] "
+ " ,App.[PropertyID] "
+ " ,App.[Name]+' '+App.[Surname] as ApplicantName "
+ " , p.PropertyName  "
+ " , (Select Top(1) Aps.ApplicationStatus From [dbo].[ApplicationStatusUpdate]su join [dbo].[ApplicationStatus]Aps on su.ApplicationStatusID = Aps.ApplicationStatusID Where (su.ApplicationID = App.ApplicationID)  order by su.StatusDate Desc) as ApplicationStatus "
+ " , (Select Top(1) su.StatusDate From [dbo].[ApplicationStatusUpdate]su join [dbo].[ApplicationStatus]Aps on su.ApplicationStatusID = Aps.ApplicationStatusID  Where (su.ApplicationID = App.ApplicationID)  order by su.StatusDate Desc) as ApplicationStatusDate "
+ " FROM [dbo].[Application]App "
+ " join [dbo].[Property]p on App.PropertyID = p.PropertyID  "
+ " Where (p.PropertyID = " + PropertyID + ")"
+ " ) as Result "
+ " Order by [Name] ;", conn);

      DataTable dsExists = new DataTable();
      SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
      ExistsAdapter.SelectCommand = CmdSql;

      conn.Open();
      CmdSql.ExecuteNonQuery();
      ExistsAdapter.Fill(dsExists);
      conn.Close();

      return dsExists;
    }
    public DataTable GetLeaseAdditionalCost(string LeaseID)
    {
      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
      SqlCommand CmdSql = new SqlCommand(" Exec SelectLeaseAdditionalCost '" + LeaseID + "'", conn);

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

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.tenant
{
    public class clLeaseRent
    {
        public DataTable GetLeaseRentByLeaseID(string LeaseID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT * FROM LeaseRent WHERE LeaseID = " + LeaseID + " AND FinYear = (CASE WHEN MONTH(GETDATE()) <= 3 THEN YEAR(GETDATE()) ELSE(YEAR(GETDATE()) + 1) END);", conn);
          
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
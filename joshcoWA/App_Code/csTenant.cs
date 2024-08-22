using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for csTenant
/// </summary>
/// 
namespace joshcoWA
{
    class csTenant
    {
        public csTenant()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataTable GetPropertyTenant(string PropertyID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joschoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand(" Exec SelectPropertyTenant '" + PropertyID + "'", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }
        public DataTable GetVacantPropertyUnit(string PropertyID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joschoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand(" Exec SelectVacantPropertyUnit '" + PropertyID + "'", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }
        public DataTable GetPropertyTenantRenewal(string PropertyID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joschoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand(" Exec SelectPropertyTenantRenewal '" + PropertyID + "'", conn);

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
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.tenant
{
    public class clTenantHome
    {

        public DataTable GetQueriesAndComplaintsTotals(string UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Exec PopulateQueriesAndComplaintsDashboard " + UserID + " ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }


        public DataTable GetStatementDetails(string LeaseID, int Month, int FinancialYear)
        {
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = Connection.GetConnection();
            SqlCommand selectCommand = new SqlCommand();
            selectCommand.Connection = sqlConnection;
            selectCommand.CommandType = CommandType.Text;
            selectCommand.CommandText = "Exec SelectTenantInvoiceList '" + LeaseID + "', '" + Month + "','" + FinancialYear + "'";
            DataTable dataTable = new DataTable();
            new SqlDataAdapter(selectCommand).Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
    }
}
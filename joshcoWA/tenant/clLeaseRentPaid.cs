using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.tenant
{
    public class clLeaseRentPaid
    {
        public void SaveLeaseRentPaidDetails(string LeaseRentID, DateTime DueDate, string AmountPaid, string PaymentSource, string ReferenceNo, string PayFastPaymentId)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand sqlCommand = new SqlCommand("Insert into [LeaseRentPaid]([LeaseRentID], [DueDate], [DatePaid],[AmountPaid], [PaymentSource], [ReferenceNo], [PayFastPaymentId])values(@LeaseRentID,@DueDate,GetDate(),@AmountPaid, @PaymentSource,@ReferenceNo, @PayFastPaymentId);", connection))
                {
                    SqlParameter sqlParameter1 = new SqlParameter("@LeaseRentID", SqlDbType.BigInt);
                    sqlParameter1.Value = (object)LeaseRentID;
                    SqlParameter sqlParameter2 = new SqlParameter("@DueDate", SqlDbType.DateTime);
                    sqlParameter2.Value = (object)DueDate;
                    SqlParameter sqlParameter3 = new SqlParameter("@AmountPaid", SqlDbType.VarChar, 20);
                    sqlParameter3.Value = (object)AmountPaid;
                    SqlParameter sqlParameter4 = new SqlParameter("@PaymentSource", SqlDbType.VarChar, 50);
                    sqlParameter4.Value = (object)PaymentSource;
                    SqlParameter sqlParameter5 = new SqlParameter("@ReferenceNo", SqlDbType.VarChar);
                    sqlParameter5.Value = (object)ReferenceNo;
                    SqlParameter sqlParameter6 = new SqlParameter("@PayFastPaymentId", SqlDbType.BigInt);
                    sqlParameter6.Value = (object)PayFastPaymentId;
                    sqlCommand.Parameters.AddRange(new SqlParameter[6] {sqlParameter1, sqlParameter2, sqlParameter3, sqlParameter4, sqlParameter5, sqlParameter6 });
                    sqlCommand.ExecuteNonQuery();
                }
            }
        }           


        public DataTable GetLeaseRentPaidListByLeaseID(string LeaseID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Select LRP.*, LR.FinYear from [dbo].[LeaseRentPaid] LRP JOIN LeaseRent LR ON LR.LeaseRentID = LRP.LeaseRentID where [LeaseID] = " + LeaseID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }


        public DataTable GetLeaseIdByTenantID(string TenantID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Select LeaseID From [dbo].[Lease] where [TenantID] = " + TenantID + "  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable GetLeaseIdByApplicationID(string ApplicationID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Select LeaseID From [dbo].[Lease] where [ApplicationID] = " + ApplicationID + "  ;", conn);

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
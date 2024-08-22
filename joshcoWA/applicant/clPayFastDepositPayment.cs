using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.applicant
{
    public class clPayFastDepositPayment
    {
        public DataTable GetApplicationDepositPayment(string ApplicationID)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.GetConnection(); // Assign Connection String to SqlConnection...

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select * from ApplicationDeposit where [ApplicationID] = " + ApplicationID + " ;";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        public DataTable GetApplicationProfile(string ApplicationID)
        {
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = Connection.GetConnection();
            SqlCommand selectCommand = new SqlCommand();
            selectCommand.Connection = sqlConnection;
            selectCommand.CommandType = CommandType.Text;
            selectCommand.CommandText = "Exec SelectApplicationProfile " + ApplicationID;
            DataTable dataTable = new DataTable();
            new SqlDataAdapter(selectCommand).Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }

        public void SavePayFastDepositDetails(string name, string contentType, int size, byte[] data, string ApplicationID, string DepositAmount, string DepositSource, string ReferenceNo, string PayFastPaymentId)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand sqlCommand = new SqlCommand("if(Select Count(*) From [ApplicationDeposit] Where ApplicationID = @ApplicationID)=0 Begin Insert into [ApplicationDeposit]([DocumentName], [ContentType], [Size], [Data], [ApplicationID], [DepositAmount], [DepositSource], [DatePaid], [ReferenceNo], [PayFastPaymentId])values(@DocumentName,@ContentType, @Size, @Data, @ApplicationID, @DepositAmount, @DepositSource, GetDate(), @ReferenceNo, @PayFastPaymentId); End", connection))
                {
                    SqlParameter sqlParameter1 = new SqlParameter("@DocumentName", SqlDbType.VarChar, 500);
                    sqlParameter1.Value = (object)name;
                    SqlParameter sqlParameter2 = new SqlParameter("@ContentType", SqlDbType.VarChar, 150);
                    sqlParameter2.Value = (object)contentType;
                    SqlParameter sqlParameter3 = new SqlParameter("@Size", SqlDbType.BigInt);
                    sqlParameter3.Value = (object)size;
                    SqlParameter sqlParameter4 = new SqlParameter("@Data", SqlDbType.VarBinary);
                    sqlParameter4.Value = (object)data;
                    SqlParameter sqlParameter5 = new SqlParameter("@ApplicationID", SqlDbType.Int, 20);
                    sqlParameter5.Value = (object)ApplicationID;
                    SqlParameter sqlParameter6 = new SqlParameter("@DepositAmount", SqlDbType.VarChar, 20);
                    sqlParameter6.Value = (object)DepositAmount;
                    SqlParameter sqlParameter7 = new SqlParameter("@DepositSource", SqlDbType.VarChar, 50);
                    sqlParameter7.Value = (object)DepositSource;
                    SqlParameter sqlParameter8 = new SqlParameter("@ReferenceNo", SqlDbType.VarChar);
                    sqlParameter8.Value = (object)ReferenceNo;
                    SqlParameter sqlParameter9 = new SqlParameter("@PayFastPaymentId", SqlDbType.BigInt);
                    sqlParameter9.Value = (object)PayFastPaymentId;

                    sqlCommand.Parameters.AddRange(new SqlParameter[9] { sqlParameter1, sqlParameter2, sqlParameter3, sqlParameter4, sqlParameter5, sqlParameter6, sqlParameter7, sqlParameter8, sqlParameter9 });
                    sqlCommand.ExecuteNonQuery();
                }
            }
        }

    }
}
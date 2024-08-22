using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class clStudentAccommodation
    {
        public DataTable LoadStudentAccomodation()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT * FROM Student_Accommodation", conn);

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


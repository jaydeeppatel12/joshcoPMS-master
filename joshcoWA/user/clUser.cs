using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace joshcoWA.user
{
    class clUser
    {
        public DataTable CheckEmailAddress(string EmailAddress)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT Top(1) A.UserEmailAddress From [dbo].[User]A Where A.UserEmailAddress = '" + EmailAddress + "'  ;", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public static string GenPass(int size)
        {
            char[] chars =
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            byte[] data = new byte[size];
            using (RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider())
            {
                crypto.GetBytes(data);
            }
            StringBuilder result = new StringBuilder(size);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            return result.ToString();
        }

        public void UpdateUserPassword(string ID, string name, string emailAddress)
        {
            string UserPassword = "";

            UserPassword = EncodePasswordToBase64(GenPass(7));

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("Update [dbo].[User] set UserPassword = '" + UserPassword + "' Where ID = '" + ID + "'  ;", conn);

            conn.Open();
            CmdSql.ExecuteNonQuery();
            conn.Close();

            clSendEmail sendmail = new clSendEmail();

            string mailbody = "";
            mailbody += "Your password was changed successfully, your login details below.</br></br>";
            mailbody += "Username: " + emailAddress + "</br>";
            mailbody += "Password: " + UserPassword + "</br></br>";
            mailbody += "Url: <a href='" + ConfigurationManager.AppSettings["LoginLink"] + "' >login</a> </br></br>";
            sendmail.SendMail(emailAddress, name, "JOSHCO: Password Recovery", mailbody, "");
        }


        public string EncodePasswordToBase64(string password)
        {
            try
            {
                byte[] encData_byte = new byte[password.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
                string encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        }

        public string DecodeFrom64(string encodedData)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encodedData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new String(decoded_char);
            return result;
        }


    }
}
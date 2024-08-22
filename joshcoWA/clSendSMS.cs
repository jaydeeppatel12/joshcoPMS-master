using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace joshcoWA
{
    class clSendSMS
    {
        public void SendSMS(string MobileNo, string SMSMessage)
        {
            string username = "quickprop";// "Phakha";
            string password = "Quickprop@1"; //"SaNdile67";   //CNSPass5416

            /*
            * Your phone number, including country code, i.e. +44123123123 in this case:
            */
            string msisdn = "+27" + MobileNo.Substring(MobileNo.Length - 9, 9);

            string url = "https://bulksms.2way.co.za/eapi/submission/send_sms/2/2.0";

            string seven_bit_msg = SMSMessage;

            Hashtable result;

            /*
            * Upon a transient (retryable) error, sleep this many seconds:
            */
            int sleep_time = 3;
            /*
            * The time it takes to retry transient errors will increase with
            * each retry attempt:
            */
            //int retry_growth_factor = 8;
            //int num_retries = 5;

            string data = seven_bit_message(username, password, msisdn, seven_bit_msg);

            //for (int x = 0; x < num_retries; x++)
            //{
            result = send_sms(data, url);


            //	System.Threading.Thread.Sleep(sleep_time);
            //	sleep_time *= retry_growth_factor;
            //}

            System.Threading.Thread.Sleep(20);
        }
        public static string formatted_server_response(Hashtable result)
        {
            string ret_string = "";
            if ((int)result["success"] == 1)
            {
                ret_string += "Success: batch ID " + (string)result["api_batch_id"] + "API message: " + (string)result["api_message"] + "\nFull details " + (string)result["details"];
            }
            else
            {
                ret_string += "Fatal error: HTTP status " + (string)result["http_status_code"] + " API status " + (string)result["api_status_code"] + " API message " + (string)result["api_message"] + "\nFull details " + (string)result["details"];
            }
            return ret_string;
        }

        public static Hashtable send_sms(string data, string url)
        {
            string sms_result = Post(url, data);

            Hashtable result_hash = new Hashtable();

            string tmp = "";
            tmp += "Response from server: " + sms_result + "\n";
            string[] parts = sms_result.Split('|');

            string statusCode = parts[0];
            string statusString = parts[1];

            result_hash.Add("api_status_code", statusCode);
            result_hash.Add("api_message", statusString);

            if (parts.Length != 3)
            {
                tmp += "Error: could not parse valid return data from server.\n";
            }
            else
            {
                if (statusCode.Equals("0"))
                {
                    result_hash.Add("success", 1);
                    result_hash.Add("api_batch_id", parts[2]);
                    tmp += "Message sent - batch ID " + parts[2] + "\n";
                }
                else if (statusCode.Equals("1"))
                {
                    // Success: scheduled for later sending.
                    result_hash.Add("success", 1);
                    result_hash.Add("api_batch_id", parts[2]);
                }
                else
                {
                    result_hash.Add("success", 0);
                    tmp += "Error sending: status code " + parts[0] + " description: " + parts[1] + "\n";
                }
            }
            result_hash.Add("details", tmp);
            return result_hash;
        }

        public static string Post(string url, string data)
        {
            string result = null;
            try
            {
                byte[] buffer = Encoding.Default.GetBytes(data);

                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(url);
                WebReq.Method = "POST";
                WebReq.ContentType = "application/x-www-form-urlencoded";
                WebReq.ContentLength = buffer.Length;
                Stream PostData = WebReq.GetRequestStream();

                PostData.Write(buffer, 0, buffer.Length);
                PostData.Close();
                HttpWebResponse WebResp = (HttpWebResponse)WebReq.GetResponse();
                Console.WriteLine(WebResp.StatusCode);

                Stream Response = WebResp.GetResponseStream();
                StreamReader _Response = new StreamReader(Response);
                result = _Response.ReadToEnd();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return result.Trim() + "\n";
        }

        public static string character_resolve(string body)
        {
            Hashtable chrs = new Hashtable();
            chrs.Add('Ω', "Û");
            chrs.Add('Θ', "Ô");
            chrs.Add('Δ', "Ð");
            chrs.Add('Φ', "Þ");
            chrs.Add('Γ', "¬");
            chrs.Add('Λ', "Â");
            chrs.Add('Π', "º");
            chrs.Add('Ψ', "Ý");
            chrs.Add('Σ', "Ê");
            chrs.Add('Ξ', "±");

            string ret_str = "";
            foreach (char c in body)
            {
                if (chrs.ContainsKey(c))
                {
                    ret_str += chrs[c];
                }
                else
                {
                    ret_str += c;
                }
            }
            return ret_str;
        }

        public static string seven_bit_message(string username, string password, string msisdn, string message)
        {
            /********************************************************************
            * Construct data                                                    *
            *********************************************************************/
            /*
            * Note the suggested encoding for the some parameters, notably
            * the username, password and especially the message.  ISO-8859-1
            * is essentially the character set that we use for message bodies,
            * with a few exceptions for e.g. Greek characters. For a full list,
            * see: http://developer.bulksms.com/eapi/submission/character-encoding/
            */

            string data = "";
            data += "username=" + HttpUtility.UrlEncode(username, System.Text.Encoding.GetEncoding("ISO-8859-1"));
            data += "&password=" + HttpUtility.UrlEncode(password, System.Text.Encoding.GetEncoding("ISO-8859-1"));
            data += "&message=" + HttpUtility.UrlEncode(character_resolve(message), System.Text.Encoding.GetEncoding("ISO-8859-1"));
            data += "&msisdn=" + msisdn;
            data += "&want_report=1";

            return data;
        }


        public void SendMessage(string MobileNo1, string SMSMessage)
        {
            // This URL is used for sending messages
            string myURI = "https://api.bulksms.com/v1/messages";

            // change these values to match your own account
            string myUsername = "quickprop";
            string myPassword = "Quickprop@1";   //CNSPass5416

            string MobileNo = "+27" + MobileNo1.Substring(MobileNo1.Length - 9, 9);

            // the details of the message we want to send
            string myData = "{to: \"" + MobileNo + "\", body:\"" + SMSMessage + "\"}";

            // build the request based on the supplied settings
            var request = WebRequest.Create(myURI);

            // supply the credentials
            request.Credentials = new NetworkCredential(myUsername, myPassword);
            request.PreAuthenticate = true;
            // we want to use HTTP POST
            request.Method = "POST";
            // for this API, the type must always be JSON
            request.ContentType = "application/json";

            // Here we use Unicode encoding, but ASCIIEncoding would also work
            var encoding = new UnicodeEncoding();
            var encodedData = encoding.GetBytes(myData);

            // Write the data to the request stream
            var stream = request.GetRequestStream();
            stream.Write(encodedData, 0, encodedData.Length);
            stream.Close();

            // try ... catch to handle errors nicely
            try
            {
                // make the call to the API
                var response = request.GetResponse();

                // read the response and print it to the console
                var reader = new StreamReader(response.GetResponseStream());
                Console.WriteLine(reader.ReadToEnd());
            }
            catch (WebException ex)
            {
                // show the general message
                Console.WriteLine("An error occurred:" + ex.Message);

                // print the detail that comes with the error
                var reader = new StreamReader(ex.Response.GetResponseStream());
                Console.WriteLine("Error details:" + reader.ReadToEnd());
            }
        }
    }
}

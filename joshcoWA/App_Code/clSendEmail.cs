using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    class clSendEmail
    {

        public void SendMail(string emailAddress, string name, string Mailsubject, string Mailbody, string Mailattachment, string notificationType = "Not Specified", string tenantId = "1")
        {
            MailMessage message;
            SmtpClient client;
            BuildEmail(emailAddress, name, Mailsubject, Mailbody, Mailattachment, out message, out client);

            try
            {

                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                //whatever server you're trying to connect to requires your client to identify itself..
                client.Send(message);
                clNotification clNotification = new clNotification();
                clNotification.InsertNotificationLog(notificationType, Mailsubject, tenantId, "1", "", message.Body, emailAddress);
            }
            catch (Exception ex)
            {
                //log if not send
                clNotification clNotification = new clNotification();
                clNotification.InsertNotificationLog(notificationType, Mailsubject, tenantId, "0", "", message.Body, emailAddress);

            }
        }

            private static void BuildEmail(string emailAddress, string name, string Mailsubject, string Mailbody, string Mailattachment, out MailMessage message, out SmtpClient client)
        {
            string toAddress = emailAddress;
            string fromAddress = "info@quickpropsys.com"; //"info@quickpropsys.com";            
            string subject = Mailsubject;


            //Attachment mhplogo = new Attachment(@"\\www.quickpropsys.com\\c$\\inetpub\\ITIS\\PIMS\\Images\\mhp.jpg");
            //string contentID = "mlogo";
            //mhplogo.ContentId = contentID;

            string body = "";
            body += "<table>";
            body += "<tr>";
            body += "<td style=\"padding: 10px; border: 35px solid #D9ECFF; width: 546px; height: 505px; font-family: Tahoma; font-size: 10pt;\">";
            body += "<table style=\"width: 546px; height: 505px; font-family: Tahoma; font-size: 10pt;\">";
            body += "<tr>";
            body += "<td valign=\"top\" style=\"height: 287px;\">";
            body += "<strong>Hi " + name + "</strong> <br /> ";
            body += " <br /> ";
            body += " <div style=\" text-align:center; width:100%;color: #3399FF;\"><strong>" + Mailsubject + "</strong></div> <br />";
            body += " " + Mailbody + " <br /> ";
            body += "</td>";
            body += "</tr>";
            body += "<tr>";
            body += "<td valign=\"top\" style=\"height: 110px;\">Thanks, <br /> Quick Prop Team <br /> ";
            body += " <br /> ";
            //body += "<img alt=\"\" src=\"cid:mlogo\" style=\"height: 42px; width: 99px\" /><br />";
            body += "<span style=\"font-size: xx-small;\">Tel: +27 (76) 532 9268";
            body += " <br /> ";
            body += " Fax: +27 (000) 000 0000";
            body += " <br /> ";
            body += " E-mail: <a href=\"mailto:info@quickpropsys.com\">info@quickpropsys.com</a>";
            body += " <br /> ";
            body += " Website: www.quickpropsys.com</span></td>";
            body += "</tr>";
            body += "</table>";
            body += "</td>";
            body += "</tr>";
            body += "</table>";


            message = new MailMessage(fromAddress, toAddress, subject, body);
            client = new SmtpClient("smtp.office365.com");
            //client.Host = "mail.quickpropsys.com"; //"Smtp.office365.com";   //"mail.quickpropsys.com";
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Port = 587;
            client.Credentials = new NetworkCredential(fromAddress, "Hun53326");


          

            if (Mailattachment != "")
            {
                Attachment attach = new Attachment(Mailattachment);
                message.Attachments.Add(attach);
            }
            message.IsBodyHtml = true;
        }
    }
}

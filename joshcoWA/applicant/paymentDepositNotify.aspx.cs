using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace joshcoWA.applicant
{
    public partial class paymentDepositNotify : System.Web.UI.Page
    {
        //PayFast will send a post back to your notify_url, before the user is redirected back to your return_url, 
        // when a payment is completed.If a payment is cancelled the user will be returned to your cancel_url.

        // It is important to note that no payment data ever gets posted to the return_url or cancel_url.    
        protected void Page_Load(object sender, EventArgs e)
        {
            // Can't have a postback on this page, it is called
            // once by the payment processor.
            if (IsPostBack) return;

            //Store the status of Successful transactions
            string ApplicationID = !string.IsNullOrEmpty(this.Page.Request.Form["custom_str1"]) ? this.Page.Request.Form["custom_str1"].ToString() : "0";
            string PaymentStatus = !string.IsNullOrEmpty(this.Page.Request.Form["payment_status"]) ? this.Page.Request.Form["payment_status"].ToString() : "UNKNOWN";
            string DepositAmount = !string.IsNullOrEmpty(this.Page.Request.Form["amount_gross"]) ? this.Page.Request.Form["amount_gross"].ToString() : "0";
            //Unique payment ID on the merchant System
            string ReferenceNo = !string.IsNullOrEmpty(this.Page.Request.Form["m_payment_id"]) ? this.Page.Request.Form["m_payment_id"].ToString() : "0";
            //Unique transation ID on Payfast
            string PayFastPaymentId = !string.IsNullOrEmpty(this.Page.Request.Form["pf_payment_id"]) ? this.Page.Request.Form["pf_payment_id"].ToString() : "0";
            string DepositSource = "Pay Fast";



            //Save successful transactions only
            if (PaymentStatus.ToUpper() == "COMPLETE".ToUpper())
            {
                string strFolderPath = Server.MapPath(@"~/TempFiles");
                bool folderExists = System.IO.Directory.Exists(strFolderPath);
                if (!folderExists)
                {//Create folder
                    System.IO.Directory.CreateDirectory(strFolderPath);
                }

                string fileName = ReferenceNo + ".pdf";
                string strFilePath = Path.Combine(strFolderPath, fileName);

                // step 1: creation of a document-object
                Document myDocument = new Document(PageSize.A4.Rotate());
                try
                {
                    // step 2:
                    // Now create a writer that listens to this doucment and writes the document to desired Stream.

                    PdfWriter.GetInstance(myDocument, new FileStream(strFilePath, FileMode.Create));
                    // step 3:  Open the document now using

                    myDocument.Open();
                    // step 4: Now add some contents to the document
                    myDocument.Add(new Paragraph("*********Payfast Deposit Payment*********"));
                    myDocument.Add(new Paragraph(""));
                    myDocument.Add(new Paragraph("Payment Status : " + PaymentStatus));
                    myDocument.Add(new Paragraph("Deposit Amount : " + DepositAmount));
                    myDocument.Add(new Paragraph("Payfast Reference ID : " + PaymentStatus));
                    myDocument.Add(new Paragraph("Payment Date : " + DepositAmount));

                }
                catch (DocumentException de)
                {
                    Console.Error.WriteLine(de.Message);
                }
                catch (IOException ioe)
                {
                    Console.Error.WriteLine(ioe.Message);
                }

                // step 5: Remember to close the documnet
                myDocument.Close();

                //Close the file
                FileInfo file = new FileInfo(strFilePath);
                int size = (Int32)file.Length;
                string name = file.Name;
                int position = name.LastIndexOf("\\");
                name = name.Substring(position + 1);
                string contentType = file.Extension;
                FileStream fs2 = file.OpenRead();
                BinaryReader br = new BinaryReader(fs2);
                byte[] data = br.ReadBytes(size);

                //From PayFast

                clPayFastDepositPayment clPayFastDepositPayment = new clPayFastDepositPayment();
                //Save document
                clPayFastDepositPayment.SavePayFastDepositDetails(name, contentType, size, data, ApplicationID, DepositAmount, DepositSource, ReferenceNo, PayFastPaymentId);

                if (file.Exists)
                {   //Dispose FileStream
                    //  fs.Dispose();
                    fs2.Dispose();
                    //Delete temp file    
                    file.Delete();
                }
            } 

        }
    }
}
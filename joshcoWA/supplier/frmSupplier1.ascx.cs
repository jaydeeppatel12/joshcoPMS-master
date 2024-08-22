using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Text;
using System.IO;
using System.Web.Services;
using System.Web.Script.Services;

namespace joshcoWA.supplier
{
    public partial class frmSupplier1 : System.Web.UI.UserControl
    {
        clSupplier supp = new clSupplier();       
        protected void Page_Load(object sender, EventArgs e)
        {    
            if (!IsPostBack)
            {
                long ticks = DateTime.Now.Ticks;
                byte[] bytes = BitConverter.GetBytes(ticks);
                string id = "SUPP" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

                this.lblReferenceNo.Text = id;

                //BindGridviewData();

            }
        }

        // Bind Gridview Data
        //private void BindGridviewData()
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
        //    {
        //       // connection.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            //"Select * from [ServiceProviderDocument] Where ServiceProviderDocumentID = @ServiceProviderDocumentID", 
        //            cmd.CommandText = "Select * from [ServiceProviderDocument]";
        //            cmd.Connection = con;
        //            con.Open();
        //            gvCompanyRegistrationDoc.DataSource = cmd.ExecuteReader();
        //            gvCompanyRegistrationDoc.DataBind();
        //            gvCompanyRegistrationDoc.Visible = true;
        //            con.Close();
        //        }
        //    }                
        //}

        protected void ddlCompanyType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public string SaveDetails(string ServiceProviderID)
        {
            string ID = "";
            supp.ReferenceNumber = this.lblReferenceNo.Text;
            supp.ServiceProviderID = Convert.ToInt32(ServiceProviderID);
            supp.CompanyTypeID = Convert.ToInt32(this.ddlCompanyType.SelectedValue);
            supp.CompanyRegistrationDoc_NA = chkCompanyRegistrationDoc_NA.Checked;
            supp.ProofOfShareHoldingDoc_NA = chkProofOfShareHoldingDoc_NA.Checked;
            supp.ProofOfBankingDetailDoc_NA = chkProofOfBankingDetailDoc_NA.Checked;
            supp.VatRegistrationNoDoc_NA = chkVatRegistrationNoDoc_NA.Checked;
            supp.PAYEDoc_NA = chkPAYEDoc_NA.Checked;
            supp.CompanyTypeOther = "";

            ID = supp.SaveSupplier1();

            //if (ServiceProviderID == "0" || ServiceProviderID == "")
            {
                //Save Company Type Document
                if (this.hfCompanyTypeDoc.Value != null && this.hfCompanyTypeDoc.Value.ToString() !="")
                {
                    SaveFile("10", this.LinkButton1.Text, ".pdf", this.hfCompanyTypeDoc, ServiceProviderID);
                }

                //Save Company Registration Document
                if (!chkCompanyRegistrationDoc_NA.Checked && this.hfCompanyRegistrationDoc.Value != null && this.hfCompanyRegistrationDoc.Value.ToString() != "")
                {
                    SaveFile("1010", this.LinkButton2.Text, ".pdf", this.hfCompanyRegistrationDoc, ServiceProviderID);
                }

                if (!chkProofOfShareHoldingDoc_NA.Checked && this.hfProofOfShareHoldingDoc.Value != null && this.hfProofOfShareHoldingDoc.Value.ToString() != "")
                {
                    SaveFile("1011", this.LinkButton3.Text, ".pdf", this.hfProofOfShareHoldingDoc, ServiceProviderID);
                }

                if (!chkProofOfBankingDetailDoc_NA.Checked && this.hfProofOfBankingDetailDoc.Value != null && this.hfProofOfBankingDetailDoc.Value.ToString() != "")
                {
                    SaveFile("1012", this.LinkButton4.Text, ".pdf", this.hfProofOfBankingDetailDoc, ServiceProviderID);
                }

                if (!chkVatRegistrationNoDoc_NA.Checked && this.hfVatRegistrationNoDoc.Value != null && this.hfVatRegistrationNoDoc.Value.ToString() != "")
                {
                    SaveFile("1013", this.LinkButton5.Text, ".pdf", this.hfVatRegistrationNoDoc, ServiceProviderID);
                }

                if (!chkPAYEDoc_NA.Checked && this.hfPAYEDoc.Value != null && this.hfPAYEDoc.Value.ToString() != "")
                {
                    SaveFile("1014", this.LinkButton6.Text, ".pdf", this.hfPAYEDoc, ServiceProviderID);
                }

            }


            return ID;
        }

        public void SaveFile(string CategoryID, string name, string contentType, HiddenField hf, String SupplierID)
        {
            //FileInfo file = new FileInfo(filePath);
            //int size = (Int32)file.Length;
            //string name = file.Name;
            //int position = name.LastIndexOf("\\");
            //name = name.Substring(position + 1);
            //string contentType = file.Extension;
            //FileStream fs = file.OpenRead();
            //BinaryReader br = new BinaryReader(fs);
            //byte[] fileData = br.ReadBytes(size);
            byte[] fileData = Convert.FromBase64String(hf.Value); ;

            //Save document
            supp.SaveSupplierDocument(CategoryID, name, contentType, fileData.Length, fileData, SupplierID);

            //if (file.Exists)
            //{   //Dispose FileStream
            //    fs.Dispose();
            //    //Delete temp file    
            //    file.Delete();
            //}
        }

        public void GetDetails(long ServiceProviderID)
        {
            DataTable dt = new DataTable();
            supp.ServiceProviderID = ServiceProviderID;
            dt = supp.GetSupplier(ServiceProviderID.ToString());

            if (dt.Rows.Count > 0)
            {
                this.lblReferenceNo.Text = dt.Rows[0]["ReferenceNumber"].ToString();
                this.lblRefNo.Visible = true;
                this.lblReferenceNo.Visible = true;


                if (dt.Rows[0]["CompanyTypeID"] == DBNull.Value)
                {
                   
                }
                else
                {
                    this.ddlCompanyType.SelectedValue =  dt.Rows[0]["CompanyTypeID"].ToString() ;
                }

                if (dt.Rows[0]["CompanyRegistrationDoc_NA"] == DBNull.Value)
                {
                    chkCompanyRegistrationDoc_NA.Checked = false;
                }
                else
                {
                    chkCompanyRegistrationDoc_NA.Checked = bool.Parse(dt.Rows[0]["CompanyRegistrationDoc_NA"].ToString());
                }

                if (dt.Rows[0]["ProofOfShareHoldingDoc_NA"] == DBNull.Value)
                {
                    chkProofOfShareHoldingDoc_NA.Checked = false;
                }
                else
                {
                    chkProofOfShareHoldingDoc_NA.Checked = bool.Parse(dt.Rows[0]["ProofOfShareHoldingDoc_NA"].ToString());

                }
                if (dt.Rows[0]["ProofOfBankingDetailDoc_NA"] == DBNull.Value)
                {
                    chkProofOfBankingDetailDoc_NA.Checked = false;
                }
                else
                {
                    chkProofOfBankingDetailDoc_NA.Checked = bool.Parse(dt.Rows[0]["ProofOfBankingDetailDoc_NA"].ToString());

                }
                if (dt.Rows[0]["VatRegistrationNoDoc_NA"] == DBNull.Value)
                {
                    chkVatRegistrationNoDoc_NA.Checked = false;
                }
                else
                {
                    chkVatRegistrationNoDoc_NA.Checked = bool.Parse(dt.Rows[0]["VatRegistrationNoDoc_NA"].ToString());

                }
                if (dt.Rows[0]["PAYEDoc_NA"] == DBNull.Value)
                {
                    chkPAYEDoc_NA.Checked = false;
                }
                else
                {
                    chkPAYEDoc_NA.Checked = bool.Parse(dt.Rows[0]["PAYEDoc_NA"].ToString());

                }

                //chkSMS.Checked = Convert.ToBoolean(dt.Rows[0]["SMSNotification"].ToString());
                //chkEmail.Checked = Convert.ToBoolean(dt.Rows[0]["EmailNotification"].ToString());
            }


            // Documents
                 DataTable dt1 = new DataTable();
            supp.ServiceProviderID = ServiceProviderID;
            dt1 = supp.GetSupplierDocuments(ServiceProviderID.ToString());

            if (dt.Rows.Count > 0)
            {
            
            }
        }

        protected void chkCompanyRegistrationDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCompanyRegistrationDoc_NA.Checked)
            {
                this.RequiredFieldValidator1.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator1.Enabled = true;
            }
        }

        protected void chkProofOfShareHoldingDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkProofOfShareHoldingDoc_NA.Checked)
            {
                this.RequiredFieldValidator2.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator2.Enabled = true;
            }         
        }

        protected void chkProofOfBankingDetailDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkProofOfBankingDetailDoc_NA.Checked)
            {
                this.RequiredFieldValidator3.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator3.Enabled = true;
            }
            
        }

        protected void chkVatRegistrationNoDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkVatRegistrationNoDoc_NA.Checked)
            {
                this.RequiredFieldValidator4.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator4.Enabled = true;
            }
            
        }

        protected void chkPAYEDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkPAYEDoc_NA.Checked)
            {
                this.RequiredFieldValidator5.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator5.Enabled = true;
            }
            
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select * from [ServiceProviderDocument] Where ServiceProviderDocumentID = @ServiceProviderDocumentID", connection))
                    {
                        command.Parameters.AddWithValue("@ServiceProviderDocumentID", e.CommandArgument.ToString());
                        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                        if (reader.HasRows)
                        {
                            reader.Read();
                            byte[] content = reader["Data"] as byte[];
                            string filename = reader["DocumentName"].ToString();
                            Response.Clear();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.AddHeader("Content-Length", content.Length.ToString());
                            Response.OutputStream.Write(content, 0, content.Length);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void gvDoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        public void DownloadFile(HiddenField hf, LinkButton lnk, string DocumentCategoryID)
        {
            if (hf.Value != null && hf.Value.ToString() != "")
            {
                byte[] content = Convert.FromBase64String(hf.Value);
                string filename = lnk.Text;
                Response.Clear();
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                Response.AddHeader("Content-Length", content.Length.ToString());
                Response.OutputStream.Write(content, 0, content.Length);
                Response.End();
            }
            else
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("Select Top(1) * from [ServiceProviderDocument] Where DocumentCategoryID = @DocumentCategoryID and ServiceProviderID = @ServiceProviderID", connection))
                    {
                        command.Parameters.AddWithValue("@DocumentCategoryID", DocumentCategoryID);
                        command.Parameters.AddWithValue("@ServiceProviderID", Session["ServiceProviderID"].ToString());

                        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                        if (reader.HasRows)
                        {
                            reader.Read();
                            byte[] content = reader["Data"] as byte[];
                            string filename = reader["DocumentName"].ToString();
                            Response.Clear();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.AddHeader("Content-Length", content.Length.ToString());
                            Response.OutputStream.Write(content, 0, content.Length);
                            Response.End();
                        }
                    }
                }
            }
        }

        [WebMethod()]
        [ScriptMethod()]
        public void FillTempFile(HiddenField hf, FileUpload fu, Button bu, LinkButton lnk)
        {
            if (hf.Value == "")
            {
                lnk.Text = fu.FileName;

                System.IO.Stream fs = fu.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                hf.Value = base64String;

                fu.Visible = false;
                bu.Text = "Remove file";
                bu.BackColor = System.Drawing.Color.Red;
            }
            else
            {
                fu.Visible = true;
                bu.Text = "+ Upload";
                lnk.Text = "";
                hf.Value = "";
                bu.BackColor = System.Drawing.Color.Orange;
            }
        }

        protected void btnPAYEUpload4_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfCompanyTypeDoc, this.fuCompanyTypeDoc, this.btnPAYEUpload4, this.LinkButton1);
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfCompanyTypeDoc, LinkButton1, "10");
        }

        protected void btnPAYEUpload3_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfCompanyRegistrationDoc, this.fuCompanyRegistrationDoc, this.btnPAYEUpload3, this.LinkButton2);
            this.RequiredFieldValidator1.Enabled = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfCompanyRegistrationDoc, LinkButton2, "1010");
        }

        protected void btnPAYEUpload2_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfProofOfShareHoldingDoc, this.fuProofOfShareHoldingDoc, this.btnPAYEUpload2, this.LinkButton3);
            this.RequiredFieldValidator2.Enabled = false;
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfProofOfShareHoldingDoc, LinkButton3, "1011");
        }

        protected void btnPAYEUpload1_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfProofOfBankingDetailDoc, this.fuProofOfBankingDetailDoc, this.btnPAYEUpload1, this.LinkButton4);
            this.RequiredFieldValidator3.Enabled = false;
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfProofOfBankingDetailDoc, LinkButton4, "1012");
        }

        protected void btnPAYEUpload0_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfVatRegistrationNoDoc, this.fuVatRegistrationNoDoc, this.btnPAYEUpload0, this.LinkButton5);
            this.RequiredFieldValidator4.Enabled = false;
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfVatRegistrationNoDoc, LinkButton5, "1013");
        }

        protected void btnPAYEUpload_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfPAYEDoc, this.fuPAYEDoc, this.btnPAYEUpload, this.LinkButton6);
            this.RequiredFieldValidator5.Enabled = false;
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfPAYEDoc, LinkButton6, "1014");
        }    
    }
}
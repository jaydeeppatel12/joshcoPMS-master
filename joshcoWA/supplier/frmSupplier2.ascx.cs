using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class frmSupplier2 : System.Web.UI.UserControl
    {
        clSupplier supp = new clSupplier();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SaveDetails(string ServiceProviderID)
        {
            string ID = ""; 
            supp.ServiceProviderID = Convert.ToInt32(ServiceProviderID); 
            supp.UnemployementInsuranceFundNumber = txtUnemployementInsuranceFundNumber.Text;
            supp.UnemployementInsuranceFundDoc_NA = chkUnemployementInsuranceFundDoc_NA.Checked;
            supp.WorkmanCompensationFundNumber = txtWorkmanCompensationFundNumber.Text;
            supp.WorkmanCompensationFundDoc_NA = chkWorkmanCompensationFundDoc_NA.Checked;
            supp.ProfessionalRegistrationNumber = txtProfessionalRegistrationNumber.Text;
            supp.ProfessionalRegistrationDoc_NA = chkProfessionalRegistrationDoc_NA.Checked;
            supp.DisabilityDoc_NA = chkDisabilityDoc_NA.Checked;
            supp.IncomeTaxRegistrationNumber = txtIncomeTaxRegistrationNumber.Text;
            supp.IncomeTaxRegistrationDoc_NA = chkIncomeTaxRegistrationDoc_NA.Checked;
            supp.BEECertificateDoc_NA = chkBEECertificateDoc_NA.Checked;
            supp.BEELevelID = Convert.ToInt32(this.ddlBeeLevel.SelectedValue);

            ID = supp.SaveSupplier2();

            ////frmSupplier2
            if (!chkUnemployementInsuranceFundDoc_NA.Checked && this.hfUnemployementInsuranceFundDoc != null && this.hfUnemployementInsuranceFundDoc.Value.ToString() != "")
            {
                SaveFile("1015", this.LinkButton1.Text, ".pdf", this.hfUnemployementInsuranceFundDoc, ServiceProviderID);
            }

            if (!chkWorkmanCompensationFundDoc_NA.Checked && this.hfWorkmanCompensationFundDoc != null && this.hfWorkmanCompensationFundDoc.Value.ToString() !="")
            {
                SaveFile("1016", this.LinkButton2.Text, ".pdf", this.hfWorkmanCompensationFundDoc, ServiceProviderID);
            }

            if (!chkProfessionalRegistrationDoc_NA.Checked && this.hfProfessionalRegistrationDoc != null && this.hfProfessionalRegistrationDoc.Value.ToString() !="")
            {
                SaveFile("1017", this.LinkButton3.Text, ".pdf", this.hfProfessionalRegistrationDoc, ServiceProviderID);
            }

            if (!chkDisabilityDoc_NA.Checked && this.hfDisabilityDoc != null && this.hfDisabilityDoc.Value.ToString() !="")
            {
                SaveFile("1018", this.LinkButton4.Text, ".pdf", this.hfDisabilityDoc, ServiceProviderID);
            }

            if (!chkIncomeTaxRegistrationDoc_NA.Checked && this.hfIncomeTaxRegistrationDoc != null && this.hfIncomeTaxRegistrationDoc.Value.ToString() !="")
            {
                SaveFile("1019", this.LinkButton5.Text, ".pdf", this.hfIncomeTaxRegistrationDoc, ServiceProviderID);
            }

            if (!chkTaxClearanceCertificate_NA.Checked && this.hfTaxClearanceCertificateDoc != null && this.hfTaxClearanceCertificateDoc.Value.ToString() !="")
            {
                SaveFile("1020", this.LinkButton6.Text, ".pdf", this.hfTaxClearanceCertificateDoc, ServiceProviderID);
            }


            if (!chkBEECertificateDoc_NA.Checked && this.hfBEECertificateDoc != null && this.hfBEECertificateDoc.Value.ToString() != "")
            {
                SaveFile("1021", this.LinkButton7.Text, ".pdf", this.hfBEECertificateDoc, ServiceProviderID);
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
                     txtUnemployementInsuranceFundNumber.Text = dt.Rows[0]["UnemployementInsuranceFundNumber"].ToString();
                    if (dt.Rows[0]["UnemployementInsuranceFundDoc_NA"] == DBNull.Value ) {
                        chkUnemployementInsuranceFundDoc_NA.Checked = false;
                    } else {
                        chkUnemployementInsuranceFundDoc_NA.Checked = bool.Parse(dt.Rows[0]["UnemployementInsuranceFundDoc_NA"].ToString());

                    }
                    txtWorkmanCompensationFundNumber.Text = dt.Rows[0]["WorkmanCompensationFundNumber"].ToString();
                    if (dt.Rows[0]["WorkmanCompensationFundDoc_NA"] == DBNull.Value ) {
                        chkWorkmanCompensationFundDoc_NA.Checked = false;
                    } else {
                        chkWorkmanCompensationFundDoc_NA.Checked = bool.Parse(dt.Rows[0]["WorkmanCompensationFundDoc_NA"].ToString());

                    }
                    txtProfessionalRegistrationNumber.Text = dt.Rows[0]["ProfessionalRegistrationNumber"].ToString();
                    if (dt.Rows[0]["ProfessionalRegistrationDoc_NA"] == DBNull.Value ) {
                        chkProfessionalRegistrationDoc_NA.Checked = false;
                    } else {
                        chkProfessionalRegistrationDoc_NA.Checked = bool.Parse(dt.Rows[0]["ProfessionalRegistrationDoc_NA"].ToString());

                    }
                    if (dt.Rows[0]["DisabilityDoc_NA"] == DBNull.Value ) {
                        chkDisabilityDoc_NA.Checked = false;
                    } else {
                        chkDisabilityDoc_NA.Checked = bool.Parse(dt.Rows[0]["DisabilityDoc_NA"].ToString());

                    }
                    txtIncomeTaxRegistrationNumber.Text = dt.Rows[0]["IncomeTaxRegistrationNumber"].ToString();
                    if (dt.Rows[0]["IncomeTaxRegistrationDoc_NA"] == DBNull.Value ) {
                        chkIncomeTaxRegistrationDoc_NA.Checked = false;
                    } else {
                        chkIncomeTaxRegistrationDoc_NA.Checked = bool.Parse(dt.Rows[0]["IncomeTaxRegistrationDoc_NA"].ToString());

                    }
                    if (dt.Rows[0]["BEECertificateDoc_NA"] == DBNull.Value ) {
                        chkBEECertificateDoc_NA.Checked = false;
                    } else {
                        chkBEECertificateDoc_NA.Checked = bool.Parse(dt.Rows[0]["BEECertificateDoc_NA"].ToString());

                    }
              
                    this.ddlBeeLevel.SelectedValue = dt.Rows[0]["BEELevelID"].ToString();
   
            }
        }

        protected void chkUnemployementInsuranceFundDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkUnemployementInsuranceFundDoc_NA.Checked)
            {
                this.RequiredFieldValidator3.Enabled = false;
                this.RequiredFieldValidator4.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator3.Enabled = true;
                this.RequiredFieldValidator4.Enabled = true;
            }
        }

        protected void chkWorkmanCompensationFundDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkWorkmanCompensationFundDoc_NA.Checked)
            {
                this.RequiredFieldValidator5.Enabled = false;
                this.RequiredFieldValidator6.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator5.Enabled = true;
                this.RequiredFieldValidator6.Enabled = true;
            }
        }

        protected void chkProfessionalRegistrationDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkProfessionalRegistrationDoc_NA.Checked)
            {
                this.RequiredFieldValidator7.Enabled = false;
                this.RequiredFieldValidator8.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator7.Enabled = true;
                this.RequiredFieldValidator8.Enabled = true;
            }
        }

        protected void chkDisabilityDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDisabilityDoc_NA.Checked)
            {
                this.RequiredFieldValidator9.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator9.Enabled = true;
            }
            
        }

        protected void chkIncomeTaxRegistrationDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkIncomeTaxRegistrationDoc_NA.Checked)
            {
                this.RequiredFieldValidator10.Enabled = false;
                this.RequiredFieldValidator11.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator10.Enabled = true;
                this.RequiredFieldValidator11.Enabled = true;
            }
            
        }

        protected void chkTaxClearanceCertificate_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkTaxClearanceCertificate_NA.Checked)
            {
                this.RequiredFieldValidator12.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator12.Enabled = true;
            }
            
        }

        protected void chkBEECertificateDoc_NA_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBEECertificateDoc_NA.Checked)
            {
                this.RequiredFieldValidator13.Enabled = false;
            }
            else
            {
                this.RequiredFieldValidator13.Enabled = true;
            }
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

        protected void btnPAYEUpload_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfUnemployementInsuranceFundDoc, this.fuUnemployementInsuranceFundDoc, this.btnPAYEUpload, this.LinkButton1);
            this.RequiredFieldValidator4.Enabled = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfUnemployementInsuranceFundDoc, LinkButton1, "1015");
        }

        protected void btnPAYEUpload0_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfWorkmanCompensationFundDoc, this.fuWorkmanCompensationFundDoc, this.btnPAYEUpload0, this.LinkButton2);
            this.RequiredFieldValidator6.Enabled = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfWorkmanCompensationFundDoc, LinkButton2, "1016");
        }

        protected void btnPAYEUpload1_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfProfessionalRegistrationDoc, this.fuProfessionalRegistrationDoc, this.btnPAYEUpload1, this.LinkButton3);
            this.RequiredFieldValidator8.Enabled = false;
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfProfessionalRegistrationDoc, LinkButton3, "1017");
        }

        protected void btnPAYEUpload2_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfDisabilityDoc, this.fuDisabilityDoc, this.btnPAYEUpload2, this.LinkButton4);
            this.RequiredFieldValidator9.Enabled = false;
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfDisabilityDoc, LinkButton4, "1018");
        }

        protected void btnPAYEUpload3_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfIncomeTaxRegistrationDoc, this.fuIncomeTaxRegistrationDoc, this.btnPAYEUpload3, this.LinkButton5);
            this.RequiredFieldValidator11.Enabled = false;
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfIncomeTaxRegistrationDoc, LinkButton5, "1019");
        }

        protected void btnPAYEUpload4_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfTaxClearanceCertificateDoc, this.fuTaxClearanceCertificateDoc, this.btnPAYEUpload4, this.LinkButton6);
            this.RequiredFieldValidator12.Enabled = false;
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfTaxClearanceCertificateDoc, LinkButton6, "1020");
        }

        protected void btnPAYEUpload5_Click(object sender, EventArgs e)
        {
            FillTempFile(this.hfBEECertificateDoc, this.fuBEECertificateDoc, this.btnPAYEUpload5, this.LinkButton7);
            this.RequiredFieldValidator13.Enabled = false;
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            DownloadFile(this.hfBEECertificateDoc, LinkButton7, "1021");
        } 
    }
}
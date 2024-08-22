using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class supplierAdd : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //if (Request.QueryString["a"] != null)
            //{
            //    Session["ServiceProviderID"] = null;
            //}

            //if (Session["ServiceProviderID"] != null)
            //{
            //    if (Session["ServiceProviderID"].ToString() != "0")
            //    {
            //        this.MasterPageFile = "supplier.master";
            //    }
            //}

            if (Session["UserGroupID"] != null)
            {
                if (Session["UserGroupID"].ToString() == "2")
                {
                        this.MasterPageFile = "../application/admin.master";
                }
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["n"] != null)
                {
                    if (Request.QueryString["n"] == "n")
                    {
                        showMessageBox("Your supplier details was captured successfully");
                        return;
                    }
                }

                if (Session["ServiceProviderID"] != null)
                {
                    this.btnBegin.Text = "View Application Form";
                    FillForm();
                }
            }
        }
        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        public void FillForm()
        {
            if (Session["ServiceProviderID"] != null)
            {
                int ServiceProviderID = Convert.ToInt32(Session["ServiceProviderID"]);

                this.frmSupplier1.GetDetails(ServiceProviderID);
                this.frmSupplier2.GetDetails(ServiceProviderID);
                this.frmSupplier3.GetDetails(ServiceProviderID);
                this.frmSupplier4.GetDetails(ServiceProviderID);
                this.frmSupplier5.GetDetails(ServiceProviderID);
                this.frmSupplier6.GetDetails(ServiceProviderID);

                ((TextBox)this.frmSupplier6.FindControl("txtCaptcha")).Visible = false;
                ((ImageButton)this.frmSupplier6.FindControl("Refresh")).Visible = false;
                ((MSCaptcha.CaptchaControl)this.frmSupplier6.FindControl("Captcha1")).Visible = false;
            }
        }

        private string SavePostedFile(HttpPostedFile postedFile)
        {
            string strNewFileName;
            string strFilePath;
            string strFolderPath;

            strFolderPath = Server.MapPath(@"~/TempFiles");
            bool folderExists = System.IO.Directory.Exists(strFolderPath);
            if (!folderExists)
            {//Create folder
                System.IO.Directory.CreateDirectory(strFolderPath);
            }

            string fileExtension = Path.GetExtension(postedFile.FileName);
            //Re-name file
            strNewFileName = Guid.NewGuid() + fileExtension;
            strFilePath = Path.Combine(strFolderPath, strNewFileName);
            postedFile.SaveAs(strFilePath);
            //Temp document path
            return strFilePath;
        }


        protected void btnBegin_Click(object sender, EventArgs e)
        {   if (this.hfIndex.Value == "1" && (((DropDownList)this.frmSupplier1.FindControl("ddlCompanyType")).SelectedValue == "0"))
            {
                showMessageBox("Please select company type to continue");
                return;
            }
            if (this.hfIndex.Value == "2" && (((DropDownList)this.frmSupplier2.FindControl("ddlBeeLevel")).SelectedValue == "0"))
            {
                showMessageBox("Please select B-BEE Level to continue");
                return;
            }

            ////frmSupplier1
            //if (((FileUpload)frmSupplier1.FindControl("fuCompanyTypeDoc")) != null && ((FileUpload)frmSupplier1.FindControl("fuCompanyTypeDoc")).HasFile)
            //{   //Persit doument path path
            //    Session["sCompanyTypeDocPath"] = SavePostedFile(((FileUpload)frmSupplier1.FindControl("fuCompanyTypeDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier1.FindControl("fuCompanyRegistrationDoc")) != null && ((FileUpload)frmSupplier1.FindControl("fuCompanyRegistrationDoc")).HasFile)
            //{
            //    Session["sCompanyRegistrationDocPath"] = SavePostedFile(((FileUpload)frmSupplier1.FindControl("fuCompanyRegistrationDoc")).PostedFile);
            //}   
         
            ////start
            //if (((FileUpload)frmSupplier1.FindControl("fuProofOfShareHoldingDoc")) != null && ((FileUpload)frmSupplier1.FindControl("fuProofOfShareHoldingDoc")).HasFile)
            //{
            //    Session["sProofOfShareHoldingDocPath"] = SavePostedFile(((FileUpload)frmSupplier1.FindControl("fuProofOfShareHoldingDoc")).PostedFile);                
            //}

            //if (((FileUpload)frmSupplier1.FindControl("fuProofOfBankingDetailDoc")) != null && ((FileUpload)frmSupplier1.FindControl("fuProofOfBankingDetailDoc")).HasFile)
            //{
            //    Session["sProofOfBankingDetailDocPath"] = SavePostedFile(((FileUpload)frmSupplier1.FindControl("fuProofOfBankingDetailDoc")).PostedFile);               
            //}

            //if (((FileUpload)frmSupplier1.FindControl("fuVatRegistrationNoDoc")) != null && ((FileUpload)frmSupplier1.FindControl("fuVatRegistrationNoDoc")).HasFile)
            //{
            //    Session["sVatRegistrationNoDocPath"] = SavePostedFile(((FileUpload)frmSupplier1.FindControl("fuVatRegistrationNoDoc")).PostedFile);                
            //}

            //if (((FileUpload)frmSupplier1.FindControl("fuPAYEDoc")) != null && ((FileUpload)frmSupplier1.FindControl("fuPAYEDoc")).HasFile)
            //{
            //    Session["sPAYEDocPath"] = SavePostedFile(((FileUpload)frmSupplier1.FindControl("fuPAYEDoc")).PostedFile);               
            //}

            ////frmSupplier2
            //if (((FileUpload)frmSupplier2.FindControl("fuUnemployementInsuranceFundDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuUnemployementInsuranceFundDoc")).HasFile)
            //{
            //    Session["sUnemployementInsuranceFundDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuUnemployementInsuranceFundDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier2.FindControl("fuWorkmanCompensationFundDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuWorkmanCompensationFundDoc")).HasFile)
            //{
            //    Session["sWorkmanCompensationFundDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuWorkmanCompensationFundDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier2.FindControl("fuProfessionalRegistrationDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuProfessionalRegistrationDoc")).HasFile)
            //{
            //    Session["sProfessionalRegistrationDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuProfessionalRegistrationDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier2.FindControl("fuDisabilityDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuDisabilityDoc")).HasFile)
            //{
            //    Session["sDisabilityDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuDisabilityDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier2.FindControl("fuIncomeTaxRegistrationDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuIncomeTaxRegistrationDoc")).HasFile)
            //{
            //    Session["sIncomeTaxRegistrationDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuIncomeTaxRegistrationDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier2.FindControl("fuTaxClearanceCertificateDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuTaxClearanceCertificateDoc")).HasFile)
            //{
            //    Session["sTaxClearanceCertificateDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuTaxClearanceCertificateDoc")).PostedFile);
            //}

            //if (((FileUpload)frmSupplier2.FindControl("fuBEECertificateDoc")) != null && ((FileUpload)frmSupplier2.FindControl("fuBEECertificateDoc")).HasFile)
            //{
            //    Session["sBEECertificateDocPath"] = SavePostedFile(((FileUpload)frmSupplier2.FindControl("fuBEECertificateDoc")).PostedFile);
            //}


            if (this.btnBegin.Text == "Submit Application")
            {
                if (((CheckBox)this.frmSupplier6.FindControl("chkDeclaration1")).Checked == false)
                {
                    showMessageBox("***Please tick declarations to continue");
                    return;
                }


                try
                {
                    ((MSCaptcha.CaptchaControl)this.frmSupplier6.FindControl("Captcha1")).ValidateCaptcha(((TextBox)this.frmSupplier6.FindControl("txtCaptcha")).Text.Trim());
                }
                catch
                {
                    showMessageBox("Please refresh Captcha");
                    return;
                }

                if (((MSCaptcha.CaptchaControl)this.frmSupplier6.FindControl("Captcha1")).UserValidated)
                {


                }
                else
                {
                    showMessageBox("Sorry InValid Captcha");
                    return;
                }

                string ServiceProviderID = "0";

                ServiceProviderID = this.frmSupplier5.SaveDetails(ServiceProviderID);
                Session["ServiceProviderID"] = ServiceProviderID;
                this.frmSupplier1.SaveDetails(ServiceProviderID);
                this.frmSupplier2.SaveDetails(ServiceProviderID);
                this.frmSupplier3.SaveDetails(ServiceProviderID);
                this.frmSupplier4.SaveDetails(ServiceProviderID);
                this.frmSupplier6.SaveDetails(ServiceProviderID);

                if (Session["UserGroupID"] != null)
                {
                    if (Session["UserGroupID"].ToString() == "2")
                    {
                        Response.Redirect("supplierView.aspx");
                    }
                }
                else
                {
                    Session["ServiceProviderID"] = null;
                    Response.Redirect("supplierAdd.aspx?n=n");
                }

                return;
            }


            UserControl[] formPages = { frmSupplier0, frmSupplier1, frmSupplier2, frmSupplier3, frmSupplier4, frmSupplier5, frmSupplier6 };
            this.hfIndex.Value = Convert.ToString(Convert.ToInt32(this.hfIndex.Value) + 1);


            if (this.hfIndex.Value != formPages.Length.ToString())
            {
                this.lblIndex.Text = "Showing (" + this.hfIndex.Value + "/6)";
                this.btnBegin.Text = "Next >>";
                this.btnBack.Visible = true;
                this.frmSupplier1.Visible = true;
                this.frmSupplier0.Visible = false;


                for (int i = 1; i <= formPages.Length - 1; i++)
                {
                    if (this.hfIndex.Value == i.ToString())
                    {
                        formPages[i].Visible = true;
                        this.btnBegin.ValidationGroup = formPages[i].ID;
                    }
                    else
                    {
                        formPages[i].Visible = false;
                    }
                }

                if (this.hfIndex.Value == "6")
                {
                    if (Session["ServiceProviderID"] != null)
                    {
                        this.btnBegin.Visible = false;
                    }
                    else
                    {   
                        this.btnBegin.Text = "Submit Application";
                    }
                }
            }
            else { this.btnBegin.Text = "Submit Application"; }

        }

       
        protected void btnBback_Click(object sender, EventArgs e)
        {
            UserControl[] formPages = { frmSupplier0, frmSupplier1, frmSupplier2, frmSupplier3, frmSupplier4, frmSupplier5, frmSupplier6 };
            this.hfIndex.Value = Convert.ToString(Convert.ToInt32(this.hfIndex.Value) - 1);

            if (this.hfIndex.Value != "0")
            {

                this.lblIndex.Text = "Showing (" + this.hfIndex.Value + "/6)";
                this.btnBegin.Text = "Next >>";
                this.btnBegin.Visible = true;

                for (int i = 1; i <= formPages.Length - 1; i++)
                {
                    if (this.hfIndex.Value == i.ToString())
                    {
                        formPages[i].Visible = true;
                        this.btnBegin.ValidationGroup = formPages[i].ID;
                    }
                    else
                    {
                        formPages[i].Visible = false;
                    }
                }
            }
            else
            {
                if (Session["ServiceProviderID"] != null)
                {
                    this.btnBegin.Text = "View Application";
                    this.btnBack.Visible = false;
                    this.frmSupplier1.Visible = false;
                    this.frmSupplier0.Visible = true;
                    this.lblIndex.Text = "";
                }
                else
                {
                    this.btnBegin.Text = "Start Application";
                    this.btnBack.Visible = false;
                    this.frmSupplier1.Visible = false;
                    this.frmSupplier0.Visible = true;
                    this.lblIndex.Text = "";
                }
            }
        }
    }
}
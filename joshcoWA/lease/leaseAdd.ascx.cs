using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Configuration;
using System.Xml;
using System.Data;

namespace joshcoWA.lease
{
    public partial class leaseAdd : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.ddlPropertyUnit.SelectedValue == "" || this.ddlPropertyUnit.SelectedValue == "0")
            {
                showMessageBox("Please select a property unit");
                return;
            }
          

            this.sdsApplication.InsertParameters["ApplicationID"].DefaultValue = hfApplicationID.Value;
            this.sdsApplication.InsertParameters["Frequency"].DefaultValue = this.ddlFrequency.SelectedValue;
            this.sdsApplication.InsertParameters["PropertyUnitID"].DefaultValue = this.ddlPropertyUnit.SelectedValue;
            this.sdsApplication.InsertParameters["InitialValue"].DefaultValue = this.txtInitialValue.Text;
            //this.sdsApplication.InsertParameters["Vatable"].DefaultValue = this.txtPhysicalAddress.Text;
            this.sdsApplication.InsertParameters["Escalation"].DefaultValue = this.txtEscalation.Text;
            this.sdsApplication.InsertParameters["Commencement"].DefaultValue = this.txtStartDate.SelectedDate.ToString();
            this.sdsApplication.InsertParameters["Termination"].DefaultValue = this.txtEndDate.SelectedDate.ToString();
            //this.sdsApplication.InsertParameters["Interest"].DefaultValue = this.txtRegNumber.Text;
            this.sdsApplication.InsertParameters["InterestPercentage"].DefaultValue = this.txtInterest.Text;
            this.sdsApplication.InsertParameters["TypeOfLease"].DefaultValue = "2";
            this.sdsApplication.InsertParameters["Comment"].DefaultValue = this.txtComment.Text;
            this.sdsApplication.InsertParameters["RatePerSQM"].DefaultValue = "0";
            this.sdsApplication.InsertParameters["Area"].DefaultValue = this.txtArea.Text;
            this.sdsApplication.Insert();

            showMessageBox("lease created");
          
                SendAgreementLetter(this.hfEmail.Value, this.hfIDNumber.Value, this.hfName.Value);
            }
            catch (Exception ex) { showMessageBox(ex.Message); }


            //Response.Redirect("../application/appProfile.aspx");
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        public void SendAgreementLetter(string emailAddress, string IDnumber, string name)
        {
            clSendEmail sendmail = new clSendEmail();
            
            ExportToPDF("Yes");

            string mailbody = "";
            mailbody += "Your lease application was approved.</br></br>";
            //mailbody += "Status: " + Status + "</br>";
            //mailbody += "Comment: " + comment + "</br></br>";
            mailbody += "Please download and sign the lease agreement and upload it in your online profile </br></br>";
            mailbody += "To view your application online use the following link below </br></br>";
            mailbody += "Url: <a href='" + ConfigurationManager.AppSettings["AppStatusLink"] + "' >Application</a>  </br></br>";

            //Nkanyiso
          sendmail.SendMail(emailAddress, name, "Joshco: Lease Application Approved", mailbody, Server.MapPath("~/Agreement/") + Session["Ref"].ToString() + ".pdf");
        }

        protected void ExportToPDF(String SaveFile)
        {
            try
            {

                System.Data.DataView dv1 = null;
                dv1 = (System.Data.DataView)this.sdsLeaseProfile.Select(DataSourceSelectArguments.Empty);
                System.Data.DataTable dt1 = new System.Data.DataTable();
                dt1 = dv1.ToTable("Projects1");

                ReportDataSource rds1 = new ReportDataSource("DataSet1", dt1);

                Warning[] warnings;
                string[] streamIds;
                string mimeType = string.Empty;
                string encoding = string.Empty;
                string extension = string.Empty;

                ReportViewer viewer = new ReportViewer();
                viewer.ProcessingMode = ProcessingMode.Local;
                viewer.LocalReport.ReportPath = "report/LeaseAgreement.rdlc";
                viewer.LocalReport.DataSources.Add(rds1);
                FillReport(viewer);

                if (SaveFile == "No")
                {
                    byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                    string filename = "LeaseAgreement";
                    Response.Clear();
                    Response.ClearContent();
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                    Response.AddHeader("Content-Length", bytes.Length.ToString());
                    Response.OutputStream.Write(bytes, 0, bytes.Length);
                    Response.End();
                }
                else if (SaveFile == "Yes")
                {
                    Session["Ref"] = "LeaseAgreement_" + DateTime.Now.ToString("yyyyMMddHHmmss");
                    byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                    FileStream file = new FileStream(Server.MapPath("~/Agreement/") + Session["Ref"].ToString() + ".pdf", FileMode.Create, System.IO.FileAccess.Write);
                    file.Write(bytes, 0, bytes.Length);
                    file.Close();
                }
            }
            catch (Exception ex) {
                showMessageBox(ex.Message);
            }
            //Get leaseID
            //clLease l = new clLease();
            // DataTable dtLeaseId = l.GetLeaseIDByApplicationID(hfApplicationID.Value.ToString());

            //  String LeaseID = null;
            // if (dtLeaseId.Rows.Count > 0)
            // {
            //  LeaseID = dtLeaseId.Rows[0]["LeaseID"].ToString();
            //}

            //GetLeaseProfile
            //DataTable dtLeaseProfile = l.GetLeaseProfile(LeaseID);
            //if (dtLeaseProfile.Rows.Count > 0)
            //{
            //    string strLesseeName = (dtLeaseProfile.Rows[0]["LesseeName"].ToString() != "" ? dtLeaseProfile.Rows[0]["LesseeName"].ToString() : "");
            //    string strId = (dtLeaseProfile.Rows[0]["IDNumber"].ToString() != "" ? dtLeaseProfile.Rows[0]["IDNumber"].ToString() : "");
            //    string strUnitDescription = (dtLeaseProfile.Rows[0]["PropertyUnit"].ToString() + ", " + dtLeaseProfile.Rows[0]["PropertyName"].ToString() != "" ? dtLeaseProfile.Rows[0]["PropertyUnit"].ToString() + ", " + dtLeaseProfile.Rows[0]["PropertyName"].ToString() : "");
            //    string strMaritalStstus = (dtLeaseProfile.Rows[0]["MaritalStatus"].ToString() == 1.ToString() ? "Single" : "Married");
            //    string strUnitArea = (dtLeaseProfile.Rows[0]["UnitArea"].ToString() != "" ? dtLeaseProfile.Rows[0]["UnitArea"].ToString() : "");
            //    string strMonthlyRental = (dtLeaseProfile.Rows[0]["EstRatePerSQM"].ToString() != "" ? dtLeaseProfile.Rows[0]["EstRatePerSQM"].ToString() : "");
            //    string strEscalation = (dtLeaseProfile.Rows[0]["Escalation"].ToString() != "" ? dtLeaseProfile.Rows[0]["Escalation"].ToString() : "");
            //    string strDepositAmount = (dtLeaseProfile.Rows[0]["DepositAmount"].ToString() != "" ? dtLeaseProfile.Rows[0]["DepositAmount"].ToString() : "");


            //    string strFolderPath = Server.MapPath(@"~/Templates");
            //    string fileName = "Joshco_Lease_Agreement_mda.xml";
            //    string FileFullPath = Path.Combine(strFolderPath, fileName);


            //    XmlDocument document = new XmlDocument();
            //    TextReader reader = File.OpenText(FileFullPath);
            //    string allxml = reader.ReadToEnd();
            //    reader.Close();

            //    allxml = allxml.Replace("ns_1", strLesseeName);
            //    allxml = allxml.Replace("id_2", strId);
            //    allxml = allxml.Replace("ut_3", strUnitDescription);

            //    allxml = allxml.Replace("ns_4", strLesseeName);
            //    allxml = allxml.Replace("id_5", strId);

            //    //MaritalStatus                
            //    allxml = allxml.Replace("ms_6", strMaritalStstus);

            //    //System not catering for second tenant at the moment (but spouse)
            //    allxml = allxml.Replace("ns_7", "");
            //    allxml = allxml.Replace("id_8", "");
            //    allxml = allxml.Replace("ms_9", "");

            //tenants are married to each other - Yes
            // allxml = allxml.Replace("m_y", ""); //
            //tenants are married to each other - No
            //allxml = allxml.Replace("m_n", "");
            //married in community of property
            //allxml = allxml.Replace("in_c", "");
            //married out of community of property
            // allxml = allxml.Replace("out_of", "");
            //Cohabit as husband and wife -  Yes
            // allxml = allxml.Replace("bi_y", "");
            //Cohabit as husband and wife - No
            // allxml = allxml.Replace("bi_n", "");


            //allxml = allxml.Replace("ut_10", strUnitDescription);
            //allxml = allxml.Replace("sz_11", strUnitArea);
            //allxml = allxml.Replace("rl_12", strMonthlyRental);
            //allxml = allxml.Replace("es_13", strEscalation);
            //allxml = allxml.Replace("dep_14", strDepositAmount);

            ////Commencement - Termination
            //DateTime dtStart = (DateTime)dtLeaseProfile.Rows[0]["LeaseStartDate"];
            //DateTime dtEnd = (DateTime)dtLeaseProfile.Rows[0]["LeaseStartDate"];

            //double leaseDuration = DifferenceTotalYears(dtStart, dtEnd);
            // allxml = allxml.Replace("lease_duration", leaseDuration.ToString());


            //   int day = (int)dtStart.Day;
            //  allxml = allxml.Replace("dd", day.ToString());

            // allxml = allxml.Replace("lease_start_month_and_year", dtLeaseProfile.Rows[0]["LeaseStartDate"].ToString());     

            //Number of adults
            //  allxml = allxml.Replace("ad_", dtLeaseProfile.Rows[0][""].ToString());

            //Number of Children
            //  allxml = allxml.Replace("chi_", dtLeaseProfile.Rows[0][""].ToString());

            //  document.LoadXml(allxml);
            //document.Save(strFolderPath + "\\LeaseAgreement.doc");
            // Session["Ref"] = "LeaseAgreement_" + DateTime.Now.ToString("yyyyMMddHHmmss");
            //  document.Save(Server.MapPath("~/Agreement/") + Session["Ref"].ToString() + ".doc");


            //}
        }

        public double DifferenceTotalYears(DateTime start, DateTime end)
        {
            // Get difference in total months.
            int months = ((end.Year - start.Year) * 12) + (end.Month - start.Month);

            // substract 1 month if end month is not completed
            if (end.Day < start.Day)
            {
                months--;
            }

            double totalyears = months / 12d;
            return totalyears;
        }

        public void FillReport(ReportViewer rv)
        {
            rv.LocalReport.Refresh();
        }

        protected void sdsApplication_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["LeaseID"] = e.Command.Parameters["@LeaseID"].Value.ToString();
        }

        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfPropertyID.Value = this.ddlProperty.SelectedValue;
            this.sdsPropertyUnit.DataBind();
            this.ddlPropertyUnit.DataBind();
        }

        protected void ddlPropertyUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Data.DataView dv1 = null;
            dv1 = (System.Data.DataView)this.sdsPropertyUnit.Select(DataSourceSelectArguments.Empty);
            dv1.RowFilter = "PropertyUnitID = "+this.ddlPropertyUnit.SelectedValue+"";
            System.Data.DataTable dt1 = new System.Data.DataTable();
            dt1 = dv1.ToTable("Projects1");

            if(dt1.Rows.Count > 0)
            {
                this.txtInitialValue.Text = dt1.Rows[0]["EstRatePerSQM"].ToString();
                this.txtArea.Text = dt1.Rows[0]["UnitArea"].ToString();
                this.txtEscalation.Text = dt1.Rows[0]["EstEscalation"].ToString();
            }
        }
    }
}
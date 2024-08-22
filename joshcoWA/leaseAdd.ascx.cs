using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace joshcoWA
{
    public partial class leaseAdd : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
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
            this.sdsApplication.InsertParameters["RatePerSQM"].DefaultValue = this.txtRatePerSqm.Text;

            this.sdsApplication.Insert();

            //try { 
                SendAgreementLetter(this.hfEmail.Value, this.hfIDNumber.Value, this.hfName.Value); 
           // }catch { }



            Response.Redirect("leaseProfile.aspx");
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
            mailbody += "Url: <a href='http://www.quickpropsys.com/joshco/searchapplication.aspx' >Application</a>  </br></br>";

            sendmail.SendMail(emailAddress, name, "Joshco: Lease Application Approved", mailbody, Server.MapPath("~/Agreement/") + Session["FName"].ToString() + ".pdf");
        }

        protected void ExportToPDF(String SaveFile)
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
                Session["FName"] = "LeaseAgreement_" + DateTime.Now.ToString("yyyyMMddHHmmss");
                byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                FileStream file = new FileStream(Server.MapPath("~/Agreement/") + Session["FName"].ToString() + ".pdf", FileMode.Create, System.IO.FileAccess.Write);
                file.Write(bytes, 0, bytes.Length);
                file.Close();
            }
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
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.lease
{
    public partial class leaseProfile : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["LeaseID"].ToString();
            if (!IsPostBack)
            {
                if (Request.QueryString["bk"] != null)
                {
                    if (Request.QueryString["bk"].ToString() == "aa")
                    {
                        showMessageBox("Lease information submitted successfully");
                    }
                }

                FillProfile();

                Session["ReferenceID"] = Session["LeaseID"].ToString();
                Session["DocumentEntityTypeID"] = "2";
            }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsLeaseProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                //this.lblTenName.Text = dt.Rows[0]["LesseeName"].ToString();
                //this.lblPropName.Text = dt.Rows[0]["PropertyName"].ToString();

                this.lblArea.Text = dt.Rows[0]["UnitArea"].ToString() + " sqm";
                this.lblUnit.Text = dt.Rows[0]["PropertyUnit"].ToString();
                this.lblUnitName.Text = "Unit: " + dt.Rows[0]["PropertyUnit"].ToString();
                this.lblRate.Text = string.Format("{0:c}", dt.Rows[0]["EstRatePerSQM"]);

                this.lblTenant.Text = dt.Rows[0]["LesseeName"].ToString();
                this.lblProperty.Text = dt.Rows[0]["PropertyName"].ToString();
                this.lblPropName.Text = dt.Rows[0]["PropertyName"].ToString();
                this.lblInitialValue.Text = string.Format("{0:C}", dt.Rows[0]["InitialValue"]);
                this.lblVatable.Text = dt.Rows[0]["Vatable"].ToString();
                this.lblEscalation.Text = dt.Rows[0]["Escalation"].ToString();
                this.lblCommencement.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["LeaseStartDate"]);
                this.lblTermination.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["LeaseEndDate"]);
                this.lblInterest.Text = dt.Rows[0]["Interest"].ToString();
                this.lblInterestPercentage.Text = dt.Rows[0]["InterestPercentage"].ToString();
                this.lblTypeOfLease.Text = dt.Rows[0]["TypeOfLease"].ToString();
                this.lblLeaseStatus.Text = dt.Rows[0]["LeaseStatus"].ToString();
                this.lblComment.Text = dt.Rows[0]["Comment"].ToString();
                //this.lblTitle.Text = dt.Rows[0]["DOB"].ToString();
                //this.lblTitle.Text = dt.Rows[0]["DateStarted"].ToString();

                this.RadioButtonList1.SelectedValue = dt.Rows[0]["LeaseStatus"].ToString() == "" ? "" : dt.Rows[0]["LeaseStatus"].ToString();

                if (dt.Rows[0]["LeaseStatus"].ToString() == "Expired")
                {
                    this.pnlRenew.Visible = true;
                }

                if (dt.Rows[0]["LeaseStatus"].ToString() == "Renewed")
                {
                    this.pnlRenew.Visible = false;
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

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            this.SqlDataSource1.UpdateParameters["LeaseStatus"].DefaultValue = this.RadioButtonList1.SelectedValue;
            SqlDataSource1.UpdateParameters["LeaseID"].DefaultValue = Session["LeaseID"].ToString();
            SqlDataSource1.Update();

            showMessageBox("Updated successfully");
        }
    }
}
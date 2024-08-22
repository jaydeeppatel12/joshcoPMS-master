using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class mylease : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillLeaseProfile();
            }
        }

        public void FillLeaseProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsLeaseProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();

            if (dv != null)
            {
                dt = dv.ToTable();

                if (dt.Rows.Count > 0)
                {
                   
                    lblErrorMessage.Text = "";
                    lblErrorMessage.Visible = false;
                    divErrorMessage.Visible = false;

                    this.lblArea.Text = dt.Rows[0]["UnitArea"].ToString() + " sqm";
                    this.lblUnit.Text = dt.Rows[0]["PropertyUnit"].ToString();
                    this.lblRate.Text = string.Format("{0:c}", dt.Rows[0]["EstRatePerSQM"]);

                    this.lblTenant.Text = dt.Rows[0]["LesseeName"].ToString();
                    this.lblProperty.Text = dt.Rows[0]["PropertyName"].ToString();
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
                }
                else
                {                  
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "There is no lease profile linked to your account. Please contact the technical support team for assistance!";
                    divErrorMessage.Visible = true;
                }
            }
            else
            {               
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "There is no lease profile linked to your account. Please contact the technical support team for assistance!";
                divErrorMessage.Visible = true;
            }

        }
    }
}
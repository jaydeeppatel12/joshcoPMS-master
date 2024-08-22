using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class serviceProviderProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillProfile();
            }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsServiceProviderProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblServiceProviderEmail.Text = "Email: " + dt.Rows[0]["Email"].ToString();
                this.lblCompanyName.Text = dt.Rows[0]["ServiceProviderName"].ToString();
                this.lblSPName.Text = dt.Rows[0]["ServiceProviderName"].ToString();
                this.lblServiceProviderTel.Text = "Tel: " + dt.Rows[0]["Telephone"].ToString();
                this.lblFax.Text = "Fax: " + dt.Rows[0]["Fax"].ToString();

                this.lblSPName.Text = dt.Rows[0]["ServiceProviderName"].ToString();
                this.lblPhysicalAddress.Text = dt.Rows[0]["PhysicalAddress"].ToString();
                this.lblPostalAddress.Text = dt.Rows[0]["PostalAddress"].ToString();
                this.lblEntityType.Text = dt.Rows[0]["EntityType"].ToString();
                this.lblRegistrationNumber.Text = dt.Rows[0]["RegistrationNumber"].ToString();

                if (dt.Rows[0]["BEECertificate"].ToString() == "True") { this.lblBEECertificate.Text = "Yes"; } else { this.lblBEECertificate.Text = "No"; }

                this.lblBEELevel.Text = dt.Rows[0]["BEELevel"].ToString();
                this.lblBEEExpiringDate.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["BEEExpiringDate"]);
                if (dt.Rows[0]["TaxClearance"].ToString() == "True") { this.lblTaxClearance.Text = "Yes"; } else { this.lblTaxClearance.Text = "No"; }

                this.lblTaxClearanceExpiringDate.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["TaxClearanceExpiringDate"]);
                this.lblVatRegisteredNumber.Text = dt.Rows[0]["VatRegisteredNumber"].ToString();
                this.lblContactPersonName.Text = dt.Rows[0]["ContactPersonName"].ToString();

                this.cblServiceProviderSector.DataBind();
                foreach (ListItem li in this.cblServiceProviderSector.Items)
                {
                    if (dt.Rows[0]["ServiceProviderSectorID"].ToString().Contains("[" + li.Value + "]"))
                    {
                        li.Selected = true;
                    }
                }
            }
        }

        protected void lnkEditProfile_Click(object sender, EventArgs e)
        {

        }
    }
}
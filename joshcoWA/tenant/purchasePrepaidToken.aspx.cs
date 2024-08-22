using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class purchasePrepaidToken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            long ticks = DateTime.Now.Ticks;
            byte[] bytes = BitConverter.GetBytes(ticks);
            string id = "PR" + Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

            this.lblReferenceNo.Text = id;

            FillLeaseProfile();
        }


        public void FillLeaseProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsLeaseProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();


            if (dv != null)
            {
                dt = dv.ToTable();
                this.hfPropertyID.Value = dt.Rows[0]["PropertyID"].ToString();
                this.hfPropertyUnitID.Value = dt.Rows[0]["PropertyUnitID"].ToString();
                this.lblTenantName.Text = dt.Rows[0]["LesseeName"].ToString();

                csClientQuery cq = new csClientQuery();
                DataTable dtProperty = cq.GetPropertyById(this.hfPropertyID.Value);
                if (dtProperty.Rows.Count > 0)
                {
                    lblProperty.Text = dtProperty.Rows[0]["PropertyName"].ToString();
                }

                DataTable dtPropertyUnit = cq.GetPropertyUnitById(this.hfPropertyID.Value, this.hfPropertyUnitID.Value);
                if (dtPropertyUnit.Rows.Count > 0)
                {
                    lblPropertyUnit.Text = dtPropertyUnit.Rows[0]["PropertyUnit"].ToString();
                }
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class tenantQueryAdd : joshcoWA.BasePage
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
                    ((LinkButton)addQuery.FindControl("lnkSubmit")).Enabled = true;

                    try
                    {
                        this.hfPropertyID.Value = dt.Rows[0]["PropertyID"].ToString();
                        this.hfPropertyUnitID.Value = dt.Rows[0]["PropertyUnitID"].ToString();
                        this.hfTenantName.Value = dt.Rows[0]["LesseeName"].ToString();

                        ((Label)addQuery.FindControl("lblTenantName")).Text = this.hfTenantName.Value;
                        ((HiddenField)addQuery.FindControl("hfPropertyUnitID")).Value = this.hfPropertyUnitID.Value;


                        csClientQuery cq = new csClientQuery();
                        DataTable dtProperty = cq.GetPropertyById(this.hfPropertyID.Value);
                        if (dtProperty.Rows.Count > 0)
                        {
                            ((Label)addQuery.FindControl("lblProperty")).Text = dtProperty.Rows[0]["PropertyName"].ToString();
                        }

                        DataTable dtPropertyUnit = cq.GetPropertyUnitById(this.hfPropertyID.Value, this.hfPropertyUnitID.Value);
                        if (dtPropertyUnit.Rows.Count > 0)
                        {
                            ((Label)addQuery.FindControl("lblPropertyUnit")).Text = dtPropertyUnit.Rows[0]["PropertyUnit"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        showMessageBox(ex.Message);
                    }
                }
                else
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "There is no lease profile linked to your account.Therefore you cannot submit this query. Please contact the technical support team for assistance!";
                    divErrorMessage.Visible = true;
                    ((LinkButton)addQuery.FindControl("lnkSubmit")).Enabled = false;
                }
            }
            else
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "There is no lease profile linked to your account.Therefore you cannot submit this query. Please contact the technical support team for assistance!";
                divErrorMessage.Visible = true;
                ((LinkButton)addQuery.FindControl("lnkSubmit")).Enabled = false;
            }
        }
    }
}


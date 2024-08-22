using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class frmSupplier3 : System.Web.UI.UserControl
    {
        clSupplier supp = new clSupplier();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SaveDetails( string ServiceProviderID)
        {
            string ID = "";
            supp.ServiceProviderID = Convert.ToInt32(ServiceProviderID); 
            supp.BusinessOperationID = Convert.ToInt32(this.ddlBusinessOperation.SelectedValue); 
            supp.AnnualAvarageTurnover = Convert.ToDouble(txtAnnualAvarageTurnover.Value);
            supp.GrossAssetValue = Convert.ToDouble(txtGrossAssetValue.Value);
            supp.EconomicSectorID = Convert.ToInt32(this.ddlEconomicSector.SelectedValue);
            supp.TypeOfBusinessID = Convert.ToInt32(ddlTypeOfBusiness.SelectedValue);
            supp.FullTimePaidEmployees = Convert.ToInt32(txtFullTimePaidEmployees.Value);
            supp.SMMEStatusID = Convert.ToInt32(this.ddlSMMEStatus.SelectedValue);
            supp.BusinessOperationOther = "";

            ID = supp.SaveSupplier3();

             return ID;
        }

        public void GetDetails(long ServiceProviderID)
        {
            DataTable dt = new DataTable();
            supp.ServiceProviderID = ServiceProviderID;
            dt = supp.GetSupplier(ServiceProviderID.ToString());

            if (dt.Rows.Count > 0)
            {
                this.ddlBusinessOperation.SelectedValue  = dt.Rows[0]["BusinessOperationID"].ToString();
                txtAnnualAvarageTurnover.Value = dt.Rows[0]["AnnualAvarageTurnover"].ToString();
                txtGrossAssetValue.Value = dt.Rows[0]["GrossAssetValue"].ToString();
                this.ddlEconomicSector.SelectedValue = dt.Rows[0]["EconomicSectorID"].ToString();
                ddlTypeOfBusiness.SelectedValue = dt.Rows[0]["TypeOfBusinessID"].ToString();
                txtFullTimePaidEmployees.Value = dt.Rows[0]["FullTimePaidEmployees"].ToString();
                this.ddlSMMEStatus.SelectedValue = dt.Rows[0]["SMMEStatusID"].ToString();
            }
        }
    }
}
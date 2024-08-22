using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class frmSupplier4 : System.Web.UI.UserControl
    {
        clSupplier supp = new clSupplier();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SaveDetails(string ServiceProviderID)
        {
            string ID = "";
            supp.ServiceProviderID = Convert.ToInt32(ServiceProviderID);
            supp.BusinessName = txtBusinessName.Value;
            supp.PhysicalAddress = txtPhysicalAddress.Value;
            supp.City = txtCity.Value;
            supp.PhysicalAddressCode = Convert.ToInt32(txtPhysicalAddressCode.Value);
            supp.ProvinceID = Convert.ToInt32(this.ddlProvince.SelectedValue);
            supp.Telephone = txtTelephone.Value;
            supp.Fax = txtFax.Value;
            supp.Email = txtEmail.Value;
            supp.WebPageAddress = txtWebPageAddress.Value;
            supp.ContactPersonTitle = txtContactPersonTitle.Value;
            supp.ContactPersonName = txtContactPersonName.Value;
            supp.ContactPersonSurname = txtContactPersonSurname.Value;

            ID = supp.SaveSupplier4();

             return ID;
        }

        public void GetDetails(long ServiceProviderID)
        {
            DataTable dt = new DataTable();
            supp.ServiceProviderID = ServiceProviderID;
            dt = supp.GetSupplier(ServiceProviderID.ToString());

            if (dt.Rows.Count > 0)
            {
                txtBusinessName.Value = dt.Rows[0]["BusinessName"].ToString();
                txtPhysicalAddress.Value = dt.Rows[0]["PhysicalAddress"].ToString();
                txtCity.Value = dt.Rows[0]["City"].ToString();
                txtPhysicalAddressCode.Value = dt.Rows[0]["PhysicalAddressCode"].ToString();
                this.ddlProvince.SelectedValue = dt.Rows[0]["ProvinceID"].ToString();
                txtTelephone.Value = dt.Rows[0]["Telephone"].ToString();
                txtFax.Value = dt.Rows[0]["Fax"].ToString();
                txtEmail.Value = dt.Rows[0]["Email"].ToString();
                txtWebPageAddress.Value = dt.Rows[0]["WebPageAddress"].ToString();
                txtContactPersonTitle.Value = dt.Rows[0]["ContactPersonTitle"].ToString();
                txtContactPersonName.Value = dt.Rows[0]["ContactPersonName"].ToString();
                txtContactPersonSurname.Value = dt.Rows[0]["ContactPersonSurname"].ToString();
            }
        }
    }
}
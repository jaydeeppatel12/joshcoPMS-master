using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class frmSupplier6 : System.Web.UI.UserControl
    {
        clSupplier supp = new clSupplier();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SaveDetails(string ServiceProviderID)
        {
            string ID = "";
            supp.ServiceProviderID = Convert.ToInt32(ServiceProviderID);
            supp.Declaration = Convert.ToBoolean(this.chkDeclaration1.Checked);
            supp.RepresentativeCapacity = this.txtRepresentativeCapacity.Text;
            supp.RepresentativeName = txtRepresentativeName.Text;

            ID = supp.SaveSupplier6();

            return ID;
        }

        public void GetDetails(long ServiceProviderID)
        {
            DataTable dt = new DataTable();
            supp.ServiceProviderID = ServiceProviderID;
            dt = supp.GetSupplier(ServiceProviderID.ToString());

            if (dt.Rows.Count > 0)
            {
                txtRepresentativeCapacity.Text = dt.Rows[0]["RepresentativeCapacity"].ToString();
                txtRepresentativeName.Text = dt.Rows[0]["RepresentativeName"].ToString();
               

                if (dt.Rows[0]["Declaration"] == DBNull.Value)
                {

                }
                else
                {
                    chkDeclaration1.Checked = Convert.ToBoolean(dt.Rows[0]["Declaration"].ToString());

                }
 
            }
        }

        protected void RefreshImage(object sender, EventArgs e)
        {
            //Call UserValidated function to refresh, as validation will be false image get's refreshed
            var Refesh = Captcha1.UserValidated;

        }
    }
}
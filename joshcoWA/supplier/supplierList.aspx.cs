using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class supplierList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                FillServiceProvider("");
            
            }
        }
        protected void SearchProperty(object sender, EventArgs e)
        {
            string sString = "";
            sString += "([ServiceProviderName] like '%" + this.txtSearch.Value + "%' or ''='" + this.txtSearch.Value + "')";

            FillServiceProvider(sString);
        }

        public void FillServiceProvider(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsProvider.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvSupplier.DataSource = dt2;
            this.gvSupplier.DataBind();

            lblTotalProperties.Text = "Total row(s) " + this.gvSupplier.Rows.Count.ToString();
        }
  
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProvider")
            {
                Session["ServiceProviderID"] = e.CommandArgument.ToString();
                Response.Redirect("supplierView.aspx");
            }
        }
    }
}
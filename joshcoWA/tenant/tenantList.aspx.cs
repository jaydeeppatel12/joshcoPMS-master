using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace joshcoWA.tenant
{
    public partial class tenantList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvTenant_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="ViewTenant")
            {
                Session["TenantID"] = e.CommandArgument.ToString();
                Response.Redirect("tenantView.aspx");
            }
        }

        protected void SearchTenant(object sender, EventArgs e)
        {
            this.sdsTenant.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsTenant.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = "FullName like '%" + this.txtSearch.Value + "%'";
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvTenant.DataSourceID = null;
            this.gvTenant.DataSource = dt2;
            this.gvTenant.DataBind();

        }
    }
}
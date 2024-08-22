using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.aod
{
  public partial class TenantsPaymentPlan : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!this.IsPostBack)
      {
        GetTenantsPaymentPlan();
      }
    }

    private void GetTenantsPaymentPlan()
    {
      DataView dataView;
      dataView = (DataView)this.sdsTenantPaymentPlan.Select(DataSourceSelectArguments.Empty);
      DataTable dataTable = new DataTable();
      dataTable = dataView.ToTable();
      this.GridView1.DataSource = dataTable;
      this.GridView1.DataBind();
    }
  }
}
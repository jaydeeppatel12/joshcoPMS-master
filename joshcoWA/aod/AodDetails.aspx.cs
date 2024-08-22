using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.aod
{
  public partial class AodDetails : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!this.IsPostBack)
      {
        GetAcknowladgedTenants();
      }
    }

    private void GetAcknowladgedTenants()
    {
      DataView dataView;
      dataView = (DataView)this.sdsAcknowladgedTenants.Select(DataSourceSelectArguments.Empty);
      DataTable dataTable = new DataTable();
      dataTable = dataView.ToTable();
      this.GridView1.DataSource = dataTable;
      this.GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      if (e.CommandName == "AddTenantPaymentPlan")
      {
        Session["TenantId"] = e.CommandArgument.ToString();
        Response.Redirect("PaymentPlan.aspx");
      }     
    }
  }
}
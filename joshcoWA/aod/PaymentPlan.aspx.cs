using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.aod
{
  public partial class PaymentPlan : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!this.IsPostBack)
      {
        GetTenantDatailsById();
      }
    }

    protected void GetTenantDatailsById()
    {
      DataView dataView;
      dataView = (DataView)this.sdsTenant.Select(DataSourceSelectArguments.Empty);
      DataTable dataTable = new DataTable();
      dataTable = dataView.ToTable();

      if (dataTable.Rows.Count > 0)
      {
        this.txtArrearsAmount.Value = dataTable.Rows[0]["Installment"].ToString();
      }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
      try
      {
        var paymentPlanId = Guid.NewGuid().ToString();
        this.sdsTenant.InsertParameters["PaymentPlanId"].DefaultValue = paymentPlanId;
        this.sdsTenant.InsertParameters["TenantId"].DefaultValue = Session["TenantId"].ToString();
        this.sdsTenant.InsertParameters["TotalArrearsAmount"].DefaultValue = this.txtArrearsAmount.Value;
        this.sdsTenant.InsertParameters["MonthlyAffordablePayment"].DefaultValue = this.txtAmountAffordable.Value;
        this.sdsTenant.InsertParameters["DurationInMonths"].DefaultValue = this.txtNumberOfMonths.Value; 
        this.sdsTenant.InsertParameters["CurrentPlan_DueDate"].DefaultValue = this.txtDueDate.Text;
        this.sdsTenant.InsertParameters["CreatedBy"].DefaultValue = "";
        this.sdsTenant.Insert();

        this.sdsTenantPaymentPlan.InsertParameters["PaymentPlanId"].DefaultValue = paymentPlanId;
        this.sdsTenantPaymentPlan.Insert();

        Response.Redirect("AodDetails.aspx");
      }
      catch(Exception ex)
      {
        showMessageBox("Error occured trying to add tenant payment plan");
        return;
      }
    }

    public void showMessageBox(string message)
    {
      string sScript = null;
      message = message.Replace("'", "\\'");
      sScript = string.Format("alert('{0}');", message);
      ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
    }

  }
}
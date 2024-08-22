using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace joshcoWA
{
    public partial class serviceProviderHome : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDashBoard();
            }
        }

        public void FillDashBoard()
        {
            DataView dv;
            dv = (DataView)this.sdsDashBoard.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblTotalWorkOrders.Text = dt.Rows[0]["TotalWorkOrder"].ToString();
                this.lblTotalInProgress.Text = dt.Rows[0]["TotalWorkOrderInProgress"].ToString();
                this.lblTotalClosed.Text = dt.Rows[0]["TotalWorkOrderCompleted"].ToString();
                this.lblTotalQuotation.Text = dt.Rows[0]["TotalQuotation"].ToString();
                this.lblTotalNew.Text = dt.Rows[0]["NewQuotation"].ToString();
                this.lblTotalAwarded.Text = dt.Rows[0]["AwardedQuotation"].ToString();  
            }
        }

        protected void lblTotalWorkOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceProviderWorkOrder.aspx");
        }

        protected void lblTotalQuotation_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceProviderQuotation.aspx");
        }

        protected void lblTotalInProgress_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceProviderWorkOrder.aspx?f=1");
        }

        protected void lblTotalClosed_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceProviderWorkOrder.aspx?f=2");
        }

        protected void lblTotalNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceProviderQuotation.aspx");
        }

        protected void lblTotalAwarded_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceProviderQuotation.aspx");
        }

        
    }
}
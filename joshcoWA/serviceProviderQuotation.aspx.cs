using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class serviceProviderQuotation : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                FillServiceQuotation("");
            }
        }
        public void FillServiceQuotation(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsQuotation.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvQuotation.DataSource = dt2;
            this.gvQuotation.DataBind();
        }


        protected void sdsQuotation_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["InvitationToQuoteID"] = e.Command.Parameters["@InvitationToQuoteID"].Value.ToString();
            Response.Redirect("serviceProviderQuotationView.aspx");
        }

        protected void gvQuotation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewQuotation")
            {
                Session["InvitationToQuoteID"] = e.CommandArgument.ToString();
                Response.Redirect("serviceProviderQuotationView.aspx");
            }
        }

        protected void gvQuotation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToDateTime(e.Row.Cells[3].Text) < Convert.ToDateTime(DateTime.Today.Date))
                {
                    e.Row.BackColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class serviceProviderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                 FillServiceProvider("");
            }
        }
        public void FillServiceProvider(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsProvider.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvServiceProvider.DataSource = dt2;
            this.gvServiceProvider.DataBind();
 
        }

        protected void sdsProvider_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["ServiceProviderID"] = e.Command.Parameters["@ServiceProviderID"].Value.ToString();
            Response.Redirect("ServiceProviderProfile.aspx");
        }

        protected void btnAddServiceProvider_Click(object sender, EventArgs e)
        {
            Session["ServiceProviderID"] = null;
            //((HiddenField)this.propertyForm.FindControl("hfPropertyID")).Value = "";
            //this.addServiceProvider.ClearFields();
            this.mpeLeaseAdd.Show();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProvider")
            {
                Session["ServiceProviderID"] = e.CommandArgument.ToString();
                Response.Redirect("ServiceProviderProfile.aspx");
            }
        }
    }
}
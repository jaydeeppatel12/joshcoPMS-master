using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.user
{
    public partial class supplierUserList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillUser("");

            }
        }

        public void FillUser(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsUser.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            //this.GridView1.DataSource = dt2;
            //this.GridView1.DataBind();
            lblTotalAccounts.Text = "Total row(s) " + dt2.Rows.Count.ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "ViewUser")
            //{
            //    ((HiddenField)this.addSupplierUser.FindControl("hfUserID")).Value = e.CommandArgument.ToString();
            //    ((HiddenField)this.addSupplierUser.FindControl("hfUserGroupID")).Value = "3";
            //    this.addSupplierUser.FillUser();
            //    this.mpeLeaseAdd.Show();
            //}
        }

        protected void btnAddUserAccount_Click(object sender, EventArgs e)
        {

            //((HiddenField)this.addSupplierUser.FindControl("hfUserGroupID")).Value = "3";
            //this.addSupplierUser.ClearFields();
            //this.mpeLeaseAdd.Show();
        }
    }
}
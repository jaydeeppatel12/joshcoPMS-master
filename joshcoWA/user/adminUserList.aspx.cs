using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class adminUserList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillLease("");

            }
        }

        public void FillLease(String search)
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
            //    ((HiddenField)this.addAdminUser.FindControl("hfUserID")).Value = e.CommandArgument.ToString();
            //    ((HiddenField)this.addAdminUser.FindControl("hfUserGroupID")).Value = "2";
            //    this.addAdminUser.FillUser();
            //    this.mpeLeaseAdd.Show();
            //}
        }

        protected void btnAddUserAccount_Click(object sender, EventArgs e)
        {
            
            //((HiddenField)this.addAdminUser.FindControl("hfUserGroupID")).Value = "2";
            //this.addAdminUser.ClearFields();
            //this.mpeLeaseAdd.Show();
        }

    }
}
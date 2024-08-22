using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.lease
{
    public partial class home : joshcoWA.BasePage
    {
        public int New = 0, Completed = 0, InProgress = 0, WorkOrder_ = 0, Inspection_ = 0, Maintenance_ = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDashBoard();

                this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
                this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
                this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";

                //lblExpiring.Text = this.lnkExpiring.Text;
                //lblExpired.Text = this.lnkExpired.Text;
                //lblActive.Text = this.lnkActive.Text;
            }
        }


        public DataTable FillLease(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsLease.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();

            this.gvLease.DataSource = dt1;
            this.gvLease.DataBind();

            return dt1;
        }


        public void FillDashBoard()
        {
            DataView dv;
            dv = (DataView)this.sdsDashBoard.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblExpiringTotal.Text = dt.Rows[7]["Total"].ToString();
                this.lblLeaseTotal.Text = dt.Rows[8]["Total"].ToString();
                this.lblActiveTotal.Text = dt.Rows[1]["Total"].ToString();
            }
        }


        protected void lblLeaseTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeaseList.aspx?fl=leas");
        }

        protected void lblActiveTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeaseList.aspx?fl=leasact");
        }

        protected void lblExpiringTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeaseList.aspx?fl=leasaexp");
        }

        protected void gvLease_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("leaseProfile.aspx");
            }
        }

        protected void lnkActive_Click(object sender, EventArgs e)
        {
            this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";
            this.lnkExpiring.Font.Bold = false;
            this.lnkActive.Font.Bold = true;
            this.lnkExpired.Font.Bold = false;
        }

        protected void lnkExpiring_Click(object sender, EventArgs e)
        {
            this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
            this.lnkExpiring.Font.Bold = true;
            this.lnkActive.Font.Bold = false;
            this.lnkExpired.Font.Bold = false;
        }

        protected void lnkExpired_Click(object sender, EventArgs e)
        {
            this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
            this.lnkExpiring.Font.Bold = false;
            this.lnkActive.Font.Bold = false;
            this.lnkExpired.Font.Bold = true;
        }

    }
}
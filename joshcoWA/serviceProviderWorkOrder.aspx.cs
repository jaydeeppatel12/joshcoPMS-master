using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace joshcoWA
{
    public partial class serviceProviderWorkOrder : BasePage
    {
        public int TotalPaidDeposit = 0, TotalPendingReview = 0, New = 0, Completed = 0, InProgress = 0, WorkOrder_ = 0, Inspection_ = 0, Maintenance_ = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                if(Request.QueryString["f"] !=null)
                {
                    if (Request.QueryString["f"].ToString()=="1")
                    {
                         FillLease("([LatestStatus] = 'In Progress')", "t");
                    }
                    else if (Request.QueryString["f"].ToString()=="2")
                    {
                        FillLease("([LatestStatus] = 'Completed')", "t");
                    }
                    else
                    {
                        FillLease("", "");
                    }
                }
                else { FillLease("", ""); }

                this.lblNew.Text = "New (" + New.ToString() + ") - ";
                this.lblCompleted.Text = "Completed (" + Completed.ToString() + ")";
                this.lblInProgress.Text = "In Progress (" + InProgress.ToString() + ") - ";

            }
        }
        decimal hfTotalCost = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                hfTotalCost += Convert.ToDecimal(((HiddenField)e.Row.FindControl("hfTotalCost")).Value);

                e.Row.Cells[3].BackColor = System.Drawing.Color.FromName(((HiddenField)e.Row.FindControl("hfBackColour")).Value);

                if (((HiddenField)e.Row.FindControl("hfStatus")).Value == "In Progress")
                {
                    e.Row.Cells[8].BackColor = Color.Yellow;
                    InProgress += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfStatus")).Value == "Completed")
                {
                    e.Row.Cells[8].BackColor = Color.GreenYellow;
                    Completed += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfStatus")).Value == "New")
                {
                    e.Row.Cells[8].BackColor = Color.White;
                    New += 1;
                }

                if (((HiddenField)e.Row.FindControl("hfCategory")).Value == "Work Order")
                {
                    WorkOrder_ += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfCategory")).Value == "Inspection")
                {
                    Inspection_ += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfCategory")).Value == "Maintenance")
                {
                    Maintenance_ += 1;
                }

            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lblTotal");
                lbl.Text = hfTotalCost.ToString("C");
            }
        }

        public void CountUnits(string deposit, string review)
        {
            if (deposit == "Active") { TotalPaidDeposit += 1; }
            if (review == "Yes") { TotalPendingReview += 1; }
        }

        public void FillLease(String search, string t)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsFacilityManagement.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.GridView1.DataSource = dt2;
            this.GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                Session["FacilityManagementID"] = e.CommandArgument.ToString();
                Response.Redirect("serviceProviderWorkOrderView.aspx");
            }
        }
 
        protected void lblNew_Click(object sender, EventArgs e)
        {
            FillLease("([LatestStatus] = 'New')", "t");
        }

        protected void lblInProgress_Click(object sender, EventArgs e)
        {
            FillLease("([LatestStatus] = 'In Progress')", "t");
        }

        protected void lblCompleted_Click(object sender, EventArgs e)
        {
            FillLease("([LatestStatus] = 'Completed')", "t");
        }

    }
}
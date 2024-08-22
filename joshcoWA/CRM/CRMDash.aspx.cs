using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.CRM
{
    public partial class CRMDash : joshcoWA.BasePage
    {
        public int New = 0, Completed = 0, InProgress = 0, WorkOrder_ = 0, Inspection_ = 0, Maintenance_ = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDashBoard();

                //this.lnkAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";
                //this.lnkSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ")";
                //this.lnkAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";

                //lblAppNew.Text = this.lnkAppNew.Text;
                //lblSuccessfull.Text = this.lnkSuccessfull.Text;
                //lblAppReviewed.Text = this.lnkAppReviewed.Text;

                ////FillWorkOrder("");

                //this.lnkInProgress.Text = "In Progress (" + FillWorkOrder("LatestStatus ='In Progress'").Rows.Count.ToString() + ") - ";
                //this.lnkCompleted.Text = "Completed (" + FillWorkOrder("LatestStatus ='Completed'").Rows.Count.ToString() + ")";
                //this.lnkNew.Text = "New (" + FillWorkOrder("LatestStatus ='New'").Rows.Count.ToString() + ") - ";

                //lblNew.Text = this.lnkNew.Text;
                //lblInProgress.Text = this.lnkInProgress.Text;
                //lblCompleted.Text = this.lnkCompleted.Text;


                //this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
                //this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
                //this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";

                //lblExpiring.Text = this.lnkExpiring.Text;
                //lblExpired.Text = this.lnkExpired.Text;
                //lblActive.Text = this.lnkActive.Text;

            }
        }

        public DataTable FillApplication(String search)
        {
            //this.sdsApplication.DataBind();

            //DataView dv2;
            //dv2 = (DataView)this.sdsApplication.Select(DataSourceSelectArguments.Empty);
            //dv2.RowFilter = search;
            //DataTable dt2 = new DataTable();
            //dt2 = dv2.ToTable();

            //this.gvApplication.DataSource = dt2;
            //this.gvApplication.DataBind();

            //return dt2;

            return new DataTable();
        }

        public DataTable FillLease(String search)
        {
            //DataView dv2;
            //dv2 = (DataView)this.sdsLease.Select(DataSourceSelectArguments.Empty);
            //dv2.RowFilter = search;
            //DataTable dt1 = new DataTable();
            //dt1 = dv2.ToTable();

            //this.gvLease.DataSource = dt1;
            //this.gvLease.DataBind();

            //return dt1;

            return new DataTable();
        }

        public DataTable FillWorkOrder(String search)
        {
            //DataView dv2;
            //dv2 = (DataView)this.sdsFacilityManagement.Select(DataSourceSelectArguments.Empty);
            //dv2.RowFilter = search;
            //DataTable dt2 = new DataTable();
            //dt2 = dv2.ToTable();

            //this.gvWorkOrder.DataSource = dt2;
            //this.gvWorkOrder.DataBind();

            //return dt2;

            return new DataTable();
        }

        public void FillDashBoard()
        {
            DataView dv;
            dv = (DataView)this.sdsDashBoard.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                //queries
                this.lblQueryTotal.Text = dt.Rows[9]["Total"].ToString();
                this.lblNewTotal.Text = dt.Rows[10]["Total"].ToString();
                this.lblInprogressTotal.Text = dt.Rows[11]["Total"].ToString();
                this.lblWorkOrderAssignedTotal.Text = dt.Rows[12]["Total"].ToString();
                this.lblCompletedTotal.Text = dt.Rows[13]["Total"].ToString();

                //complaints
                this.lblComplaintTotal.Text = dt.Rows[14]["Total"].ToString();
                this.lblNewComplaintTotal.Text = dt.Rows[15]["Total"].ToString();
                this.lblInprogressComplaintTotal.Text = dt.Rows[16]["Total"].ToString();
                this.lblWorkOrderAssignedComplaintTotal.Text = dt.Rows[17]["Total"].ToString();
                this.lblCompletedComplaintTotal.Text = dt.Rows[18]["Total"].ToString();
            }
        }


        protected void lblVacantUnitTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=univac");
        }

        protected void lblTenantTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?fl=ten");
        }


        protected void Label11_Click1(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?fl=ten");
        }

        protected void f_Click1(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?fl=ten");
        }

        protected void f_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?fl=active");
        }

        protected void Label11_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=movou");
        }

        protected void lblApplicationTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=app");
        }

        protected void lblPaidDepositTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=apppai");
        }

        protected void lblPendingReviewTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=apprev");
        }

        protected void lblLeaseTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=leas");
        }

        protected void lblActiveTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=leasact");
        }

        protected void lblExpiringTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=leasaexp");
        }

        protected void gvApplication_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewApplication")
            {
                Session["ApplicationID"] = e.CommandArgument.ToString();
                Response.Redirect("appProfile.aspx");
            }
        }

        protected void gvWorkOrder_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                Session["FacilityManagementID"] = e.CommandArgument.ToString();
                Response.Redirect("FacilityManagementProfile.aspx");
            }
        }

        protected void gvWorkOrder_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
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
        }
        protected void gvLease_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("leaseProfile.aspx");
            }
        }

        protected void lnkAppNew_Click(object sender, EventArgs e)
        {
            //this.lnkAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
            //this.lnkAppReviewed.Font.Bold = false;
            //this.lnkAppNew.Font.Bold = true;
            //this.lnkSuccessfull.Font.Bold = false;
        }

        protected void lnkAppReviewed_Click(object sender, EventArgs e)
        {
            //this.lnkAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";
            //this.lnkAppReviewed.Font.Bold = true;
            //this.lnkAppNew.Font.Bold = false;
            //this.lnkSuccessfull.Font.Bold = false;
        }

        protected void lnkSuccessfull_Click(object sender, EventArgs e)
        {
            //this.lnkSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ")";
            //this.lnkAppReviewed.Font.Bold = false;
            //this.lnkAppNew.Font.Bold = false;
            //this.lnkSuccessfull.Font.Bold = true;
        }

        protected void lnkActive_Click(object sender, EventArgs e)
        {
            //this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";
            //this.lnkExpiring.Font.Bold = false;
            //this.lnkActive.Font.Bold = true;
            //this.lnkExpired.Font.Bold = false;
        }

        protected void lblQueryTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx");
        }

        protected void lblNewTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=new");
        }

        protected void lblInprogressTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=In Progress");
        }

        protected void lblWorkOrderAssignedTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=Work Order Assigned");
        }

        protected void lblCompletedTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRMHome.aspx?fl=Completed");
        }

        protected void lblComplaintTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx");
        }

        protected void lblNewComplaintTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?cl=new");
        }

        protected void lblInprogressComplaintTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?cl=In Progress");
        }

        protected void lblWorkOrderAssignedComplaintTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?cl=Work Order Assigned");
        }

        protected void lblCompletedComplaintTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaintList.aspx?cl=Completed");
        }

        protected void lnkExpiring_Click(object sender, EventArgs e)
        {
            //this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
            //this.lnkExpiring.Font.Bold = true;
            //this.lnkActive.Font.Bold = false;
            //this.lnkExpired.Font.Bold = false;
        }

        protected void lnkExpired_Click(object sender, EventArgs e)
        {
            //this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
            //this.lnkExpiring.Font.Bold = false;
            //this.lnkActive.Font.Bold = false;
            //this.lnkExpired.Font.Bold = true;
        }

        protected void lblNew_Click(object sender, EventArgs e)
        {
            //this.lnkNew.Text = "New (" + FillWorkOrder("LatestStatus ='New'").Rows.Count.ToString() + ") - ";
            //this.lnkInProgress.Font.Bold = false;
            //this.lnkCompleted.Font.Bold = false;
            //this.lnkNew.Font.Bold = true;

        }

        protected void lblInProgress_Click(object sender, EventArgs e)
        {
            //this.lnkInProgress.Text = "In Progress (" + FillWorkOrder("LatestStatus ='In Progress'").Rows.Count.ToString() + ")";
            //this.lnkInProgress.Font.Bold = true;
            //this.lnkCompleted.Font.Bold = false;
            //this.lnkNew.Font.Bold = false;
        }

        protected void lblCompleted_Click(object sender, EventArgs e)
        {
            //this.lnkCompleted.Text = "Completed (" + FillWorkOrder("LatestStatus ='Completed'").Rows.Count.ToString() + ") - ";
            //this.lnkInProgress.Font.Bold = false;
            //this.lnkCompleted.Font.Bold = true;
            //this.lnkNew.Font.Bold = false;
        }

    }
}
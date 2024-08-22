using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicationHome
{
    public partial class home : joshcoWA.BasePage
    {
        public int New = 0, Completed = 0, InProgress = 0, WorkOrder_ = 0, Inspection_ = 0, Maintenance_ = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDashBoard();

                this.lnkAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";             
                this.lnkAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
                this.lnkSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ")";


                this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
                this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
                this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";

                tbScript();
            }
        }

        public void tbScript()
        {
            this.pnlApplication.Style.Add("Display", "none");
            this.pnlLease.Style.Add("Display", "none");
            this.pnlTenant.Style.Add("Display", "none");

            String AddScript1 = "";
            AddScript1 = " var pnl1 = document.getElementById('" + this.pnlApplication.ClientID + "');" +
            " var pnl2 = document.getElementById('" + this.pnlLease.ClientID + "');" +
             " var pnl3 = document.getElementById('" + this.pnlProperties.ClientID + "');" +
              " var pnl4 = document.getElementById('" + this.pnlTenant.ClientID + "');" +
            " var tb1 = document.getElementById('" + this.tbLease.ClientID + "');" +
            " var tb2 = document.getElementById('" + this.tbApplication.ClientID + "');" +
            " var tb3 = document.getElementById('" + this.tbProperty.ClientID + "');" +
            " var tb4 = document.getElementById('" + this.tbTenant.ClientID + "');" +
            " pnl2.style.display = '';" +
             " pnl3.style.display = 'none';" +
              " pnl4.style.display = 'none';" +
            " tb1.style.backgroundColor = '#fcaf17';" +
            " tb2.style.backgroundColor = '';" +
            " tb3.style.backgroundColor = '';" +
            " tb4.style.backgroundColor = '';" +
            " pnl1.style.display = 'none';";
            this.tbLease.Attributes.Add("onclick", AddScript1);
            this.tbLease.Attributes.Add("onmouseover", AddScript1);

            String AddScript2 = "";
            AddScript2 = " var pnl1 = document.getElementById('" + this.pnlApplication.ClientID + "');" +
            " var pnl2 = document.getElementById('" + this.pnlLease.ClientID + "');" +
             " var pnl3 = document.getElementById('" + this.pnlProperties.ClientID + "');" +
              " var pnl4 = document.getElementById('" + this.pnlTenant.ClientID + "');" +
            " var tb1 = document.getElementById('" + this.tbLease.ClientID + "');" +
            " var tb2 = document.getElementById('" + this.tbApplication.ClientID + "');" +
            " var tb3 = document.getElementById('" + this.tbProperty.ClientID + "');" +
            " var tb4 = document.getElementById('" + this.tbTenant.ClientID + "');" +
            " pnl2.style.display = 'none';" +
            " tb1.style.backgroundColor = '';" +
            " tb2.style.backgroundColor = '#fcaf17';" +
            " tb3.style.backgroundColor = '';" +
            " tb4.style.backgroundColor = '';" +
            " pnl3.style.display = 'none';" +
            " pnl4.style.display = 'none';" +
            " pnl1.style.display = '';";

            this.tbApplication.Attributes.Add("onclick", AddScript2);
            this.tbApplication.Attributes.Add("onmouseover", AddScript2);

            String AddScript3 = "";
            AddScript3 = " var pnl1 = document.getElementById('" + this.pnlApplication.ClientID + "');" +
            " var pnl2 = document.getElementById('" + this.pnlLease.ClientID + "');" +
             " var pnl3 = document.getElementById('" + this.pnlProperties.ClientID + "');" +
              " var pnl4 = document.getElementById('" + this.pnlTenant.ClientID + "');" +
            " var tb1 = document.getElementById('" + this.tbLease.ClientID + "');" +
            " var tb2 = document.getElementById('" + this.tbApplication.ClientID + "');" +
            " var tb3 = document.getElementById('" + this.tbProperty.ClientID + "');" +
            " var tb4 = document.getElementById('" + this.tbTenant.ClientID + "');" +
            " pnl2.style.display = 'none';" +
            " tb1.style.backgroundColor = '';" +
            " tb2.style.backgroundColor = '';" +
            " tb3.style.backgroundColor = '#fcaf17';" +
            " tb4.style.backgroundColor = '';" +
            " pnl2.style.display = 'none';" +
            " pnl3.style.display = '';" +
            " pnl4.style.display = 'none';" +
            " pnl1.style.display = 'none';";

            this.tbProperty.Attributes.Add("onclick", AddScript3);
            this.tbProperty.Attributes.Add("onmouseover", AddScript3);

            String AddScript4 = "";
            AddScript4 = " var pnl1 = document.getElementById('" + this.pnlApplication.ClientID + "');" +
            " var pnl2 = document.getElementById('" + this.pnlLease.ClientID + "');" +
             " var pnl3 = document.getElementById('" + this.pnlProperties.ClientID + "');" +
              " var pnl4 = document.getElementById('" + this.pnlTenant.ClientID + "');" +
            " var tb1 = document.getElementById('" + this.tbLease.ClientID + "');" +
            " var tb2 = document.getElementById('" + this.tbApplication.ClientID + "');" +
            " var tb3 = document.getElementById('" + this.tbProperty.ClientID + "');" +
            " var tb4 = document.getElementById('" + this.tbTenant.ClientID + "');" +
            " pnl2.style.display = 'none';" +
            " tb1.style.backgroundColor = '';" +
            " tb2.style.backgroundColor = '';" +
            " tb3.style.backgroundColor = '';" +
            " tb4.style.backgroundColor = '#fcaf17';" +
            " pnl2.style.display = 'none';" +
                " pnl3.style.display = 'none';" +
              " pnl4.style.display = '';" +
            " pnl1.style.display = 'none';";

            this.tbTenant.Attributes.Add("onclick", AddScript4);
            this.tbTenant.Attributes.Add("onmouseover", AddScript4);
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

        public DataTable FillApplication(String search)
        {
            this.sdsApplication.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsApplication.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvApplication.DataSource = dt2;
            this.gvApplication.DataBind();

            return dt2;
        }

  
        public void FillDashBoard()
        {
            DataView dv;
            dv = (DataView)this.sdsDashBoard.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblPropertyTotal.Text = dt.Rows[0]["Total"].ToString();
                this.lblUnitOcuppiedTotal.Text = dt.Rows[1]["Total"].ToString();
                this.lblVacantUnitTotal.Text = dt.Rows[2]["Total"].ToString();

                this.lblTenantTotal.Text = dt.Rows[3]["Total"].ToString();
           

                this.lblApplicationTotal.Text = dt.Rows[4]["Total"].ToString();
                this.lblPendingReviewTotal.Text = dt.Rows[5]["Total"].ToString();
                this.lblPaidDepositTotal.Text = dt.Rows[6]["Total"].ToString();

                this.lblExpiringTotal.Text = dt.Rows[7]["Total"].ToString();
                this.lblLeaseTotal.Text = dt.Rows[8]["Total"].ToString();
                this.lblActiveTotal.Text = dt.Rows[1]["Total"].ToString();
            }
        }


        protected void lblApplicationTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("appList.aspx?fl=app");
        }

        protected void lblPaidDepositTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("appList.aspx?fl=apppai");
        }

        protected void lblPendingReviewTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("appList.aspx?fl=apprev");
        }
 
        protected void gvApplication_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewApplication")
            {
                Session["ApplicationID"] = e.CommandArgument.ToString();
                Response.Redirect("appProfile.aspx");
            }
        }

        protected void gvProperties_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProperty")
            {
                Session["PropertyID"] = e.CommandArgument.ToString();
                Response.Redirect("../Property/PropertyProfile.aspx");
            }
        }

        protected void gvTenant_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewTenant")
            {
                Session["TenantID"] = e.CommandArgument.ToString();
                Response.Redirect("../tenant/tenantView.aspx");
            }
        }

        protected void lnkAppNew_Click(object sender, EventArgs e)
        {
            this.lnkAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
            this.lnkAppReviewed.Font.Bold = false;
            this.lnkAppNew.Font.Bold = true;
            this.lnkSuccessfull.Font.Bold = false;

            this.pnlLease.Style.Add("Display", "none");
            this.pnlApplication.Style.Add("Display", "");
        }

        protected void lnkAppReviewed_Click(object sender, EventArgs e)
        {
            this.lnkAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";
            this.lnkAppReviewed.Font.Bold = true;
            this.lnkAppNew.Font.Bold = false;
            this.lnkSuccessfull.Font.Bold = false;

            this.pnlLease.Style.Add("Display", "none");
            this.pnlApplication.Style.Add("Display", "");
        }

        protected void lnkSuccessfull_Click(object sender, EventArgs e)
        {
            this.lnkSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ")";
            this.lnkAppReviewed.Font.Bold = false;
            this.lnkAppNew.Font.Bold = false;
            this.lnkSuccessfull.Font.Bold = true;

            this.pnlLease.Style.Add("Display", "none");
            this.pnlApplication.Style.Add("Display", "");
        }


        protected void lblPropertyTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Property/PropertyList.aspx?fl=prop");
        }

        protected void lblUnitOcuppiedTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Property/PropertyList.aspx?fl=uniocc");
        }

        protected void lblVacantUnitTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Property/PropertyList.aspx?fl=univac");
        }

        protected void lblLeaseTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../lease/LeaseList.aspx?fl=leas");
        }

        protected void lblActiveTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../lease/LeaseList.aspx?fl=leasact");
        }

        protected void lblExpiringTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../lease/LeaseList.aspx?fl=leasaexp");
        }

        protected void gvLease_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("../lease/leaseProfile.aspx");
            }
        }

        protected void lnkActive_Click(object sender, EventArgs e)
        {
            this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";
            this.lnkExpiring.Font.Bold = false;
            this.lnkActive.Font.Bold = true;
            this.lnkExpired.Font.Bold = false;
            this.pnlLease.Style.Add("Display", "");
            this.pnlApplication.Style.Add("Display", "none");
        }

        protected void lnkExpiring_Click(object sender, EventArgs e)
        {
            this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
            this.lnkExpiring.Font.Bold = true;
            this.lnkActive.Font.Bold = false;
            this.lnkExpired.Font.Bold = false;
            this.pnlLease.Style.Add("Display", "");
            this.pnlApplication.Style.Add("Display", "none");
        }

        protected void lnkExpired_Click(object sender, EventArgs e)
        {
            this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
            this.lnkExpiring.Font.Bold = false;
            this.lnkActive.Font.Bold = false;
            this.lnkExpired.Font.Bold = true;
            this.pnlLease.Style.Add("Display", "");
            this.pnlApplication.Style.Add("Display", "none");
        }

        protected void lblTenantTotal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../tenant/tenantList.aspx?fl=ten");
        }

        protected void f_Click(object sender, EventArgs e)
        {
            Response.Redirect("../tenant/tenantList.aspx?fl=movin");
        }

        protected void Label11_Click(object sender, EventArgs e)
        {
            Response.Redirect("../tenant/tenantList.aspx?fl=movou");
        }
     
    }
}
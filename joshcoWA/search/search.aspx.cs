using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace joshcoWA.search
{
    public partial class search : joshcoWA.BasePage
    {
        public int TotalPaidDeposit = 0, TotalPendingReview = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                tbScript(this.Applications, this.hlnkApplications, "");
                tbScript(this.Leases, this.hlnkLeases, "none");
                tbScript(this.Tenants, this.hlnkTenants, "none");
                tbScript(this.Properties, this.hlnkProperties, "none");
                tbScript(this.Complaints, this.hlnkComplaints, "none");
                tbScript(this.Queries, this.hlnkQueries, "none");
            }
        }

        public void tbScript(HtmlGenericControl pnl, HyperLink hlnk, string display)
        {
            pnl.Style.Add("Display", "none");

            String AddScript1 = "";
            AddScript1 = " var pnl1 = document.getElementById('" + pnl.ClientID + "');" +
            " if('' = '" + display + "') {pnl1.style.display = 'none';}else{pnl1.style.display = '';}";
            hlnk.Attributes.Add("onclick", AddScript1);
        }

        protected void SearchProperty(object sender, EventArgs e)
        {
            string searchString = "";
            searchString = this.txtSearch.Value;
            FillApplication("([FullName]+' '+ [MaidenName]+' '+[ApplicantName] like '%" + searchString + "%')");
            FillLease("([LesseeName] like '%" + searchString + "%')");
            FillTenant("([FullName] like '%" + searchString + "%')");
            FillProperties("([PropertyName] like '%" + searchString + "%')");
            FillComplaints("([ReferenceNo]+' '+[Tenant]+' '+[ComplaintCategory] like '%" + searchString + "%')");
            FillQueries("([ReferenceNo]+' '+[Tenant]+' '+[QueryCategory] like '%" + searchString + "%')");
        }

        public DataTable FillApplication(String search)
        {
            this.sdsApplication.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsApplication.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();
            int i = 0;
            i = dt2.Rows.Count;

            if (i > 0)
            {
                this.hlnkApplications.Text = "Applications matching <b>'" + this.txtSearch.Value + "'</b> (" + i.ToString() + ")"; 
                this.pnlApplication.Visible = true;

                this.gvApplication.DataSource = dt2;
                this.gvApplication.DataBind();
            }
            else { this.pnlApplication.Visible = false; }

            return dt2;
        }

        public DataTable FillLease(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsLease.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();
            int i = 0;
            i = dt1.Rows.Count;

            if (i > 0)
            {
                this.hlnkLeases.Text = "Leases matching <b>'" + this.txtSearch.Value + "'</b> (" + i.ToString() + ")";
                this.pnlLease.Visible = true;
                this.gvLease.DataSource = dt1;
                this.gvLease.DataBind();
            }
            else { this.pnlLease.Visible = false; }

            return dt1;
        }

        public DataTable FillTenant(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsTenant.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();
            int i = 0;
            i = dt1.Rows.Count;

            if (i > 0)
            {
                this.hlnkTenants.Text = "Tenants matching <b>'" + this.txtSearch.Value + "'</b> (" + i.ToString() + ")"; 
                this.pnlTenant.Visible = true;
                this.gvTenant.DataSource = dt1;
                this.gvTenant.DataBind();
            }
            else { this.pnlTenant.Visible = false; }

            return dt1;
        }

        public DataTable FillProperties(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsProperty.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();
            int i = 0;
            i = dt1.Rows.Count;

            if (i > 0)
            {
                this.hlnkProperties.Text = "Properties matching <b>'" + this.txtSearch.Value + "'</b> (" + i.ToString() + ")"; 
                this.pnlProperties.Visible = true;
                this.gvProperties.DataSource = dt1;
                this.gvProperties.DataBind();
            }
            else { this.pnlProperties.Visible = false; }

            return dt1;
        }

        public DataTable FillComplaints(String search)
        {
            csClientQuery cq = new csClientQuery();

            DataView dv2 = new DataView(cq.GetClientComplaint("0", ""));
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();
            int i = 0;
            i = dt1.Rows.Count;

            if (i > 0)
            {
                this.hlnkComplaints.Text = "Complaints matching <b>'" + this.txtSearch.Value + "'</b> (" + i.ToString() + ")"; 
                this.pnlComplaint.Visible = true;
                this.gvComplaint.DataSource = dt1;
                this.gvComplaint.DataBind();
            }
            else { this.pnlComplaint.Visible = false; }

            return dt1;
        }

        public DataTable FillQueries(String search)
        {
            csClientQuery cq = new csClientQuery();

            DataView dv2 = new DataView(cq.GetClientQuery("0", ""));
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();
            int i = 0;
            i = dt1.Rows.Count;

            if (i > 0)
            {
                this.hlnkQueries.Text = "Queries matching <b>'" + this.txtSearch.Value + "'</b> (" + i.ToString() + ")"; 
                this.pnlQuery.Visible = true;
                this.gvQuery.DataSource = dt1;
                this.gvQuery.DataBind();
            }
            else { this.pnlQuery.Visible = false; }

            return dt1;
        }

        protected void gvApplication_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "Application Successful")
                {
                    e.Row.Cells[3].BackColor = System.Drawing.Color.GreenYellow;
                }
                if (e.Row.Cells[3].Text == "Application Declined")
                {
                    e.Row.Cells[3].BackColor = System.Drawing.Color.Red;
                }
            }
        }
  
        protected void gvApplication_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewApplication")
            {
                Session["ApplicationID"] = e.CommandArgument.ToString();
                Response.Redirect("../application/appProfile.aspx");
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

        protected void gvLease_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("../lease/leaseProfile.aspx");
            }
        }
 
        protected void gvLease_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (Request.QueryString["fl"] != null)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    CountUnits(((HiddenField)e.Row.FindControl("hfActive")).Value, ((HiddenField)e.Row.FindControl("hfExpiring")).Value);

                    if (Request.QueryString["fl"].ToString() == "leasact")
                    {
                        if (((HiddenField)e.Row.FindControl("hfActive")).Value != "Active")
                        {
                            e.Row.Visible = false;
                        }
                    }
                    else if (Request.QueryString["fl"].ToString() == "leasaexp")
                    {
                        if (((HiddenField)e.Row.FindControl("hfExpiring")).Value != "Yes")
                        {
                            e.Row.Visible = false;
                        }
                    }
                }
            }
        }

        public void CountUnits(string deposit, string review)
        {
            if (deposit == "Active") { TotalPaidDeposit += 1; }
            if (review == "Yes") { TotalPendingReview += 1; }
        }

        protected void gvProperties_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProperty")
            {
                Session["PropertyID"] = e.CommandArgument.ToString();
                Response.Redirect("../Property/PropertyProfile.aspx");
            }
        }

    }
}
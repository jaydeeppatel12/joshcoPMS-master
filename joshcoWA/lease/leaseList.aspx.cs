using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.lease
{
    public partial class leaseList : joshcoWA.BasePage
    {
        public int TotalPaidDeposit = 0, TotalPendingReview = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                AdvancedSearch();

                this.lnkExpiring.Text = "Expiring (" + FillLease("Expiring ='Yes'").Rows.Count.ToString() + ") - ";
                this.lnkExpired.Text = "Expired (" + FillLease("LeaseStatus ='Expired'").Rows.Count.ToString() + ")";
                this.lnkActive.Text = "Active (" + FillLease("LeaseStatus ='Active'").Rows.Count.ToString() + ") - ";
            }
        }

        public void AdvancedSearch()
        {
            this.pnlAdvancedSearch.Style.Add("Display", "none");
            this.hlkCloseAdvancedSearch.Style.Add("Display", "none");

            String AddScript = "";
            AddScript = "var pnl = document.getElementById('" + this.pnlAdvancedSearch.ClientID + "');" +
            " var hlnk1 = document.getElementById('" + this.hlkAdvancedSearch.ClientID + "');" +
            " var hlnk2 = document.getElementById('" + this.hlkCloseAdvancedSearch.ClientID + "');" +
            " pnl.style.display = '';" +
            " hlnk1.style.display = 'none';" +
            " hlnk2.style.display = '';";
            this.hlkAdvancedSearch.Attributes.Add("onclick", AddScript);

            String AddScript1 = "";
            AddScript1 = "var pnl = document.getElementById('" + this.pnlAdvancedSearch.ClientID + "');" +
            " var hlnk1 = document.getElementById('" + this.hlkCloseAdvancedSearch.ClientID + "');" +
            " var hlnk2 = document.getElementById('" + this.hlkAdvancedSearch.ClientID + "');" +
            " pnl.style.display = 'none';" +
            " hlnk1.style.display = 'none';" +
            " hlnk2.style.display = '';";
            this.hlkCloseAdvancedSearch.Attributes.Add("onclick", AddScript1);
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            string sString = "";
            sString += "([LesseeName] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            sString += " and ([LeaseStatus] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            {
                sString += " and ([LeaseStartDate] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [LeaseStartDate] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            }
            if (this.rdpTermStart.SelectedDate.ToString() != "" && this.rdpTermEnd.SelectedDate.ToString() != "")
            {
                sString += " and ([LeaseEndDate] >= '" + this.rdpTermStart.SelectedDate.ToString() + "' and [LeaseEndDate] <= '" + this.rdpTermEnd.SelectedDate.ToString() + "')";
            }
            FillLease(sString);
        }

        public DataTable FillLease(String search)
        {
            DataView dv2;
            dv2 = (DataView)this.sdsLease.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();


            this.GridView1.DataSource = dt1;
            this.GridView1.DataBind();

            return dt1;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("leaseProfile.aspx");
            }
            //if (e.CommandName == "RenewLease")
            //{
            //    Session["LeaseID"] = e.CommandArgument.ToString();
            //    sdsLeaseProfile.DataBind();
            //    FillTenant();

            //    this.mpeLeaseDoc.Show();
            //}
        }



        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
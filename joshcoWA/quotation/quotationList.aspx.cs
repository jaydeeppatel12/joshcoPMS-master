using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.quotation
{
    public partial class quotationList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                AdvancedSearch();
                FillServiceQuotation("");
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
            sString += "([ReferenceNumber] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            //sString += " and ([FacilityManagementCategory] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            {
                sString += " and ([DueDate] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [DueDate] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            }

            FillServiceQuotation(  sString);
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
            lblTotalProperties.Text = "Total row(s) " + this.gvQuotation.Rows.Count.ToString();
        }

        protected void gvQuotation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewQuotation")
            {
                Session["InvitationToQuoteID"] = e.CommandArgument.ToString();
                Response.Redirect("quotationView.aspx");
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
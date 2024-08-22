using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.inspection
{
    public partial class inspectionList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                AdvancedSearch();
                FillInspection("");
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
            sString += "([ServiceProvider] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            sString += " and ([PropertyUnitID] = '" + this.ddlPropertyUnit.SelectedValue +"' or '0'='" + this.ddlPropertyUnit.SelectedValue + "')";
            if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            {
                sString += " and ([InspectionDate] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [InspectionDate] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            }

            FillInspection(sString);
        }
        public void FillInspection(String search)
        {
            DataView dv;
            dv = (DataView)this.sdsInspection.Select(DataSourceSelectArguments.Empty);
            dv.RowFilter = search;
            DataTable dt1 = new DataTable();
            dt1 = dv.ToTable();

            this.gvInspection.DataSource = dt1;
            this.gvInspection.DataBind();
            lblTotalProperties.Text = "Total row(s) " + this.gvInspection.Rows.Count.ToString();
        }

        protected void gvInspection_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewInspection")
            {
                Session["PropertyInspectionID"] = e.CommandArgument.ToString();
                Response.Redirect("InspectionView.aspx");
            }
        }

        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlPropertyUnit.Items.Clear();
            this.ddlPropertyUnit.Items.Add(new ListItem("-- All --", "0"));
            this.ddlPropertyUnit.DataBind();

        }
    }
}
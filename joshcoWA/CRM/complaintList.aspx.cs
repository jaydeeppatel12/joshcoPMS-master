using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.CRM
{
    public partial class complaintList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AdvancedSearch();
                GetClientComplaint("0", "");

                if (Request.QueryString["cl"] != null)
                {
                    FillQueries(Request.QueryString["cl"].ToString());
                }

            }
        }

        public void FillQueries(string status)
        {
            string sString = "";
            sString += "([Status] like '%" + status + "%')";

            GetClientComplaint("0", sString);
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
            sString += "([Tenant] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            sString += " and ([ComplaintCategory] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            {
                sString += " and ([DateAdded] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [DateAdded] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            }
 
            GetClientComplaint("0", sString);
        }

        public void GetClientComplaint(string UserID, string Filter)
        {
            Connection dv = new Connection();
            
            csClientQuery cq = new csClientQuery();
          
            DataView dv2 = new DataView(cq.GetClientComplaint(UserID, ""));
            dv2.RowFilter = Filter;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();

            this.gvQuery.DataSource = dt1;
            this.gvQuery.DataBind();
            lblTotalProperties.Text = "Total row(s) " + this.gvQuery.Rows.Count.ToString();

        }
        protected void btnAddComplaint_Click(object sender, EventArgs e)
        {
            ((LinkButton)addComplaint.FindControl("lbClear")).PostBackUrl = "complaintList.aspx";
            ((DropDownList)addComplaint.FindControl("ddlPropertyUnit")).DataBind();
            ((Label)addComplaint.FindControl("lblTenant")).Visible = false;
            this.mpeLeaseAdd.Show();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace joshcoWA.notifications
{
    public partial class NofificationsHome : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AdvancedSearch();
                GetClientQuery("0", "");

                if (Request.QueryString["fl"] != null)
                {
                    FillQueries(Request.QueryString["fl"].ToString());
                }
            }
        }

        public void FillQueries(string status)
        {
            string sString = "";
            sString += "([Status] like '%" + status + "%')";

            GetClientQuery("0", sString);
        }

        public void AdvancedSearch()
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            //string sString = "";
            //sString += "([ReferenceNo] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            //sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            //sString += " and ([QueryCategory] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            //if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            //{
            //    sString += " and ([DateAdded] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [DateAdded] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            //}

            //GetClientQuery("0", sString);            //string sString = "";
            //sString += "([ReferenceNo] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            //sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            //sString += " and ([QueryCategory] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            //if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            //{
            //    sString += " and ([DateAdded] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [DateAdded] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            //}

            //GetClientQuery("0", sString);
        }

        public void GetClientQuery(string UserID, string Filter)
        {
            Connection dv = new Connection();

            csClientQuery cq = new csClientQuery();
            DataView dv2 = new DataView(cq.GetClientQuery(UserID, ""));
            dv2.RowFilter = Filter;
            DataTable dt1 = new DataTable();
            dt1 = dv2.ToTable();

            this.gvQuery.DataSource = dt1;
            this.gvQuery.DataBind();
            lblTotalProperties.Text = "Total row(s) " + this.gvQuery.Rows.Count.ToString();
        }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

using System.Web.Security;
 
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace joshcoWA
{
    public partial class propertyList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                if (Request.QueryString["fl"] != null)
                {
                    if (Request.QueryString["fl"].ToString() == "uniocc")
                    {
                        FillProperties("occupied");
                    }
                    else if (Request.QueryString["fl"].ToString() == "univac")
                    {
                        FillProperties("vacant");
                    }
                }

                lblTotalProperties.Text = "Total row(s) "+this.gvProperties.Rows.Count.ToString();
            }
        }

        public void FillProperties(string Occupied)
        {
            this.sdsProperty.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsProperty.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = "(UnitOccupied <> 0 and 'occupied' = '" + Occupied + "') or (UnitVacant <> 0 and 'vacant' = '" + Occupied + "')";
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvProperties.DataSourceID = null;
            this.gvProperties.DataSource = dt2;
            this.gvProperties.DataBind();
        }

        protected void gvProperties_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProperty")
            {
                Session["PropertyID"] = e.CommandArgument.ToString();
                Response.Redirect("PropertyProfile.aspx");
            }
        }

        protected void btnAddProperty_Click(object sender, EventArgs e)
        {
            Session["PropertyID"] = null;
            ((HiddenField)this.propertyForm.FindControl("hfPropertyID")).Value = "";
            this.propertyForm.ClearFields();
            this.mpeLeaseAdd.Show();
        }

        protected void SearchProperty(object sender, EventArgs e)
        {
            this.sdsProperty.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsProperty.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = "PropertyName like '%"+this.txtSearch.Value+"%'";
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.gvProperties.DataSourceID = null;
            this.gvProperties.DataSource = dt2;
            this.gvProperties.DataBind();

        }
    }
}
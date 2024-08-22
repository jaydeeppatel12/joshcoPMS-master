using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void dlUnits_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "apply")
            {
                Session["applicationID"] = null;
                Response.Redirect("Applicant/appForm.aspx?ID="+e.CommandArgument.ToString());
            }
        }

        protected void dlUnits_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (File.Exists(Server.MapPath("~/propertypic/" + ((HiddenField)e.Item.FindControl("hfImageFileName")).Value)))
                {
                    ((Image)e.Item.FindControl("Image1")).ImageUrl = "~/propertypic/" + ((HiddenField)e.Item.FindControl("hfImageFileName")).Value;
                }
            }
        }

        protected void SearchProperty(object sender, EventArgs e)
        {
            this.sdsProperties.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsProperties.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = "PropertyName like '%" + this.txtSearch.Value + "%'";
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.dlUnits.DataSourceID = null;
            this.dlUnits.DataSource = dt2;
            this.dlUnits.DataBind();

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace joshcoWA._event
{
    public partial class eventList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["EventID"] = null;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewEvent")
            {
                Session["EventID"] = e.CommandArgument.ToString();

                Response.Redirect("EventView.aspx");
            }
        }
    }
}
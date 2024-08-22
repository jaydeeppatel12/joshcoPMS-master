using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.query
{
    public partial class queryAdd : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //((LinkButton)addQuery.FindControl("lbClear")).PostBackUrl = "../query/queryList.aspx";
                //((DropDownList)addQuery.FindControl("ddlPropertyUnit")).DataBind();
                //((Label)addQuery.FindControl("lblTenant")).Visible = false;
         
            }
        }
    }
}
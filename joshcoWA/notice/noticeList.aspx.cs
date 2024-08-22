using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.notice
{
    public partial class noticeList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["NoticeID"] = null;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="ViewNotice")
            {
                Session["NoticeID"] = e.CommandArgument.ToString();

                Response.Redirect("NoticeAdd.aspx");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class tenant_ : System.Web.UI.MasterPage
    {

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["UserGroupID"] != null)
            {
            }
            else { Response.Redirect("../logout.aspx?s=s"); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserGroup"] == null || Session["UserID"] == null)
            //{
            //    Response.Redirect("../logout.aspx?s=s");
            //}
            //if (Session["UserGroup"].ToString() == "" || Session["UserID"].ToString() == "")
            //{
            //    Response.Redirect("../logout.aspx?s=s");
            //}

            if (Session["UserGroupID"] != null)
            {
                if (!IsPostBack)
                {
                    this.lblUsername.Text = Session["UserFullName"].ToString();
                    this.lblUserGroup.Text = Session["UserGroup"].ToString();
                }
            }
            else { Response.Redirect("../logout.aspx?s=s"); }

        }



    }
}
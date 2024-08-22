using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class application1 : System.Web.UI.MasterPage
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["ApplicantID"] != null)
            {
            }
            else { Response.Redirect("../logout.aspx?s=s"); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ApplicantID"] != null)
            {
            }
            else { Response.Redirect("../logout.aspx?s=s"); }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class studentAdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Authentication and Authorisation

            //Redirect to admin home page
            Response.Redirect("student/StudentAdminHome.aspx");
        }
    }
}
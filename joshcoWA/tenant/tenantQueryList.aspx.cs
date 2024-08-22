using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class tenantQueryList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClientQuery(Session["UserID"].ToString(), "0");
      
            }
        }

        public void GetClientQuery(string UserID, string Filter)
        {
            Connection dv = new Connection();

            csClientQuery cq = new csClientQuery();
            DataTable dt = cq.GetClientQuery(UserID, Filter);

            this.gvQuery.DataSource = dt;
            this.gvQuery.DataBind();
        }

 
 
    }
}
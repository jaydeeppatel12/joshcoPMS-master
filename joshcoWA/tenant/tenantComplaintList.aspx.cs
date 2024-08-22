using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class tenantComplaintList : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    GetClientComplaint(Session["UserID"].ToString(), "0");
                }
            }
        }

        public void GetClientComplaint(string UserID, string Filter)
        {
            Connection dv = new Connection();

            csClientQuery cq = new csClientQuery();
            DataTable dt = cq.GetClientComplaint(UserID, Filter);

            this.gvQuery.DataSource = dt;
            this.gvQuery.DataBind();
        }
        
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class tenantNotice : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (this.gvNotice.Rows.Count > 0)
                {
                    this.lblTitle.Text = ((HiddenField)this.gvNotice.Rows[0].FindControl("hfTitle")).Value;
                    this.ltNotice.Text = ((Literal)this.gvNotice.Rows[0].FindControl("ltrNotice")).Text;

                }
            }
        }

        protected void gvNotice_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewNotice")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                this.lblTitle.Text = ((HiddenField)row.FindControl("hfTitle")).Value;
                this.ltNotice.Text = ((Literal)row.FindControl("ltrNotice")).Text;

                foreach (GridViewRow rw in this.gvNotice.Rows)
                {
                    rw.Style.Add("backgroundColor", "");
                }

                row.Style.Add("backgroundColor", "#FEEECD");
            }
        }

        public void tbScript(GridViewRow row)
        {
            row.Style.Add("backgroundColor", "");

            String AddScript1 = "";
            AddScript1 = " var pnl1 = document.getElementById('" + row.ClientID + "');" +
            " pnl1.style.backgroundColor = '#FEEECD';";
            row.Attributes.Add("onmouseover", AddScript1);
        }
    }
}
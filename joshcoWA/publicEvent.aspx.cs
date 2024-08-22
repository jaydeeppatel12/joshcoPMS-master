using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class publicEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (this.gvEvent.Rows.Count > 0)
                {
                    Panel1.Visible = true;
                    Panel2.Visible = true;
                    this.lblTitle.Text = ((HiddenField)this.gvEvent.Rows[0].FindControl("hfTitle")).Value;
                    this.ltEvent.Text = ((Literal)this.gvEvent.Rows[0].FindControl("ltrEvent")).Text;
                    this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)this.gvEvent.Rows[0].FindControl("hfStart")).Value));
                    this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)this.gvEvent.Rows[0].FindControl("hfEnd")).Value));
                }
            }
        }

        protected void gvEvent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewEvent")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                this.lblTitle.Text = ((HiddenField)row.FindControl("hfTitle")).Value;
                this.ltEvent.Text =  ((Literal)row.FindControl("ltrEvent")).Text;
                this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)row.FindControl("hfStart")).Value));
                this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)row.FindControl("hfEnd")).Value));

                foreach (GridViewRow rw in this.gvEvent.Rows)
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
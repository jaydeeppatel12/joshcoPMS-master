using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class tenentEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (this.gvEvent.Rows.Count > 0)
                {
                    this.lblTitle.Text = ((HiddenField)this.gvEvent.Rows[0].FindControl("hfTitle")).Value;
                    this.hfEventID.Value = ((HiddenField)this.gvEvent.Rows[0].FindControl("hfEvent1ID")).Value;


                    this.ltEvent.Text = ((Literal)this.gvEvent.Rows[0].FindControl("ltrEvent")).Text;
                    this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)this.gvEvent.Rows[0].FindControl("hfStart")).Value));
                    this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)this.gvEvent.Rows[0].FindControl("hfEnd")).Value));
                    FillEventRSVP();
                }
            }
        }
        protected void rblRSVP_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.sdsEventRSVP.InsertParameters["UserID"].DefaultValue = Session["UserID"].ToString();
            this.sdsEventRSVP.InsertParameters["EventID"].DefaultValue = this.hfEventID.Value;
            this.sdsEventRSVP.InsertParameters["RSVP"].DefaultValue = this.rblRSVP.SelectedValue ;
            this.sdsEventRSVP.Insert();

            showMessageBox("Updated successfully");
        }
        protected void gvEvent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewNotice")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                this.lblTitle.Text = ((HiddenField)row.FindControl("hfTitle")).Value;
                this.hfEventID.Value = ((HiddenField)row.FindControl("hfEvent1ID")).Value;
  
                this.ltEvent.Text = ((Literal)row.FindControl("ltrEvent")).Text;
                this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)row.FindControl("hfStart")).Value));
                this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(((HiddenField)row.FindControl("hfEnd")).Value));

                foreach (GridViewRow rw in this.gvEvent.Rows)
                {
                    rw.Style.Add("backgroundColor", "");
                }

                row.Style.Add("backgroundColor", "#FEEECD");

                FillEventRSVP();
            }
        }
        public void FillEventRSVP()
        {
            this.sdsEventRSVP.DataBind();

            DataView dv;
            dv = (DataView)this.sdsEventRSVP.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["RSVP"].ToString() != "")
                {
                    this.rblRSVP.SelectedValue =  dt.Rows[0]["RSVP"].ToString();
                }

                
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

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
    }
}
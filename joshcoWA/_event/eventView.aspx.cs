﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA._event
{
    public partial class eventView : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["EventID"] != null)
                {
                    FillProfile();
                    this.gvProperty.DataSourceID = "sdsPropertyEvent";
                    this.gvProperty.DataBind();
                    FillEventRSVP();
                }
 
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
                    this.rblRSVP.SelectedValue = dt.Rows[0]["RSVP"].ToString();
                }


            }
        }
        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsEvent.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblTitle.Text = dt.Rows[0]["EventTitle"].ToString();
                this.ltDescription.Text = dt.Rows[0]["Event"].ToString() ;
                this.rblFacebook.SelectedValue = dt.Rows[0]["PostOnFacebook"].ToString();
                this.rblTwitter.SelectedValue = dt.Rows[0]["PostOnTwitter"].ToString();
                this.rblWebsite.SelectedValue = dt.Rows[0]["PostOnWebSite"].ToString();
                this.lblStartDate.Text = dt.Rows[0]["Start"].ToString();
                this.lblEndDate.Text = dt.Rows[0]["End"].ToString();
            }
        }
        protected void rblRSVP_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.sdsEventRSVP.InsertParameters["UserID"].DefaultValue = Session["UserID"].ToString();
            this.sdsEventRSVP.InsertParameters["EventID"].DefaultValue = Session["EventID"].ToString();
            this.sdsEventRSVP.InsertParameters["RSVP"].DefaultValue = this.rblRSVP.SelectedValue ;
            this.sdsEventRSVP.Insert();

            showMessageBox("Updated successfully");
        }
        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventAdd.aspx");
        }
    }
}
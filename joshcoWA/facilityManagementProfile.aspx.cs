using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class facilityManagementProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
   this.ddlStatus.DataBind();
            FillProfile();
            }
         

            //if (Request.QueryString["a"] != null)
            //{
            //    mpeLeaseDoc.Show();
            //}
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsFacilityManagementProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
  
                this.lblRefNo.Text = dt.Rows[0]["RefNumber"].ToString();
                this.lblCategory.Text = dt.Rows[0]["FacilityManagementCategory"].ToString();
 
                this.lblProperty.Text = dt.Rows[0]["PropertyName"].ToString();
                this.lblPropertyUnit.Text = dt.Rows[0]["PropertyUnit"].ToString();
                this.lblServiceProvider.Text = dt.Rows[0]["ServiceProvider"].ToString();
                this.lblStartDate.Text = dt.Rows[0]["StartDate"].ToString();
                this.lblEndDate.Text = dt.Rows[0]["EndDate"].ToString();
                this.lblTotalCost.Text = string.Format("{0:C}", dt.Rows[0]["TotalCost"]);
                this.lblCostPaid.Text = dt.Rows[0]["TotalCostPaid"].ToString() == "True" ? "Yes" : "No";
                this.lblDescription.Text = dt.Rows[0]["Description"].ToString();
                this.ddlStatus.SelectedItem.Text = dt.Rows[0]["LatestStatus"].ToString();

                //if (dt.Rows[0]["LatestStatus"].ToString() == "New")
                //{
                //    this.pnlStatus.BackColor = System.Drawing.Color.White;
                //}
                //else if (dt.Rows[0]["LatestStatus"].ToString() == "In Progress")
                //{
                //    this.pnlStatus.BackColor = System.Drawing.Color.FromName("#FFFF66");
                //}
                //else if (dt.Rows[0]["LatestStatus"].ToString() == "Completed")
                //{
                //    this.pnlStatus.BackColor = System.Drawing.Color.FromName("#66FF33");
                //}
            }
        }
        protected void btnTimeSheet_Click(object sender, EventArgs e)
        {
            this.sdsTask.InsertParameters["FacilityManagementID"].DefaultValue = Session["FacilityManagementID"].ToString();
            this.sdsTask.InsertParameters["TaskStatusID"].DefaultValue = this.ddlTaskStatus.SelectedValue;
            this.sdsTask.InsertParameters["TaskComment"].DefaultValue = this.txtTaskComment.Value;
            this.sdsTask.InsertParameters["StartTime"].DefaultValue = this.rdpStartTime.SelectedDate.ToString();
            this.sdsTask.InsertParameters["EndTime"].DefaultValue = this.rdpEndTime.SelectedDate.ToString();
            this.sdsTask.Insert();
            this.GridView3.DataBind();
            ClearFields();
        }

        public void ClearFields()
        {
            this.txtTaskComment.Value = "";
            this.rdpStartTime.Clear();
            this.rdpEndTime.Clear();
        }

        public void HtmlAnchor_Click(Object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor btn = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow row = (GridViewRow)(btn.NamingContainer);
            HiddenField hfEmployeeTimeSheetID = (HiddenField)row.FindControl("hfFacilityManagementTimeSheetID");

            this.sdsTask.DeleteParameters["FacilityManagementTimeSheetID"].DefaultValue = hfEmployeeTimeSheetID.Value;
            this.sdsTask.Delete();
            this.GridView3.DataBind();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SqlDataSource1.UpdateParameters["FacilityManagementStatusID"].DefaultValue = this.ddlStatus.SelectedValue;
            this.SqlDataSource1.UpdateParameters["FacilityManagementID"].DefaultValue = Session["FacilityManagementID"].ToString();
            this.SqlDataSource1.Update();

            showMessageBox("Updated Successfully");

           // FillProfile();
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

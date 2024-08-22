using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.workorder
{
    public partial class addWorkOrder : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (this.hfFacilityManagementID.Value == "0" || this.hfFacilityManagementID.Value == "")
            {
                this.sdsFacilityManagement.InsertParameters["FacilityManagementCategoryID"].DefaultValue = this.ddlCategory.SelectedValue;
                this.sdsFacilityManagement.InsertParameters["PropertyUnitID"].DefaultValue = this.ddlPropertyUnit.SelectedValue;
                this.sdsFacilityManagement.InsertParameters["ServiceProviderID"].DefaultValue = this.ddlServiceProvider.SelectedValue;

                this.sdsFacilityManagement.InsertParameters["StartDate"].DefaultValue = this.dpStartDate.Text;
                this.sdsFacilityManagement.InsertParameters["EndDate"].DefaultValue = this.dpEndDate.Text;
                this.sdsFacilityManagement.InsertParameters["TotalCost"].DefaultValue = this.txtCost.Value;
                this.sdsFacilityManagement.InsertParameters["TotalCostPaid"].DefaultValue = this.rblCostPaid.SelectedValue;

                this.sdsFacilityManagement.InsertParameters["Description"].DefaultValue = this.txtNotes.Value;
                this.sdsFacilityManagement.InsertParameters["FacilityManagementStatusID"].DefaultValue = "1";
                this.sdsFacilityManagement.InsertParameters["InvitationToQuoteID"].DefaultValue = this.ddlQuotation.SelectedValue;

                this.sdsFacilityManagement.Insert();

                showMessageBox("Submitted successfully");
            }
            else
            {
                this.sdsFacilityManagement.UpdateParameters["FacilityManagementCategoryID"].DefaultValue = this.ddlCategory.SelectedValue;
                this.sdsFacilityManagement.UpdateParameters["PropertyUnitID"].DefaultValue = this.ddlPropertyUnit.SelectedValue;
                this.sdsFacilityManagement.UpdateParameters["ServiceProviderID"].DefaultValue = this.ddlServiceProvider.SelectedValue;

                this.sdsFacilityManagement.UpdateParameters["StartDate"].DefaultValue = this.dpStartDate.Text;
                this.sdsFacilityManagement.UpdateParameters["EndDate"].DefaultValue = this.dpEndDate.Text;
                this.sdsFacilityManagement.UpdateParameters["TotalCost"].DefaultValue = this.txtCost.Value;
                this.sdsFacilityManagement.UpdateParameters["TotalCostPaid"].DefaultValue = this.rblCostPaid.SelectedValue;

                this.sdsFacilityManagement.UpdateParameters["Description"].DefaultValue = this.txtNotes.Value;
                this.sdsFacilityManagement.UpdateParameters["FacilityManagementID"].DefaultValue = this.hfFacilityManagementID.Value;
                this.sdsFacilityManagement.Update();

                showMessageBox("Updated successfully");
            }
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void sdsInspection_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["FacilityManagementID"] = e.Command.Parameters["@FacilityManagementID"].Value.ToString();

            if (this.lblQueryID.Text != "" && this.lblQueryID.Text != "0")
            {
                csClientQuery cq = new csClientQuery();
                cq.UpdateClientStatus(this.lblQueryID.Text, "Work Order Assigned", Session["FacilityManagementID"].ToString());
                Response.Redirect("../query/queryView.aspx?ID=" + this.lblQueryID.Text);
            }
            else
            {
                Response.Redirect("workorderView.aspx?a=a");
            }
        }

        protected void ddlQuotation_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillPropDetails();
        }

        public void FillPropDetails()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("exec SelectQuoteDropdown @InvitationToQuoteID", connection))
                {
                    command.Parameters.AddWithValue("@InvitationToQuoteID", this.ddlQuotation.SelectedValue);
                    SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                    if (reader.HasRows)
                    {
                        reader.Read();
                        this.ddlProperty.SelectedValue = reader["PropertyID"].ToString();
                        this.txtNotes.Value = reader["WorkDescription"].ToString();
                        this.ddlServiceProvider.SelectedValue = reader["ServiceProviderID"].ToString();
                        this.txtCost.Value = reader["QuotedAmount"].ToString();

                        this.ddlProperty.Enabled = false;
                        this.ddlServiceProvider.Enabled = false;
                        //this.txtCost.Disabled = true;
                    }
                }
            }
        }
    }
}
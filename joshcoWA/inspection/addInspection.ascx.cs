using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.inspection
{
    public partial class addInspection : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.lblRefNo.Text = this.ddlPropertyUnit.SelectedItem.Text;

            if (this.hfPropertyInspectionID.Value == "0" || this.hfPropertyInspectionID.Value == "")
            {
                this.sdsInspection.InsertParameters["PropertyUnitID"].DefaultValue = this.ddlPropertyUnit.SelectedValue;
                this.sdsInspection.InsertParameters["InspectionDate"].DefaultValue = this.rdpInspectionDate.Text;
                this.sdsInspection.InsertParameters["HoursSpent"].DefaultValue = this.txtHoursSpent.Text;
                this.sdsInspection.InsertParameters["ServiceProviderID"].DefaultValue = this.ddlServiceProvider.SelectedValue;
                this.sdsInspection.InsertParameters["Notes"].DefaultValue = this.txtNotes.Value;
                this.sdsInspection.InsertParameters["NextInspectionDate"].DefaultValue = this.rdpNextInspectionDate.Text;
                this.sdsInspection.InsertParameters["TotalInspectionCost"].DefaultValue = this.txtInspectionCost.Value;
                this.sdsInspection.InsertParameters["InspectionCostPaid"].DefaultValue = this.rblCostPaid.SelectedValue;
                this.sdsInspection.Insert();

                this.btnClos.PostBackUrl = "inspectionView.aspx";
                this.mpeLeaseAdd.Show();
            }
            else
            {
                this.sdsInspection.UpdateParameters["PropertyUnitID"].DefaultValue = this.ddlPropertyUnit.SelectedValue;
                this.sdsInspection.UpdateParameters["InspectionDate"].DefaultValue = this.rdpInspectionDate.Text;
                this.sdsInspection.UpdateParameters["HoursSpent"].DefaultValue = this.txtHoursSpent.Text;
                this.sdsInspection.UpdateParameters["ServiceProviderID"].DefaultValue = this.ddlServiceProvider.SelectedValue;
                this.sdsInspection.UpdateParameters["Notes"].DefaultValue = this.txtNotes.Value;
                this.sdsInspection.UpdateParameters["NextInspectionDate"].DefaultValue = this.rdpNextInspectionDate.Text;
                this.sdsInspection.UpdateParameters["TotalInspectionCost"].DefaultValue = this.txtInspectionCost.Value;
                this.sdsInspection.UpdateParameters["InspectionCostPaid"].DefaultValue = this.rblCostPaid.SelectedValue;
                this.sdsInspection.UpdateParameters["PropertyInspectionID"].DefaultValue = this.hfPropertyInspectionID.Value;
                this.sdsInspection.Update();

                this.btnClos.PostBackUrl = "inspectionView.aspx";
                this.mpeLeaseAdd.Show();
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
            Session["PropertyInspectionID"] = e.Command.Parameters["@PropertyInspectionID"].Value.ToString();
            this.hfPropertyInspectionID.Value = Session["PropertyInspectionID"].ToString();
        }

        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlPropertyUnit.Items.Clear();
            this.ddlPropertyUnit.DataBind();
        }
    }
}
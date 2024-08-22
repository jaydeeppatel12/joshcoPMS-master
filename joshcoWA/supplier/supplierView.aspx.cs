using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class supplierView : joshcoWA.BasePage
    {
        public int TotalPaidDeposit = 0, TotalPendingReview = 0, New = 0, Completed = 0, InProgress = 0, WorkOrder_ = 0, Inspection_ = 0, Maintenance_ = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tab10.CssClass = "Clicked";
                MainView.ActiveViewIndex = 6;
                FillProfile();
            }
        }
        
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                Session["FacilityManagementID"] = e.CommandArgument.ToString();
                Response.Redirect("../workorder/workorderView.aspx");
            }
        }

        decimal hfTotalCost = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                hfTotalCost += Convert.ToDecimal(((HiddenField)e.Row.FindControl("hfTotalCost")).Value);

                e.Row.Cells[3].BackColor = System.Drawing.Color.FromName(((HiddenField)e.Row.FindControl("hfBackColour")).Value);

                if (((HiddenField)e.Row.FindControl("hfStatus")).Value == "In Progress")
                {
                    e.Row.Cells[8].BackColor = Color.Yellow;
                    InProgress += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfStatus")).Value == "Completed")
                {
                    e.Row.Cells[8].BackColor = Color.GreenYellow;
                    Completed += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfStatus")).Value == "New")
                {
                    e.Row.Cells[8].BackColor = Color.White;
                    New += 1;
                }

                if (((HiddenField)e.Row.FindControl("hfCategory")).Value == "Work Order")
                {
                    WorkOrder_ += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfCategory")).Value == "Inspection")
                {
                    Inspection_ += 1;
                }
                if (((HiddenField)e.Row.FindControl("hfCategory")).Value == "Maintenance")
                {
                    Maintenance_ += 1;
                }

            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lblTotal");
                lbl.Text = hfTotalCost.ToString("C");
            }
        }

        public void CountUnits(string deposit, string review)
        {
            if (deposit == "Active") { TotalPaidDeposit += 1; }
            if (review == "Yes") { TotalPendingReview += 1; }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsServiceProviderProfile.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.lblCompanyName.Text = dt.Rows[0]["BusinessName"].ToString();
                int ServiceProviderID = Convert.ToInt16(Session["ServiceProviderID"].ToString());

                this.frmSupplier1.GetDetails(ServiceProviderID);
                this.frmSupplier2.GetDetails(ServiceProviderID);
                this.frmSupplier3.GetDetails(ServiceProviderID);
                this.frmSupplier4.GetDetails(ServiceProviderID);
                this.frmSupplier5.GetDetails(ServiceProviderID);
                this.frmSupplier6.GetDetails(ServiceProviderID);

                ((TextBox)this.frmSupplier6.FindControl("txtCaptcha")).Visible = false;
                ((ImageButton)this.frmSupplier6.FindControl("Refresh")).Visible = false;
                ((MSCaptcha.CaptchaControl)this.frmSupplier6.FindControl("Captcha1")).Visible = false;


                lblBusinessName.Text = dt.Rows[0]["BusinessName"].ToString();
                lblPhysicalAddress.Text = dt.Rows[0]["PhysicalAddress"].ToString();
                lblCity.Text = dt.Rows[0]["City"].ToString();
                lblPhysicalAddressCode.Text = dt.Rows[0]["PhysicalAddressCode"].ToString();
                this.lblProvince.Text = dt.Rows[0]["Province"].ToString();
                lblTelephone.Text = dt.Rows[0]["Telephone"].ToString();
                lblFax.Text = dt.Rows[0]["Fax"].ToString();
                lblEmail.Text = dt.Rows[0]["Email"].ToString();
                lblWebPageAddress.Text = dt.Rows[0]["WebPageAddress"].ToString();
                lblContactPersonTitle.Text = dt.Rows[0]["ContactPersonTitle"].ToString();
                lblContactPersonName.Text = dt.Rows[0]["ContactPersonName"].ToString();
                lblContactPersonSurname.Text = dt.Rows[0]["ContactPersonSurname"].ToString();

                if (dt.Rows[0]["StatusID"].ToString() != "")
                {

                    this.ddlSupplierPanel.SelectedValue = dt.Rows[0]["SupplierPanelID"].ToString();
                    this.ddlStatus.SelectedValue = dt.Rows[0]["StatusID"].ToString();
                    this.chkSupplierPanel_NA.Checked = bool.Parse(dt.Rows[0]["SupplierPanel_NA"].ToString() == "" ? "False" : dt.Rows[0]["SupplierPanel_NA"].ToString());
                    this.ddlServiceProviderCategory.SelectedValue = dt.Rows[0]["ServiceProviderCategoryID"].ToString(); ;
                }
                //this.lblServiceProviderEmail.Text = "Email: " + dt.Rows[0]["Email"].ToString();
                //this.lblCompanyName.Text = dt.Rows[0]["ServiceProviderName"].ToString();
                //this.lblSPName.Text = dt.Rows[0]["ServiceProviderName"].ToString();
                //this.lblServiceProviderTel.Text = "Tel: " + dt.Rows[0]["Telephone"].ToString();
                //this.lblFax.Text = "Fax: " + dt.Rows[0]["Fax"].ToString();

                //this.lblSPName.Text = dt.Rows[0]["ServiceProviderName"].ToString();
                //this.lblPhysicalAddress.Text = dt.Rows[0]["PhysicalAddress"].ToString();
                //this.lblPostalAddress.Text = dt.Rows[0]["PostalAddress"].ToString();
                //this.lblEntityType.Text = dt.Rows[0]["EntityType"].ToString();
                //this.lblRegistrationNumber.Text = dt.Rows[0]["RegistrationNumber"].ToString();

                //if (dt.Rows[0]["BEECertificate"].ToString() == "True") { this.lblBEECertificate.Text = "Yes"; } else { this.lblBEECertificate.Text = "No"; }

                //this.lblBEELevel.Text = dt.Rows[0]["BEELevel"].ToString();
                //this.lblBEEExpiringDate.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["BEEExpiringDate"]);
                //if (dt.Rows[0]["TaxClearance"].ToString() == "True") { this.lblTaxClearance.Text = "Yes"; } else { this.lblTaxClearance.Text = "No"; }

                //this.lblTaxClearanceExpiringDate.Text = string.Format("{0:dd MMM yyyy}", dt.Rows[0]["TaxClearanceExpiringDate"]);
                //this.lblVatRegisteredNumber.Text = dt.Rows[0]["VatRegisteredNumber"].ToString();
                //this.lblContactPersonName.Text = dt.Rows[0]["ContactPersonName"].ToString();

                //this.cblServiceProviderSector.DataBind();
                //foreach (ListItem li in this.cblServiceProviderSector.Items)
                //{
                //    if (dt.Rows[0]["ServiceProviderSectorID"].ToString().Contains("[" + li.Value + "]"))
                //    {
                //        li.Selected = true;
                //    }
                //}
            }
        }

        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Clicked";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 2;
        }

        protected void Tab4_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Clicked";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 3;
        }

        protected void Tab5_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Clicked";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 4;
        }

        protected void Tab6_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Clicked";
            Tab10.CssClass = "Initial";
            MainView.ActiveViewIndex = 5;
        }
        protected void Tab10_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Initial";
            Tab4.CssClass = "Initial";
            Tab5.CssClass = "Initial";
            Tab6.CssClass = "Initial";
            Tab10.CssClass = "Clicked";
            MainView.ActiveViewIndex = 6;
        }


        protected void lnkEditProfile_Click(object sender, EventArgs e)
        {

        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            this.sdsSupplierPanel.UpdateParameters["SupplierPanelID"].DefaultValue = this.ddlSupplierPanel.SelectedValue;
            this.sdsSupplierPanel.UpdateParameters["StatusID"].DefaultValue = this.ddlStatus.SelectedValue;
            this.sdsSupplierPanel.UpdateParameters["SupplierPanel_NA"].DefaultValue = this.chkSupplierPanel_NA.Checked.ToString();
            this.sdsSupplierPanel.UpdateParameters["ServiceProviderCategoryID"].DefaultValue = this.ddlServiceProviderCategory.SelectedValue;
            this.sdsSupplierPanel.UpdateParameters["ServiceProviderID"].DefaultValue = Session["ServiceProviderID"].ToString();
            this.sdsSupplierPanel.Update();

            showMessageBox("Updated successfully");
        }
    }
}
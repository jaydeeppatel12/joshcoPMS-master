using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class addServiceProvider : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string ServiceProviderSectorID = "";

            foreach (ListItem li in this.cblServiceProviderSector.Items)
            {
                if (li.Selected)
                {
                    ServiceProviderSectorID += "[" + li.Value + "],";
                }
            }


            this.sdsProvider.InsertParameters["ServiceProviderName"].DefaultValue = this.txtServiceProvider.Value;
            this.sdsProvider.InsertParameters["EntityTypeID"].DefaultValue = this.ddlEntityType.SelectedValue;
            this.sdsProvider.InsertParameters["RegistrationNumber"].DefaultValue = this.txtRegNumber.Value;
            this.sdsProvider.InsertParameters["Email"].DefaultValue = this.txtEmailAddress.Value;
            this.sdsProvider.InsertParameters["BEECertificate"].DefaultValue = this.rblBeeCertificate.SelectedValue;
            this.sdsProvider.InsertParameters["BEELevelID"].DefaultValue = this.ddlBeeLevel.SelectedValue;
            this.sdsProvider.InsertParameters["BEEExpiringDate"].DefaultValue = this.rdpBeeDate.Text;
            this.sdsProvider.InsertParameters["PhysicalAddress"].DefaultValue = this.txtPhysicalAddress.Value;
            this.sdsProvider.InsertParameters["PhysicalAddressCode"].DefaultValue = this.txtPhysicalAddressCode.Value;
            this.sdsProvider.InsertParameters["PostalAddress"].DefaultValue = this.txtPostalAddress.Value;
            this.sdsProvider.InsertParameters["PostalAddressCode"].DefaultValue = this.txtPostalAddressCode.Value;
            this.sdsProvider.InsertParameters["Telephone"].DefaultValue = this.txtTelephone.Value;
            this.sdsProvider.InsertParameters["Fax"].DefaultValue = this.txtFaxNumber.Value;
            this.sdsProvider.InsertParameters["ContactPersonName"].DefaultValue = this.txtContactPerson.Value;
            this.sdsProvider.InsertParameters["ServiceProviderSectorID"].DefaultValue = ServiceProviderSectorID;
            this.sdsProvider.InsertParameters["BankName"].DefaultValue = this.txtBankName.Value;
            this.sdsProvider.InsertParameters["BranchCode"].DefaultValue = this.txtBranchCode.Value;
            this.sdsProvider.InsertParameters["AccountNumber"].DefaultValue = this.txtAccountNo.Value;

            this.sdsProvider.Insert();
        }
        protected void sdsProvider_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["ServiceProviderID"] = e.Command.Parameters["@ServiceProviderID"].Value.ToString();
            Response.Redirect("ServiceProviderProfile.aspx");
        }
    }
}
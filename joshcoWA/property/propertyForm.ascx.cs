using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class propertyForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PropertyID"] != null)
                {
                    if (Session["PropertyID"].ToString() != "0")
                    {
                        this.hfPropertyID.Value = Session["PropertyID"].ToString();
                        FillProfile();
                    }
                }
                else
                {
                    ClearFields();
                }
            }
        }

        public void ClearFields()
        {
            this.txtPropertyName.Value = "";
            this.txtPhysicalAddress.Value = "";
            this.txtPhysicalAddressCode.Value = "";
            this.txtPostalAddress.Value = "";
            this.txtPostalAddressCode.Value = "";
            this.txtTelephone.Value = "";
            this.txtFaxNumber.Value = "";
            this.txtEmailAddress.Value = "";
            this.txtContactPerson.Value = "";
            this.txtLong.Value = "";
            this.txtLat.Value = "";
            this.txtArea.Value = "";
            this.txtErf.Value = "";
            this.txtPortion.Value = "";
            this.hfPropertyID.Value = "";
        }

        public void FillProfile()
        {
            try
            {
                sdsProperty.DataBind();

                DataView dv;
                dv = (DataView)sdsProperty.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count > 0)
                {
                    this.txtPropertyName.Value = dt.Rows[0]["PropertyName"].ToString();
                    this.txtPhysicalAddress.Value = dt.Rows[0]["Address"].ToString();
                    this.txtPhysicalAddressCode.Value = dt.Rows[0]["AddressCode"].ToString();
                    this.txtPostalAddress.Value = dt.Rows[0]["PostalAddress"].ToString();
                    this.txtPostalAddressCode.Value = dt.Rows[0]["PostalAddressCode"].ToString();
                    this.txtTelephone.Value = dt.Rows[0]["Telephone"].ToString();
                    this.txtFaxNumber.Value = dt.Rows[0]["Fax"].ToString();
                    this.txtEmailAddress.Value = dt.Rows[0]["EmailAddress"].ToString();
                    this.txtContactPerson.Value = dt.Rows[0]["ContactPerson"].ToString();
                    this.txtLong.Value = dt.Rows[0]["Long"].ToString();
                    this.txtLat.Value = dt.Rows[0]["Lat"].ToString();
                    this.txtArea.Value = dt.Rows[0]["PropertyArea"].ToString();
                    this.txtErf.Value = dt.Rows[0]["ErfNo"].ToString();
                    this.txtPortion.Value = dt.Rows[0]["PortionNo"].ToString();
                }
            }
            catch { }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (this.hfPropertyID.Value == "" || this.hfPropertyID.Value == "0")
            {

                this.sdsProperty.InsertParameters["PropertyName"].DefaultValue = this.txtPropertyName.Value;
                this.sdsProperty.InsertParameters["Address"].DefaultValue = this.txtPhysicalAddress.Value;
                this.sdsProperty.InsertParameters["AddressCode"].DefaultValue = this.txtPhysicalAddressCode.Value;
                this.sdsProperty.InsertParameters["PostalAddress"].DefaultValue = this.txtPostalAddress.Value;
                this.sdsProperty.InsertParameters["PostalAddressCode"].DefaultValue = this.txtPostalAddressCode.Value;
                this.sdsProperty.InsertParameters["Telephone"].DefaultValue = this.txtTelephone.Value;
                this.sdsProperty.InsertParameters["Fax"].DefaultValue = this.txtFaxNumber.Value;
                this.sdsProperty.InsertParameters["EmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsProperty.InsertParameters["ContactPerson"].DefaultValue = this.txtContactPerson.Value;
                this.sdsProperty.InsertParameters["Long"].DefaultValue = this.txtLong.Value;
                this.sdsProperty.InsertParameters["Lat"].DefaultValue = this.txtLat.Value;
                this.sdsProperty.InsertParameters["PropertyArea"].DefaultValue = this.txtArea.Value;
                this.sdsProperty.InsertParameters["ErfNo"].DefaultValue = this.txtErf.Value;
                this.sdsProperty.InsertParameters["PortionNo"].DefaultValue = this.txtPortion.Value;
                this.sdsProperty.Insert();
            }
            else
            {
                this.sdsProperty.UpdateParameters["PropertyName"].DefaultValue = this.txtPropertyName.Value;
                this.sdsProperty.UpdateParameters["Address"].DefaultValue = this.txtPhysicalAddress.Value;
                this.sdsProperty.UpdateParameters["AddressCode"].DefaultValue = this.txtPhysicalAddressCode.Value;
                this.sdsProperty.UpdateParameters["PostalAddress"].DefaultValue = this.txtPostalAddress.Value;
                this.sdsProperty.UpdateParameters["PostalAddressCode"].DefaultValue = this.txtPostalAddressCode.Value;
                this.sdsProperty.UpdateParameters["Telephone"].DefaultValue = this.txtTelephone.Value;
                this.sdsProperty.UpdateParameters["Fax"].DefaultValue = this.txtFaxNumber.Value;
                this.sdsProperty.UpdateParameters["EmailAddress"].DefaultValue = this.txtEmailAddress.Value;
                this.sdsProperty.UpdateParameters["ContactPerson"].DefaultValue = this.txtContactPerson.Value;
                this.sdsProperty.UpdateParameters["Long"].DefaultValue = this.txtLong.Value;
                this.sdsProperty.UpdateParameters["Lat"].DefaultValue = this.txtLat.Value;
                this.sdsProperty.UpdateParameters["PropertyArea"].DefaultValue = this.txtArea.Value;
                this.sdsProperty.UpdateParameters["PropertyID"].DefaultValue = this.hfPropertyID.Value;
                this.sdsProperty.UpdateParameters["ErfNo"].DefaultValue = this.txtErf.Value;
                this.sdsProperty.UpdateParameters["PortionNo"].DefaultValue = this.txtPortion.Value;

                this.sdsProperty.Update();
                showMessageBox("Updated successfully");
                Response.Redirect("PropertyProfile.aspx");
            }
        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
        protected void sdsProperty_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["PropertyID"] = e.Command.Parameters["@PropertyID"].Value.ToString();
            Response.Redirect("propertyProfile.aspx?a=a");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.quotation
{
    public partial class addQuotation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                long ticks = DateTime.Now.Ticks;
                byte[] bytes = BitConverter.GetBytes(ticks);
                string id = "QT"+Convert.ToBase64String(bytes).Replace('+', '_').Replace('/', '-').TrimEnd('=');

                this.lblReferenceNo.Text = id;
            }
        }
        protected void rblMeeting_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblMeeting.SelectedValue == "true")
            {
                this.lblMeeting1.Visible = true;
                this.lblMeeting2.Visible = true;
                this.txtMeetingVenue.Visible = true;
                this.rdpMeetingDate.Visible = true;
            }
            else
            {
                this.lblMeeting1.Visible = false;
                this.lblMeeting2.Visible = false;
                this.txtMeetingVenue.Visible = false;
                this.rdpMeetingDate.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.sdsQuotation.InsertParameters["QuoteTitle"].DefaultValue = this.txtQuoteTitle.Value;
            this.sdsQuotation.InsertParameters["WorkDescription"].DefaultValue = this.txtWorkDescription.Value;
            this.sdsQuotation.InsertParameters["QueryID"].DefaultValue = this.lblQueryID.Text;
            this.sdsQuotation.InsertParameters["PropertyID"].DefaultValue = this.ddlProperty.SelectedValue;
            this.sdsQuotation.InsertParameters["DueDate"].DefaultValue = this.rdpDueDate.Text;
            this.sdsQuotation.InsertParameters["MeetingRequired"].DefaultValue = this.rblMeeting.SelectedValue;
            this.sdsQuotation.InsertParameters["MeetingDate"].DefaultValue = this.rdpMeetingDate.SelectedDate.ToString();
            this.sdsQuotation.InsertParameters["MeetingVenue"].DefaultValue = this.txtMeetingVenue.Value;
            this.sdsQuotation.InsertParameters["ContactPerson"].DefaultValue = this.txtContactPerson.Value;
            this.sdsQuotation.InsertParameters["ContactEmail"].DefaultValue = this.txtContactEmail.Value;
            this.sdsQuotation.InsertParameters["ReferenceNumber"].DefaultValue = this.lblReferenceNo.Text;
            this.sdsQuotation.InsertParameters["ContactTelephone"].DefaultValue = this.txtTelephone.Value;

            this.sdsQuotation.Insert();
        }

        protected void sdsQuotation_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Session["InvitationToQuoteID"] = e.Command.Parameters["@InvitationToQuoteID"].Value.ToString();
            if (this.lblQueryID.Text != "0")
            {
                Response.Redirect("../query/queryView.aspx?ID=" + this.lblQueryID.Text);
            }
            else { Response.Redirect("quotationView.aspx"); }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class appSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.sdsRequiredDocuments.InsertParameters["DocumentCategory"].DefaultValue = this.txtCategory.Value;
            this.sdsRequiredDocuments.InsertParameters["DocumentEntityTypeID"].DefaultValue = "1";
            this.sdsRequiredDocuments.InsertParameters["DocumentCategoryID"].DefaultValue = this.hfDocumentCategoryID.Value;
            this.sdsRequiredDocuments.Insert();
            this.hfDocumentCategoryID.Value = "0";
            this.txtCategory.Value = "";
            this.gvRequiredDocument.DataBind();
        }

        protected void gvRequiredDocument_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editRecord")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);
                this.txtCategory.Value = row.Cells[0].Text;

                this.hfDocumentCategoryID.Value = e.CommandArgument.ToString();
            }
        }
    }
}
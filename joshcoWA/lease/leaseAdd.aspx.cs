using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.lease
{
    public partial class leaseAdd1 : joshcoWA.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
 
                FillProfile();
            }
        }

        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsApp.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                ((Label)leaseAdd.FindControl("lblPropertyName")).Text = dt.Rows[0]["PropertyName"].ToString();
                ((HiddenField)leaseAdd.FindControl("hfPropertyID")).Value = dt.Rows[0]["PropertyID"].ToString();
                ((HiddenField)leaseAdd.FindControl("hfApplicationID")).Value = dt.Rows[0]["ApplicationID"].ToString();

                ((HiddenField)leaseAdd.FindControl("hfName")).Value = dt.Rows[0]["FullName"].ToString();
                ((HiddenField)leaseAdd.FindControl("hfEmail")).Value = dt.Rows[0]["EmailAddress"].ToString();
                ((HiddenField)leaseAdd.FindControl("hfIDNumber")).Value = dt.Rows[0]["IdentityNumber"].ToString();
                ((SqlDataSource)leaseAdd.FindControl("sdsPropertyUnit")).DataBind();
                ((DropDownList)leaseAdd.FindControl("ddlPropertyUnit")).DataBind();
            }
        }
    }
}
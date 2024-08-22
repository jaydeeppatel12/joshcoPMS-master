using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.tenant
{
    public partial class tenantNoticeView1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NoticeID"] != null)
                {
                    FillProfile();
                }
            }
        }



        public void FillProfile()
        {
            DataView dv;
            dv = (DataView)this.sdsNotice.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.ltNoticeTitle.Text = dt.Rows[0]["NoticeTitle"].ToString();
                this.ltNoticeDescription.Text = dt.Rows[0]["Notice"].ToString();
                
               //Get User Details
               clNoticeView  obj = new clNoticeView();
               DataTable dtUsers = obj.GetUserDetails(dt.Rows[0]["AddedBy"].ToString());
               this.AddedBy.Text = dtUsers.Rows[0]["UserFirstName"].ToString() + ' ' + dtUsers.Rows[0]["UserSurname"].ToString();
            }
        }
    }
}
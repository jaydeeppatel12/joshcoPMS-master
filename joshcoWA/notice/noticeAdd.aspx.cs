using Facebook;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.notice
{
    public partial class noticeAdd : joshcoWA.BasePage
    {
        public DataTable dtPropertyList = new DataTable();
        public DataColumn dtC1 = new DataColumn();
        public DataColumn dtC2 = new DataColumn();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NoticeID"] != null)
                {
                    FillProfile();
                    this.gvProperty.DataSourceID = "sdsPropertyNotice";
                    this.gvProperty.DataBind();
                }
                else
                {
                    dtC1.DataType = Type.GetType("System.String");
                    dtC1.ColumnName = "PropertyName";
                    dtPropertyList.Columns.Add(dtC1);

                    dtC2.DataType = Type.GetType("System.String");
                    dtC2.ColumnName = "PropertyID";
                    dtPropertyList.Columns.Add(dtC2);

                    ViewState["tblPropertyList"] = dtPropertyList;
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
                this.txtNotice.Text = dt.Rows[0]["NoticeTitle"].ToString();
                this.RadEditor1.Content = dt.Rows[0]["Notice"].ToString();
                this.rblFacebook.SelectedValue = dt.Rows[0]["PostOnFacebook"].ToString();
                this.rblTwitter.SelectedValue = dt.Rows[0]["PostOnTwitter"].ToString();
                this.rblWebsite.SelectedValue = dt.Rows[0]["PostOnWebSite"].ToString();

            }
        }

        protected void btnSave0_Click(object sender, EventArgs e)
        {
            if (this.ddlProperty.SelectedValue == "0")
            {
                showMessageBox("Please select property");
                return;
            }

            if (Session["NoticeID"] == null)
            {
                if (ViewState["tblPropertyList"] != null)
                {
                    DataTable dtCurrentTable = (DataTable)ViewState["tblPropertyList"];

                    DataRow dr = dtCurrentTable.NewRow();
                    dr["PropertyName"] = this.ddlProperty.SelectedItem.Text;
                    dr["PropertyID"] = this.ddlProperty.SelectedValue;
                    dtCurrentTable.Rows.Add(dr);

                    this.gvProperty.DataSource = dtCurrentTable;
                    this.gvProperty.DataBind();
                }
            }
            else
            {
                this.sdsProperty.InsertParameters["PropertyID"].DefaultValue = this.ddlProperty.SelectedValue;
                this.sdsProperty.InsertParameters["NoticeID"].DefaultValue = Session["NoticeID"].ToString();
                this.sdsProperty.Insert();

                this.gvProperty.DataBind();
            }
        }


        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void ExportToImage(object sender, EventArgs e)
        {

            string imagename = "Notice_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";

            string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);
            MemoryStream storeStream = new MemoryStream();
            MemoryStream ms = new MemoryStream(bytes);
            //write to file  
            FileStream file = new FileStream(Server.MapPath("~/joshco/notice/post_notice/") + imagename, FileMode.Create,
            FileAccess.Write);
            ms.WriteTo(file);
            file.Close();
            ms.Close();



            string Picture_Path = Server.MapPath("~/joshco/notice/post_notice/" + imagename);

            var objFacebookClient = new FacebookClient("EAAd59bZCbPFwBAIhbsZAvDfkM8bkroTTEDTo6rJ0HFHvweOmLVTKHlHzUZBlgVXbMMig5TDxzJGM6YQz2KDuEYxZCj7VYRoxZBM7rppYxZBvZBAUhFuFnkEtUd1yjAxY6WxN3jseo8ZALvIkGT5FAosy29ZBZAhMNEWn0anrebLntTGjrJIdpI4pkMZB5lwBzVsZCfoZD");
            var parameters = new Dictionary<string, object>();
            parameters["caption"] = "Joshco Public Notice";
            parameters["name"] = "Joshco: " + this.txtNotice.Text;
            parameters["link"] = "http://www.quickpropsys.com/joshco/images/joshco.jpg";
            parameters["message"] = "Joshco: " + this.txtNotice.Text;
            //parameters["picture"] = "http://www.quickpropsys.com/joshco/images/joshco.jpg";
            parameters["source"] = new FacebookMediaObject
            {
                ContentType = "image/jpeg",
                FileName = Path.GetFileName(Picture_Path)
            }.SetValue(File.ReadAllBytes(Picture_Path));

            parameters["scope"] = "read_stream, user_photo_video_tags, user_photos, friends_photos, pages_read_engagement, pages_manage_posts";
            //objFacebookClient.Post("/100359866044666/feed", parameters).ToString();
            objFacebookClient.Post("/100359866044666/photos", parameters).ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (this.rblFacebook.SelectedValue == "1" || this.rblFacebook.SelectedValue == "True")
            {
                this.lblTitle.Text = this.txtNotice.Text;
                this.ltEvent.Text = this.RadEditor1.Content;
                //this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", this.dpStartDate.SelectedDate);
                //this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", this.dpEndDate.SelectedDate);

                this.mpeFB.Show();
            }

            if (this.hfNoticeID.Value == "0" || this.hfNoticeID.Value == "")
            {
                this.sdsNotice.InsertParameters["NoticeTitle"].DefaultValue = this.txtNotice.Text;
                this.sdsNotice.InsertParameters["PostOnTwitter"].DefaultValue = this.rblTwitter.SelectedValue;
                this.sdsNotice.InsertParameters["PostOnFacebook"].DefaultValue = this.rblFacebook.SelectedValue;
                this.sdsNotice.InsertParameters["PostOnWebSite"].DefaultValue = this.rblWebsite.SelectedValue;
                this.sdsNotice.InsertParameters["Notice"].DefaultValue = this.RadEditor1.Content;
                this.sdsNotice.InsertParameters["AddedBy"].DefaultValue = Session["UserID"].ToString();
                this.sdsNotice.Insert();

                showMessageBox("Added successfully");
            }
            else
            {
                this.sdsNotice.UpdateParameters["NoticeTitle"].DefaultValue = this.txtNotice.Text;
                this.sdsNotice.UpdateParameters["PostOnTwitter"].DefaultValue = this.rblTwitter.SelectedValue;
                this.sdsNotice.UpdateParameters["PostOnFacebook"].DefaultValue = this.rblFacebook.SelectedValue;
                this.sdsNotice.InsertParameters["PostOnWebSite"].DefaultValue = this.rblWebsite.SelectedValue;
                this.sdsNotice.UpdateParameters["Notice"].DefaultValue = this.RadEditor1.Content;
                this.sdsNotice.UpdateParameters["AddedBy"].DefaultValue = Session["UserID"].ToString();
                this.sdsNotice.Update();

                showMessageBox("Updated successfully");
            }
        }

        protected void sdsNotice_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            this.hfNoticeID.Value = e.Command.Parameters["@NoticeID"].Value.ToString();

            if (this.gvProperty.Rows.Count > 0)
            {
                foreach (GridViewRow row in this.gvProperty.Rows)
                {
                    if (row.Visible == true)
                    {
                        this.sdsProperty.InsertParameters["PropertyID"].DefaultValue = ((HiddenField)row.FindControl("hfPropertyID")).Value;
                        this.sdsProperty.InsertParameters["NoticeID"].DefaultValue = this.hfNoticeID.Value;
                        this.sdsProperty.Insert();
                    }
                }
            }
        }

        protected void gvProperty_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                if (Session["NoticeID"] == null)
                {
                    ImageButton imb = (ImageButton)e.CommandSource;
                    GridViewRow row = (GridViewRow)(imb.NamingContainer);
                    row.Visible = false;
                }
                else
                {
                    this.sdsProperty.DeleteParameters["NoticeID"].DefaultValue = Session["NoticeID"].ToString();
                    this.sdsProperty.DeleteParameters["PropertyID"].DefaultValue = e.CommandArgument.ToString();
                    this.sdsProperty.Delete();

                    this.gvProperty.DataBind();
                }
            }
        }
    }
}
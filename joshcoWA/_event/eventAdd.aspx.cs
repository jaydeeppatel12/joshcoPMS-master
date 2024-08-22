using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

using Facebook;
using System.Collections.Specialized;
using System.Text;
using System.Dynamic;
using Newtonsoft.Json;
using System.Security.Cryptography;

namespace joshcoWA._event
{
    public partial class eventAdd : joshcoWA.BasePage
    {
        public DataTable dtPropertyList = new DataTable();
        public DataColumn dtC1 = new DataColumn();
        public DataColumn dtC2 = new DataColumn();
        //string bodymessage = "This is test message description new";
 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["EventID"] != null)
                {
                    FillProfile();
                    this.gvProperty.DataSourceID = "sdsPropertyEvent";
                    this.gvProperty.DataBind();
                }
                else
                {
                    hlnkBack.NavigateUrl = "eventList.aspx";

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
            dv = (DataView)this.sdsEvent.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.hfEventID.Value = dt.Rows[0]["EventID"].ToString();
                this.txtEvent.Text = dt.Rows[0]["EventTitle"].ToString();
                this.RadEditor1.Content = dt.Rows[0]["Event"].ToString();
                this.rblFacebook.SelectedValue = dt.Rows[0]["PostOnFacebook"].ToString();
                this.rblTwitter.SelectedValue = dt.Rows[0]["PostOnTwitter"].ToString();
                this.rblWebsite.SelectedValue = dt.Rows[0]["PostOnWebSite"].ToString();
                this.dpStartDate.SelectedDate = Convert.ToDateTime(dt.Rows[0]["Start"].ToString());
                this.dpEndDate.SelectedDate = Convert.ToDateTime(dt.Rows[0]["End"].ToString());
            }
        }

        protected void btnSave0_Click(object sender, EventArgs e)
        {
            if (this.ddlProperty.SelectedValue == "0")
            {
                showMessageBox("Please select property");
                return;
            }

            if (Session["EventID"] == null)
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
                this.sdsProperty.InsertParameters["EventID"].DefaultValue = Session["EventID"].ToString();
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
        public class AccessTokenModel
        {
            public string Access_Token { get; set; }
        }
        protected void ExportToImage(object sender, EventArgs e)
        {
  
           string imagename = "Event_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";

            string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);
            MemoryStream storeStream = new MemoryStream();
            MemoryStream ms = new MemoryStream(bytes);
            //write to file  
            FileStream file = new FileStream(Server.MapPath("~/joshco/_event/post_event/") + imagename, FileMode.Create,
            FileAccess.Write);
            ms.WriteTo(file);
            file.Close();
            ms.Close();



            string Picture_Path =  Server.MapPath("~/joshco/_event/post_event/" + imagename)  ;

            var objFacebookClient = new FacebookClient("EAAd59bZCbPFwBAIhbsZAvDfkM8bkroTTEDTo6rJ0HFHvweOmLVTKHlHzUZBlgVXbMMig5TDxzJGM6YQz2KDuEYxZCj7VYRoxZBM7rppYxZBvZBAUhFuFnkEtUd1yjAxY6WxN3jseo8ZALvIkGT5FAosy29ZBZAhMNEWn0anrebLntTGjrJIdpI4pkMZB5lwBzVsZCfoZD");
            var parameters = new Dictionary<string, object>();
            parameters["caption"] = "Joshco Public Event";
            parameters["name"] = "Joshco: "+ this.txtEvent.Text;
            parameters["link"] = "http://www.quickpropsys.com/joshco/images/joshco.jpg";
            parameters["message"] = "Joshco: " + this.txtEvent.Text;
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
                     this.lblTitle.Text = this.txtEvent.Text;
                    this.ltEvent.Text = this.RadEditor1.Content;
                    this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", this.dpStartDate.SelectedDate);
                    this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", this.dpEndDate.SelectedDate);

                this.mpeFB.Show();
            }

            if (this.rblTwitter.SelectedValue == "1" || this.rblTwitter.SelectedValue == "True")
            {
                PostMessageToTwitter(this.txtEvent.Text + " - Start Date: " + this.dpStartDate.SelectedDate.Value.ToString() + ", End Date: " + this.dpEndDate.SelectedDate.Value.ToString() + ". " + this.RadEditor1.Content);
            }


            if (this.hfEventID.Value == "0" || this.hfEventID.Value == "")
            {
                this.sdsEvent.InsertParameters["EventTitle"].DefaultValue = this.txtEvent.Text;
                this.sdsEvent.InsertParameters["PostOnTwitter"].DefaultValue = this.rblTwitter.SelectedValue;
                this.sdsEvent.InsertParameters["PostOnFacebook"].DefaultValue = this.rblFacebook.SelectedValue;
                this.sdsEvent.InsertParameters["PostOnWebSite"].DefaultValue = this.rblWebsite.SelectedValue;
                this.sdsEvent.InsertParameters["Event"].DefaultValue = this.RadEditor1.Content;
                this.sdsEvent.InsertParameters["StartDate"].DefaultValue = this.dpStartDate.SelectedDate.Value.ToString();
                this.sdsEvent.InsertParameters["EndDate"].DefaultValue = this.dpEndDate.SelectedDate.Value.ToString();
                this.sdsEvent.InsertParameters["AddedBy"].DefaultValue = Session["UserID"].ToString();
                this.sdsEvent.Insert();

                showMessageBox("Added successfully");
            }
            else
            {
                this.sdsEvent.UpdateParameters["EventTitle"].DefaultValue = this.txtEvent.Text;
                this.sdsEvent.UpdateParameters["PostOnTwitter"].DefaultValue = this.rblTwitter.SelectedValue;
                this.sdsEvent.UpdateParameters["PostOnFacebook"].DefaultValue = this.rblFacebook.SelectedValue;
                this.sdsEvent.UpdateParameters["PostOnWebSite"].DefaultValue = this.rblWebsite.SelectedValue;
                this.sdsEvent.UpdateParameters["Event"].DefaultValue = this.RadEditor1.Content;
                this.sdsEvent.UpdateParameters["StartDate"].DefaultValue = this.dpStartDate.SelectedDate.Value.ToString();
                this.sdsEvent.UpdateParameters["EndDate"].DefaultValue = this.dpEndDate.SelectedDate.Value.ToString();
                this.sdsEvent.UpdateParameters["AddedBy"].DefaultValue = Session["UserID"].ToString();
                this.sdsEvent.UpdateParameters["EventID"].DefaultValue = this.hfEventID.Value;
                this.sdsEvent.Update();

                showMessageBox("Updated successfully");
            }
        }

        protected void sdsEvent_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            this.hfEventID.Value = e.Command.Parameters["@EventID"].Value.ToString();

            if (this.gvProperty.Rows.Count > 0)
            {
                foreach (GridViewRow row in this.gvProperty.Rows)
                {
                    if (row.Visible == true)
                    {
                        this.sdsProperty.InsertParameters["PropertyID"].DefaultValue = ((HiddenField)row.FindControl("hfPropertyID")).Value;
                        this.sdsProperty.InsertParameters["EventID"].DefaultValue = this.hfEventID.Value;
                        this.sdsProperty.Insert();
                    }
                }
            }
        }

        protected void gvProperty_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                if (Session["EventID"] == null)
                {
                    ImageButton imb = (ImageButton)e.CommandSource;
                    GridViewRow row = (GridViewRow)(imb.NamingContainer);
                    row.Visible = false;
                }
                else
                {
                    this.sdsProperty.DeleteParameters["EventID"].DefaultValue = Session["EventID"].ToString();
                    this.sdsProperty.DeleteParameters["PropertyID"].DefaultValue = e.CommandArgument.ToString();
                    this.sdsProperty.Delete();

                    this.gvProperty.DataBind();
                }
            }
        }

        private static void PostMessageToTwitter(string message)
        {
            //The facebook json url to update the status
            string twitterURL = "https://api.twitter.com/1.1/statuses/update.json";

            //set the access tokens (REQUIRED)
            string oauth_consumer_key = "XvNJFFu2e2TkGKjBg2I4TV0Rf";
            string oauth_consumer_secret = "eBS3LhceZ0zZhErCLnWHqN89xfkvGJ2h027ApHqllnGVX1AkTS";
            string oauth_token = "1533730468822237184-d2ukbtVuJwqhPXPgJXxjBqCHPpH6AT";
            string oauth_token_secret = "jirCTg5r2Hz0I6WdtmZGpG9vqRfR9G9A3ylxur94SodPr";

            // set the oauth version and signature method
            string oauth_version = "1.0";
            string oauth_signature_method = "HMAC-SHA1";

            // create unique request details
            string oauth_nonce = Convert.ToBase64String(new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
            System.TimeSpan timeSpan = (DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc));
            string oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();

            // create oauth signature
            string baseFormat = "oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" + "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&status={6}";

            string baseString = string.Format(
                baseFormat,
                oauth_consumer_key,
                oauth_nonce,
                oauth_signature_method,
                oauth_timestamp, oauth_token,
                oauth_version,
                Uri.EscapeDataString(message)
            );

            string oauth_signature = null;
            using (HMACSHA1 hasher = new HMACSHA1(ASCIIEncoding.ASCII.GetBytes(Uri.EscapeDataString(oauth_consumer_secret) + "&" + Uri.EscapeDataString(oauth_token_secret))))
            {
                oauth_signature = Convert.ToBase64String(hasher.ComputeHash(ASCIIEncoding.ASCII.GetBytes("POST&" + Uri.EscapeDataString(twitterURL) + "&" + Uri.EscapeDataString(baseString))));
            }

            // create the request header
            string authorizationFormat = "OAuth oauth_consumer_key=\"{0}\", oauth_nonce=\"{1}\", " + "oauth_signature=\"{2}\", oauth_signature_method=\"{3}\", " + "oauth_timestamp=\"{4}\", oauth_token=\"{5}\", " + "oauth_version=\"{6}\"";

            string authorizationHeader = string.Format(
                authorizationFormat,
                Uri.EscapeDataString(oauth_consumer_key),
                Uri.EscapeDataString(oauth_nonce),
                Uri.EscapeDataString(oauth_signature),
                Uri.EscapeDataString(oauth_signature_method),
                Uri.EscapeDataString(oauth_timestamp),
                Uri.EscapeDataString(oauth_token),
                Uri.EscapeDataString(oauth_version)
            );

            HttpWebRequest objHttpWebRequest = (HttpWebRequest)WebRequest.Create(twitterURL);
            objHttpWebRequest.Headers.Add("Authorization", authorizationHeader);
            objHttpWebRequest.Method = "POST";
            objHttpWebRequest.ContentType = "application/x-www-form-urlencoded";
            using (Stream objStream = objHttpWebRequest.GetRequestStream())
            {
                byte[] content = ASCIIEncoding.ASCII.GetBytes("status=" + Uri.EscapeDataString(message));
                objStream.Write(content, 0, content.Length);
            }

            var responseResult = "";
            try
            {
                //success posting
                WebResponse objWebResponse = objHttpWebRequest.GetResponse();
                StreamReader objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
                responseResult = objStreamReader.ReadToEnd().ToString();
            }
            catch (Exception ex)
            {
                //throw exception error
                responseResult = "Twitter Post Error: " + ex.Message.ToString() + ", authHeader: " + authorizationHeader;
            }
        }
    }
}
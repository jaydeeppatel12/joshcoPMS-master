using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA._event
{
    public partial class PostEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataView dv;
                dv = (DataView)this.sdsEvent.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count > 0)
                {
                    this.lblTitle.Text = dt.Rows[0]["EventTitle"].ToString();
                    this.ltEvent.Text = dt.Rows[0]["Event"].ToString();
                    this.lblStart.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(dt.Rows[0]["Start"].ToString() ));
                    this.lblEnd.Text = String.Format("{0: dd-MMM-yyyy @ HH:MM tt}", Convert.ToDateTime(dt.Rows[0]["End"].ToString()));

         
                }
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
            string imagename = "Event_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";

            string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);
            //Response.Clear();
            //Response.ContentType = "image/jpg";
            //Response.AddHeader("Content-Disposition", "attachment; filename=PostEvent.jpg");
            //Response.Buffer = true;
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.BinaryWrite(bytes);
            MemoryStream storeStream = new MemoryStream();
            MemoryStream ms = new MemoryStream(bytes);
            //write to file  
            FileStream file = new FileStream(Server.MapPath("~/_event/post_event/") + imagename, FileMode.Create,
            FileAccess.Write);
            ms.WriteTo(file);
            file.Close();
            ms.Close();
            //Response.End();


            showMessageBox("Testing");
        }  
    }
}
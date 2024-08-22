using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using joshcoWA.property;

namespace joshcoWA
{
    public partial class PropProfilePic : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void UploadFile(object sender, EventArgs e)
        {
            string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

            if (extension.Equals(".jpg", StringComparison.OrdinalIgnoreCase) || extension.Equals(".jpeg", StringComparison.OrdinalIgnoreCase))
            {

                string folderPath = Server.MapPath("~/propertypic/");
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists Create it.
                    Directory.CreateDirectory(folderPath);
                }

                string guidResult = System.Guid.NewGuid().ToString("N");
                string fileName = guidResult + extension;
                //string imageName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string fullPath = Path.Combine(Server.MapPath("~/propertypic/"), fileName);
                FileUpload1.PostedFile.SaveAs(fullPath);

                //Save Image details
                csProperty prop = new csProperty();
                prop.SavePropertyImageDetails(this.hfPropertyID.Value, fileName);
                
                //Display the Picture in Image control.
                //Image1.ImageUrl = "~/propertypic/" + fileName;
              
                Response.Redirect("PropertyProfile.aspx");

               // showMessageBox("image saved successfully");
            }
            else
            {
                showMessageBox("Please upload .jpg image");
            }
        }
        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
    }
}
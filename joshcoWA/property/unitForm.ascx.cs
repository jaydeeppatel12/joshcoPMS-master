using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA
{
    public partial class unitForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PropertyUnitID"] != null)
                {
                    this.hfPropertyUnitID.Value = Session["PropertyUnitID"].ToString();
                    FillProfile();
                    BindImageRepeater(this.hfPropertyUnitID.Value);
                }
                else
                {
                    ClearFields();
                }
            }
        }

        public void BindImageRepeater(string UnitID)
        {
            DirectoryInfo dir = new DirectoryInfo(MapPath("../propertunitypic/" + UnitID + "/"));
            FileInfo[] files;

            if (dir.Exists)
            {
                files = dir.GetFiles("*");//.jpg"
            }
            else { files = null; }

            DataTable dt = new DataTable();
            dt.Columns.Add("ImageName");
            dt.Columns.Add("Size");
            dt.Columns.Add("PropertyUnitID");
            dt.Clear();
            if (files != null)
            {
                foreach (FileInfo info in files)
                {
                    string[] sizes = { "B", "KB", "MB", "GB", "TB" };
                    double len = 0;

                    len = new FileInfo(info.FullName).Length;

                    int order = 0;
                    while (len >= 1024 && order < sizes.Length - 1)
                    {
                        order++;
                        len = len / 1024;
                    }
                    DataRow dr = dt.NewRow();

                    DirectoryInfo dir_info = new DirectoryInfo(info.Directory.ToString());

                    dr["ImageName"] = info.Name;
                    dr["Size"] = String.Format("{0:0.##} {1}", len, sizes[order]);
                    dr["PropertyUnitID"] = UnitID; //dir_info.Name == "plans" ? "" : dir_info.Name;

                    dt.Rows.Add(dr);
                }
            }

            this.dlImages.DataSource = dt;
            this.dlImages.DataBind();
        }

        public void ClearFields()
        {
            this.txtUnitName.Value = "";          
            this.txtArea.Value = "";
            this.txtRate.Value = "";
            this.txtEscalation.Value = "";
            this.hfPropertyUnitID.Value = "";
        }

        public void FillProfile()
        {
            sdsPropertyUnit.DataBind();

            DataView dv;
            dv = (DataView)sdsPropertyUnit.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count > 0)
            {
                this.txtUnitName.Value = dt.Rows[0]["PropertyUnit"].ToString();
                this.txtArea.Value = dt.Rows[0]["UnitArea"].ToString();
                this.txtRate.Value = dt.Rows[0]["EstRatePerSQM"].ToString();
                this.txtEscalation.Value = dt.Rows[0]["EstEscalation"].ToString();
                this.hfPropertyUnitID.Value = dt.Rows[0]["PropertyUnitID"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (this.hfPropertyUnitID.Value == "" || this.hfPropertyUnitID.Value == "0")
            {

                this.sdsPropertyUnit.InsertParameters["PropertyUnit"].DefaultValue = this.txtUnitName.Value;
                this.sdsPropertyUnit.InsertParameters["UnitArea"].DefaultValue = this.txtArea.Value;
                this.sdsPropertyUnit.InsertParameters["EstRatePerSQM"].DefaultValue = this.txtRate.Value;
                this.sdsPropertyUnit.InsertParameters["EstEscalation"].DefaultValue = this.txtEscalation.Value;
                this.sdsPropertyUnit.InsertParameters["PropertyID"].DefaultValue = Session["PropertyID"].ToString();
                this.sdsPropertyUnit.Insert();
                showMessageBox("Added successfully, Upload unit images.");
            }
            else
            {
                this.sdsPropertyUnit.UpdateParameters["PropertyUnit"].DefaultValue = this.txtUnitName.Value;
                this.sdsPropertyUnit.UpdateParameters["UnitArea"].DefaultValue = this.txtArea.Value;
                this.sdsPropertyUnit.UpdateParameters["EstRatePerSQM"].DefaultValue = this.txtRate.Value;
                this.sdsPropertyUnit.UpdateParameters["EstEscalation"].DefaultValue = this.txtEscalation.Value;
                this.sdsPropertyUnit.UpdateParameters["PropertyUnitID"].DefaultValue = this.hfPropertyUnitID.Value;

                this.sdsPropertyUnit.Update();
                showMessageBox("Updated successfully, Upload unit images.");
            }
            this.Panel2.Visible = true;
            this.Panel1.Visible = false;


            DataList parentPanel = this.Parent.FindControl("dlUnits") as DataList;
            parentPanel.DataBind();

            AjaxControlToolkit.ModalPopupExtender popUp = this.Parent.FindControl("mpeLeaseAdd") as AjaxControlToolkit.ModalPopupExtender;
            popUp.Show();

        }

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void UploadFile(object sender, EventArgs e)
        {
            if (this.hfPropertyUnitID.Value != "" || this.hfPropertyUnitID.Value != "0")
            {
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

               // if (extension == ".jpg" || ".png")
                {

                    string folderPath = Server.MapPath("../propertunitypic/"+this.hfPropertyUnitID.Value+"/");

                    //Check whether Directory (Folder) exists.
                    if (!Directory.Exists(folderPath))
                    {
                        //If Directory (Folder) does not exists Create it.
                        Directory.CreateDirectory(folderPath);
                    }

                    FileUpload1.SaveAs(folderPath + FileUpload1.FileName);

                    //Save the File to the Directory (Folder).
                    // FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

                    //Display the Picture in Image control.
                    //Image1.ImageUrl = "~/propertypic/" + Path.GetFileName(FileUpload1.FileName);
                    //Response.Redirect("PropertyProfile.aspx");
                }
                //else
                //{
                //    showMessageBox("Please upload .jpg image");
                //}
            }
            BindImageRepeater(this.hfPropertyUnitID.Value);

            DataList parentPanel = this.Parent.FindControl("dlUnits") as DataList;
            parentPanel.DataBind();

            AjaxControlToolkit.ModalPopupExtender popUp = this.Parent.FindControl("mpeLeaseAdd") as AjaxControlToolkit.ModalPopupExtender;
            popUp.Show();
        }

        protected void btnSave0_Click(object sender, EventArgs e)
        {
            this.Panel2.Visible = false;
            this.Panel1.Visible = true;
       
            AjaxControlToolkit.ModalPopupExtender popUp = this.Parent.FindControl("mpeLeaseAdd") as AjaxControlToolkit.ModalPopupExtender;
            popUp.Show();
        }

        protected void dlImages_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName=="RemoveImage")
            {
                File.Delete(Server.MapPath(e.CommandArgument.ToString()));
                e.Item.Visible = false;

                DataList parentPanel = this.Parent.FindControl("dlUnits") as DataList;
                parentPanel.DataBind();

                AjaxControlToolkit.ModalPopupExtender popUp = this.Parent.FindControl("mpeLeaseAdd") as AjaxControlToolkit.ModalPopupExtender;
                popUp.Show();
            }
        }
    }
}
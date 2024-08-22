using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


namespace joshcoWA.applicant
{
    public partial class frmProperty : System.Web.UI.UserControl
    {
        csProperty csP = new csProperty();
       // public delegate void frmPropertyControlDelegate();

                /// <summary>
        /// Events to which the Parent page will subscribe 
        /// </summary>
      //  public event frmPropertyControlDelegate SdsPropertyEmpty;
      //  public event frmPropertyControlDelegate SdsPropertyUnitEmpty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ApplicantID"] = null;
                //ddlCountry.DataSource = CountryList();
                //ddlCountry.DataBind();
                //ddlCountry.SelectedValue = "South Africa";

                if (Request.QueryString["ID"] != null)
                {
                    this.ddlProperty.SelectedValue = Request.QueryString["ID"];
                    FillPropertyProfile(this.ddlProperty.SelectedValue);
                }

            }
        }

       protected string GetActiveClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";
            }
        }

        private void BindImageRepeater(DataListItem lt, string UnitID)
        {
            DirectoryInfo dir = new DirectoryInfo(MapPath("../propertunitypic/" + UnitID + "/"));
            FileInfo[] files;

            if (dir.Exists)
            {
                files = dir.GetFiles("*.jpg");
            }
            else { files = null; }

            DataTable dt = new DataTable();
            dt.Columns.Add("ImageName");
            dt.Columns.Add("Size");
            dt.Columns.Add("PropertyUnitID");
            dt.Clear();
            if (files != null)
            {
                ((System.Web.UI.HtmlControls.HtmlImage)lt.FindControl("NoImage")).Visible = false;
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
          

            if (files.Length <=0)
            {
                DataRow dr = dt.NewRow();
                dr["ImageName"] = "";
                dr["Size"] ="";
                dr["PropertyUnitID"] = UnitID; //dir_info.Name == "plans" ? "" : dir_info.Name;

                dt.Rows.Add(dr);
            }
            ((Repeater)lt.FindControl("Repeater1")).DataSource = null;
            ((Repeater)lt.FindControl("Repeater1")).DataSource = dt;
            ((Repeater)lt.FindControl("Repeater1")).DataBind();

            lt.DataBind();
            }
            else
            {
                ((System.Web.UI.HtmlControls.HtmlImage)lt.FindControl("NoImage")).Visible = true;
            }
        }


        protected void dlUnits_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
            {
                BindImageRepeater(e.Item, ((HiddenField)e.Item.FindControl("hfPropertyUnitID")).Value);
            }
        }

        public void FillPropertyProfile(string PropertyID)
        {
            if (PropertyID != "0")
            { PropertyProfile.Visible = true; ApplicationProcess.Visible = false; }
            else { PropertyProfile.Visible = false; ApplicationProcess.Visible = true; }

            DataTable dt = new DataTable();

            dt = csP.GetProperty(PropertyID);

            if (dt.Rows.Count > 0)
            {
                string strImageFileName = dt.Rows[0]["ImageFileName"].ToString();

                //this.lblDes.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["AddressCode"].ToString();

                if (File.Exists(Server.MapPath("~/propertypic/" + strImageFileName)))
                {
                    this.Image1.ImageUrl = "~/propertypic/" + strImageFileName;
                }


                this.lblTelephone.Text = dt.Rows[0]["Telephone"].ToString();
                this.lblContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                this.lblFaxNo.Text = dt.Rows[0]["Fax"].ToString();
                this.lblEmailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                this.lblPostalAddress.Text = dt.Rows[0]["PostalAddress"].ToString() + ", " + dt.Rows[0]["PostalAddressCode"].ToString();
                this.lblLat.Text = dt.Rows[0]["Lat"].ToString();
                this.lblLong.Text = dt.Rows[0]["Long"].ToString();
                this.lblPhysicalAddress.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["AddressCode"].ToString();
                this.lblArea.Text = dt.Rows[0]["PropertyArea"].ToString();
                //this.lblCity.Text = dt.Rows[0]["CityOrTown"].ToString();
                this.lblErf.Text = dt.Rows[0]["ErfNo"].ToString();
                this.lblPortion.Text = dt.Rows[0]["PortionNo"].ToString();
            }
        }

        //Selected Index Cbhanged
        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillPropertyProfile(this.ddlProperty.SelectedValue);

            this.sdsUnits.DataBind();
            this.dlUnits.DataBind();
            this.ddlPropertyUnit.Items.Clear();
            this.ddlPropertyUnit.DataBind();
        }

        protected void sdsProperty_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1)
            {
                Response.Redirect("frmNoUnitsAvailable.aspx");
            }          
        }

        protected void sdsPropertyUnit_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
           
            if (e.AffectedRows < 1 && ddlPropertyUnit.Items.FindByValue("0") == null)
            {
                ddlPropertyUnit.Items.Insert(0, new ListItem("-- No units available --", "0"));
            }

            if (e.AffectedRows >= 1 && ddlPropertyUnit.Items.FindByValue("0") == null)
            {
                ddlPropertyUnit.Items.Insert(0, new ListItem("-- Select a unit --", "0"));
            }
        }

        //
        protected void ddlPropertyUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            PropertyProfile.Visible = false; ApplicationProcess.Visible = true;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;


namespace joshcoWA
{
    public partial class propertyProfile : joshcoWA.BasePage
    {
        csProperty csP = new csProperty();
        public int New = 0, Completed = 0, InProgress = 0, WorkOrder_ = 0, Inspection_ = 0, Maintenance_ = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["PropertyUnitID"] = null;
                Session["LeaseID"] = 0;
                Session["ReferenceID"] = 0;
                Session["DocumentEntityTypeID"] = 0;
                //FillMapProperties("");
                FillProfile(Session["PropertyID"].ToString());

                this.lblTotalUnits.Text = "Total unit(s) " + this.dlUnits.Items.Count.ToString();

                if(Request.QueryString["a"] != null)
                {
                    if (Request.QueryString["a"].ToString() =="a")
                    {
                        showMessageBox("Property information added successfully, please click on the unit link to add units for this property.");
                    }
                }
            }
        }

        //public void showMessageBox(string message)
        //{
        //    string sScript = null;
        //    message = message.Replace("'", "\\'");
        //    sScript = string.Format("alert('{0}');", message);
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        //}
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
            DirectoryInfo dir = new DirectoryInfo(MapPath("../propertunitypic/" + UnitID+"/"));
            FileInfo[] files;

            if (dir.Exists)
            {
                files = dir.GetFiles("*");//.jpg
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

                ((Repeater)lt.FindControl("Repeater1")).DataSource = dt;
                ((Repeater)lt.FindControl("Repeater1")).DataBind();
            }
            else
            {
                ((System.Web.UI.HtmlControls.HtmlImage)lt.FindControl("NoImage")).Visible = true;
            }
        }

        public void FillProfile(string PropertyID)
        {
            DataTable dt = new DataTable();

            dt = csP.GetProperty(PropertyID);

            if (dt.Rows.Count > 0)
            {
                this.lblPropertyName.Text = dt.Rows[0]["PropertyName"].ToString();
                this.lblPropName.Text = dt.Rows[0]["PropertyName"].ToString();
                
                string filename = dt.Rows[0]["ImageFileName"].ToString(); 
                
                if (File.Exists(Server.MapPath("~/propertypic/" + filename)))
                {
                    this.Image1.ImageUrl = "~/propertypic/" + filename;
                }
                else
                {
                   this.Image1.ImageUrl = "~/images/img_2.jpg";
                }


                //if (File.Exists(Server.MapPath("~/propertypic/" + PropertyID + ".png")))
                //{
                //    this.Image1.ImageUrl = testurl; //"~/propertypic/" + PropertyID + ".png";
                //}
                //if (File.Exists(Server.MapPath("~/propertypic/" + PropertyID + ".jpeg")))
                //{
                //    this.Image1.ImageUrl = testurl;//"~/propertypic/" + PropertyID + ".jpeg";
                //}
 
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

        //public void FillMapProperties(String search)
        //{
        //    DataTable dt = this.GetData("select *,[Address]+', '+Cast([AddressCode] as varchar(20)) as FullAddress from Property where ([Lat] is not null and [Long] is not null) and ([PropertyName] like '%" + search + "%' or ''= '" + search + "')");
        //    rptMarkers.DataSource = dt;
        //    rptMarkers.DataBind();

        //}

        private DataTable GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void gvApplication_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[2].Text == "Application Successful")
                {
                    e.Row.Cells[2].BackColor = System.Drawing.Color.GreenYellow;
                }
                if (e.Row.Cells[2].Text == "Application Declined")
                {
                    e.Row.Cells[2].BackColor = System.Drawing.Color.Red;
                }

                //if (this.txtSearch.Value == "")
                //{
                //    if (Request.QueryString["fl"] != null)
                //    {

                //        CountUnits(((HiddenField)e.Row.FindControl("hfDepositPaid")).Value, ((HiddenField)e.Row.FindControl("hfPendingReview")).Value);

                //        if (Request.QueryString["fl"].ToString() == "apppai")
                //        {
                //            if (((HiddenField)e.Row.FindControl("hfDepositPaid")).Value != "True")
                //            {
                //                e.Row.Visible = false;
                //            }
                //        }
                //        else if (Request.QueryString["fl"].ToString() == "apprev")
                //        {
                //            if (((HiddenField)e.Row.FindControl("hfPendingReview")).Value != "0")
                //            {
                //                e.Row.Visible = false;
                //            }
                //        }
                //    }
                //}
            }
        }

        public void CountUnits(string deposit, string review)
        {
            //if (deposit == "True") { TotalPaidDeposit += 1; }
            //if (review == "1") { TotalPendingReview += 1; }
        }

        protected void gvApplication_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewApplication")
            {
                Session["ApplicationID"] = e.CommandArgument.ToString();
                Response.Redirect("../application/appProfile.aspx"); 
            }
        }

        protected void gvLeases_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewLease")
            {
                Session["LeaseID"] = e.CommandArgument.ToString();
                Response.Redirect("leaseProfile.aspx");
            }
        }

        protected void lnkeditProfilePic_Click(object sender, EventArgs e)
        {

            this.lblLeaseDocHeader.Text = "Property Image";
            this.PropProfilePic.Visible = true;
            this.propertyForm.Visible = false;
            this.unitForm.Visible = false;
            ((HiddenField)this.PropProfilePic.FindControl("hfPropertyID")).Value = Session["PropertyID"].ToString();
            this.mpeLeaseAdd.Show();
        }

        protected void lnkEditPropertyProfile_Click(object sender, EventArgs e)
        {
            this.lblLeaseDocHeader.Text = "Property Details";
            this.PropProfilePic.Visible = false;
            this.propertyForm.Visible = true;
            this.unitForm.Visible = false;
            this.mpeLeaseAdd.Show();
        }

        protected void btnAddUnit_Click(object sender, EventArgs e)
        {
            Session["PropertyUnitID"] = null;
            ((HiddenField)this.unitForm.FindControl("hfPropertyUnitID")).Value = "";
            this.unitForm.ClearFields();

            this.lblLeaseDocHeader.Text = "Property Unit Details";
            this.PropProfilePic.Visible = false;
            this.propertyForm.Visible = false;
            ((Panel)this.unitForm.FindControl("Panel1")).Visible = true;
            ((Panel)this.unitForm.FindControl("Panel2")).Visible = false;

            this.unitForm.Visible = true;
            
            this.mpeLeaseAdd.Show();
        }

        protected void dlUnits_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName=="editunit")
            {
                Session["PropertyUnitID"] = e.CommandArgument.ToString();
                ((HiddenField)this.unitForm.FindControl("hfPropertyUnitID")).Value = e.CommandArgument.ToString();
                this.unitForm.FillProfile();

                this.lblLeaseDocHeader.Text = "Property Unit Details";
                this.PropProfilePic.Visible = false;
                this.propertyForm.Visible = false;
                this.unitForm.Visible = true;
                this.unitForm.BindImageRepeater(e.CommandArgument.ToString());

                ((Panel)this.unitForm.FindControl("Panel1")).Visible = true;
                ((Panel)this.unitForm.FindControl("Panel2")).Visible = false;
                this.mpeLeaseAdd.Show();
            }
            if (e.CommandName == "editPhotos")
            {
                Session["PropertyUnitID"] = e.CommandArgument.ToString();
                ((HiddenField)this.unitForm.FindControl("hfPropertyUnitID")).Value = e.CommandArgument.ToString();
                this.unitForm.FillProfile();

                this.lblLeaseDocHeader.Text = "Property Unit Details";
                this.PropProfilePic.Visible = false;
                this.propertyForm.Visible = false;
                this.unitForm.Visible = true;
                this.unitForm.BindImageRepeater(e.CommandArgument.ToString());

                ((Panel)this.unitForm.FindControl("Panel1")).Visible = false;
                ((Panel)this.unitForm.FindControl("Panel2")).Visible = true;
                this.mpeLeaseAdd.Show();
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

    }
}
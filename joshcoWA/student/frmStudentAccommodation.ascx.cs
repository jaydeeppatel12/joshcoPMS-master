using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class frmStudentAccommodation : System.Web.UI.UserControl
    {
        //clStudentAccommodation clStudentAccommodation = new clStudentAccommodation();
        clStudentAccommodation StudentAccommodation = new clStudentAccommodation();
        clStudentAccommodationUnit StudentAccommodationUnit = new clStudentAccommodationUnit();
        csStudentApplicationAccommodationUnit StudentApplicationAccommodationUnit = new csStudentApplicationAccommodationUnit();

        csProperty csP = new csProperty();
       
       // clStudentUnitType StudentUnitType = new clStudentUnitType();
       //csStudentApplicationPropertyUnitType csStudentApplicationPropertyUnitType = new csStudentApplicationPropertyUnitType();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable dtStudentAccommodation = StudentAccommodation.LoadStudentAccomodation();
                ddlStudentAccommodation.DataSource = dtStudentAccommodation;
                ddlStudentAccommodation.DataBind();              
            }
        }


        public void SaveStudentApplicationAccommodationUnit()
        {
            StudentApplicationAccommodationUnit.StudentApplicationID = Convert.ToInt32(Session["StudentApplicationID"].ToString());  // Convert.ToInt32(hfID.Value);

            StudentApplicationAccommodationUnit.StudentAccommodationID = ddlStudentAccommodation.SelectedIndex;

            StudentApplicationAccommodationUnit.StudentAccommodationID = ddlStudentAccommodation.SelectedIndex;
            StudentApplicationAccommodationUnit.StudentAccommodationUnitID = ddlStudentAccommodationUnit.SelectedIndex;

            StudentApplicationAccommodationUnit.SaveStudentApplicationAccommodationUnit();           
        }

           
       protected void ddlStudentAccommodationUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            PropertyTypeProfile.Visible = true;

            DataTable dt = new DataTable();

            dt = StudentAccommodationUnit.LoadAccommodationUnit(this.ddlStudentAccommodationUnit.SelectedItem.Value);

            if (dt.Rows.Count > 0)
            {
                lblUnitNumber.Text = dt.Rows[0]["UNIT_NUMBER"].ToString();
                lblUnitType.Text = dt.Rows[0]["UNIT_TYPE"].ToString();
                lblNumberOfBeds.Text = dt.Rows[0]["ROOM_SHARING_QTY"].ToString();
                lblRentalAmount.Text = dt.Rows[0]["RENTAL_AMOUNT"].ToString();
                lblDeposit.Text = dt.Rows[0]["RENTAL_AMOUNT"].ToString();
            }
        }

        protected void ddlStudentAccommodation_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtStudentAccommodationUnit = StudentAccommodationUnit.LoadAccommodationUnits(ddlStudentAccommodation.SelectedItem.Value);
            if (dtStudentAccommodationUnit.Rows.Count > 0)
            {
                dtStudentAccommodationUnit.Columns.Add("NumberAndUnitype", typeof(string), "UNIT_NUMBER + UNIT_TYPE");
                ddlStudentAccommodationUnit.DataTextField = "NumberAndUnitype";
                ddlStudentAccommodationUnit.DataValueField = "StudentAccommodationUnitID";
                ddlStudentAccommodationUnit.DataSource = dtStudentAccommodationUnit;
                ddlStudentAccommodationUnit.DataBind();
            }
        }



        public void GetStudentApplicationAccommodationUnitDetails(long StudentApplicationID)
        {
            DataTable dt = new DataTable();
            StudentApplicationAccommodationUnit.StudentApplicationID = StudentApplicationID;
            dt = StudentApplicationAccommodationUnit.GetStudentApplicationAccommodationUnitDetails();
            ddlStudentAccommodation.Enabled = true;
            ddlStudentAccommodationUnit.Enabled = true;

            if (dt.Rows.Count > 0)
            {
                ddlStudentAccommodation.SelectedValue = dt.Rows[0]["StudentAccommodationID"].ToString();

                DataTable dtStudentAccommodationUnit = StudentAccommodationUnit.LoadAccommodationUnits(dt.Rows[0]["StudentAccommodationID"].ToString()); // ddlStudentAccommodation.SelectedItem.Value);
                if (dtStudentAccommodationUnit.Rows.Count > 0)
                {
                    dtStudentAccommodationUnit.Columns.Add("NumberAndUnitype", typeof(string), "UNIT_NUMBER + UNIT_TYPE");
                    ddlStudentAccommodationUnit.DataTextField = "NumberAndUnitype";
                    ddlStudentAccommodationUnit.DataValueField = "StudentAccommodationUnitID";
                    ddlStudentAccommodationUnit.DataSource = dtStudentAccommodationUnit;
                    ddlStudentAccommodationUnit.DataBind();


                    DataTable dtSDisplaytudentAccommodationUnit = new DataTable();

                    dtSDisplaytudentAccommodationUnit = StudentAccommodationUnit.LoadAccommodationUnit(dt.Rows[0]["StudentAccommodationUnitID"].ToString()); // this.ddlStudentAccommodationUnit.SelectedItem.Value);
                    PropertyTypeProfile.Visible = true;
                    if (dtSDisplaytudentAccommodationUnit.Rows.Count > 0)
                    {
                        lblUnitNumber.Text = dtSDisplaytudentAccommodationUnit.Rows[0]["UNIT_NUMBER"].ToString();
                        lblUnitType.Text = dtSDisplaytudentAccommodationUnit.Rows[0]["UNIT_TYPE"].ToString();
                        lblNumberOfBeds.Text = dtSDisplaytudentAccommodationUnit.Rows[0]["ROOM_SHARING_QTY"].ToString();
                        lblRentalAmount.Text = dtSDisplaytudentAccommodationUnit.Rows[0]["RENTAL_AMOUNT"].ToString();
                        lblDeposit.Text = dtSDisplaytudentAccommodationUnit.Rows[0]["RENTAL_AMOUNT"].ToString();
                    }

                    ddlStudentAccommodation.Enabled = false;
                    ddlStudentAccommodationUnit.Enabled = false;
                }

                ddlStudentAccommodationUnit.SelectedValue = dt.Rows[0]["StudentAccommodationUnitID"].ToString();           

            }           
        }
    }
}                                                                                             
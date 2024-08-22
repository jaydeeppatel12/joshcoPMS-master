using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.student
{
    public partial class studentAppList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                AdvancedSearch();

                Session["StudentApplicationID"] = null;
                //Session["ApplicantID"] = null;

                // FillApplication("");
                this.lnkStudentDeclined.Text = "Declined (" + FillApplication("ApplicationStatus ='Application Declined'").Rows.Count.ToString() + ")";
                this.lnkStudentAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";
                this.lnkStudentAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
                //   this.lnkStudentSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ") - ";
            }
        }


        public void AdvancedSearch()
        {
            this.pnlAdvancedSearch.Style.Add("Display", "none");
            this.hlkCloseAdvancedSearch.Style.Add("Display", "none");

            String AddScript = "";
            AddScript = "var pnl = document.getElementById('" + this.pnlAdvancedSearch.ClientID + "');" +
            " var hlnk1 = document.getElementById('" + this.hlkAdvancedSearch.ClientID + "');" +
            " var hlnk2 = document.getElementById('" + this.hlkCloseAdvancedSearch.ClientID + "');" +
            " pnl.style.display = '';" +
            " hlnk1.style.display = 'none';" +
            " hlnk2.style.display = '';";
            this.hlkAdvancedSearch.Attributes.Add("onclick", AddScript);

            String AddScript1 = "";
            AddScript1 = "var pnl = document.getElementById('" + this.pnlAdvancedSearch.ClientID + "');" +
            " var hlnk1 = document.getElementById('" + this.hlkCloseAdvancedSearch.ClientID + "');" +
            " var hlnk2 = document.getElementById('" + this.hlkAdvancedSearch.ClientID + "');" +
            " pnl.style.display = 'none';" +
            " hlnk1.style.display = 'none';" +
            " hlnk2.style.display = '';";
            this.hlkCloseAdvancedSearch.Attributes.Add("onclick", AddScript1);
        }


        public DataTable FillApplication(String search)
        {
            this.sdsStudentApplication.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsStudentApplication.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.GridView1.DataSource = dt2;
            this.GridView1.DataBind();

            return dt2;
        }
              

        protected void lnkViewApplicationDetails_Click(object sender, EventArgs e)
        {
            string sString = "";
            sString += "([StudentFirstName]+' '+ [StudentLastName]+' '+[ApplicantName] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            sString += " and ([StudentAccommodationID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            sString += " and ([ApplicationStatus] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            {
                sString += " and ([ApplicationDate] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [ApplicationDate] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            }
            FillApplication(sString);
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "Application Successful")
                {
                    e.Row.Cells[3].BackColor = System.Drawing.Color.GreenYellow;
                }
                if (e.Row.Cells[3].Text == "Application Declined")
                {
                    e.Row.Cells[3].BackColor = System.Drawing.Color.Red;
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


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewStudentApplication")
            {
                Session["StudentApplicationID"] = e.CommandArgument.ToString();
                Response.Redirect("studentAppProfile.aspx");
            }
            if (e.CommandName == "AddToLeases")
            {
                //Session["ApplicationID"] = e.CommandArgument.ToString();
                //FillTenant();

                //if (hfDeposit.Value.ToLower() == "true" || hfDeposit.Value == "1")
                //{
                //    this.mpeLeaseDoc.Show();
                //}
                //else { this.mpeDeposit.Show(); }


                //Response.Redirect("ApplicationProfile.aspx");
            }
        }


        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void lnkStudentAppNew_Click(object sender, EventArgs e)
        {
            this.lnkStudentAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
            this.lnkStudentAppReviewed.Font.Bold = false;
            this.lnkStudentSuccessfull.Font.Bold = false;
            this.lnkStudentAppNew.Font.Bold = true;
        }

        protected void lnkStudentAppReviewed_Click(object sender, EventArgs e)
        {
            this.lnkStudentAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";
            this.lnkStudentAppReviewed.Font.Bold = true;
            this.lnkStudentSuccessfull.Font.Bold = false;
            this.lnkStudentAppNew.Font.Bold = false;
        }

        protected void lnkStudentSuccessfull_Click(object sender, EventArgs e)
        {

            this.lnkStudentSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ") - ";
            this.lnkStudentAppReviewed.Font.Bold = false;
            this.lnkStudentSuccessfull.Font.Bold = true;
            this.lnkStudentAppNew.Font.Bold = false;
        }

        protected void lnkStudentDeclined_Click(object sender, EventArgs e)
        {
            this.lnkStudentDeclined.Text = "Declined (" + FillApplication("ApplicationStatus ='Application Declined'").Rows.Count.ToString() + ")";
            this.lnkStudentAppReviewed.Font.Bold = false;
            this.lnkStudentDeclined.Font.Bold = true;
            this.lnkStudentSuccessfull.Font.Bold = false;
            this.lnkStudentAppNew.Font.Bold = false;
        }
    }
}
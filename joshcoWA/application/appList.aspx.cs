using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 
namespace joshcoWA
{
    public partial class appList : joshcoWA.BasePage
    {
        public int TotalPaidDeposit = 0, TotalPendingReview = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                AdvancedSearch();

                Session["ApplicationID"] = null;
                Session["ApplicantID"] = null;

               // FillApplication("");
                this.lnkDeclined.Text = "Declined (" + FillApplication("ApplicationStatus ='Application Declined'").Rows.Count.ToString() + ")";
                this.lnkAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";              
                this.lnkAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
                this.lnkSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ") - ";
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
            this.sdsApplication.DataBind();

            DataView dv2;
            dv2 = (DataView)this.sdsApplication.Select(DataSourceSelectArguments.Empty);
            dv2.RowFilter = search;
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();

            this.GridView1.DataSource = dt2;
            this.GridView1.DataBind();

            return dt2;
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

        public void CountUnits(string deposit, string review)
        {
            if (deposit == "True") { TotalPaidDeposit += 1; }
            if (review == "1") { TotalPendingReview += 1; }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewApplication")
            {
                Session["ApplicationID"] = e.CommandArgument.ToString();
                Response.Redirect("appProfile.aspx");
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            // FillApplication("[Name]+' '+ [Surname]+' '+isnull([CompanyName], '')+' '+[ApplicantName] like '%" + this.txtSearch.Value + "%'", "");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            string sString = "";
            sString += "([FullName]+' '+ [MaidenName]+' '+[ApplicantName] like '%" + this.txtAppName.Value + "%' or ''='" + this.txtAppName.Value + "')";
            sString += " and ([PropertyID] = '" + this.ddlProperty.SelectedValue + "' or '0'='" + this.ddlProperty.SelectedValue + "')";
            sString += " and ([ApplicationStatus] = '" + this.ddlAppStatus0.SelectedItem.Text + "' or '-- All --'='" + this.ddlAppStatus0.SelectedItem.Text + "')";
            if (this.rdpStartDate.SelectedDate.ToString() != "" && this.rdpEndDate.SelectedDate.ToString() != "")
            {
                sString += " and ([ApplicationDate] >= '" + this.rdpStartDate.SelectedDate.ToString() + "' and [ApplicationDate] <= '" + this.rdpEndDate.SelectedDate.ToString() + "')";
            }
            FillApplication(sString);
        }

 

        public void showMessageBox(string message)
        {
            string sScript = null;
            message = message.Replace("'", "\\'");
            sScript = string.Format("alert('{0}');", message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }

        protected void lnkNew_Click(object sender, EventArgs e)
        {

        }

        //protected void btnAddApplication_Click(object sender, EventArgs e)
        //{
        //    this.mpeLeaseAdd.Show();
        //}

        protected void lnkAppNew_Click(object sender, EventArgs e)
        {
            this.lnkAppNew.Text = "New (" + FillApplication("ApplicationStatus ='Application Received'").Rows.Count.ToString() + ") - ";
            this.lnkAppReviewed.Font.Bold = false;
            this.lnkSuccessfull.Font.Bold = false;
            this.lnkAppNew.Font.Bold = true;
        }

        protected void lnkAppReviewed_Click(object sender, EventArgs e)
        {
            this.lnkAppReviewed.Text = "Reviewed (" + FillApplication("ApplicationStatus ='Application Reviewed'").Rows.Count.ToString() + ") - ";
            this.lnkAppReviewed.Font.Bold = true;
            this.lnkSuccessfull.Font.Bold = false;
            this.lnkAppNew.Font.Bold = false;
        }

        protected void lnkSuccessfull_Click(object sender, EventArgs e)
        {
            this.lnkSuccessfull.Text = "Successful (" + FillApplication("ApplicationStatus ='Application Successful'").Rows.Count.ToString() + ") - ";
            this.lnkAppReviewed.Font.Bold = false;
            this.lnkSuccessfull.Font.Bold = true;
            this.lnkAppNew.Font.Bold = false;
        }

        protected void lnkDeclined_Click(object sender, EventArgs e)
        {
            this.lnkDeclined.Text = "Declined (" + FillApplication("ApplicationStatus ='Application Declined'").Rows.Count.ToString() + ")";
            this.lnkAppReviewed.Font.Bold = false;
            this.lnkDeclined.Font.Bold = true;
            this.lnkSuccessfull.Font.Bold = false;
            this.lnkAppNew.Font.Bold = false;
        }
    }
}
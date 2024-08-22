using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;


using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using joshcoWA.tenant;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace joshcoWA
{
    public partial class statement : joshcoWA.BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvInvoice_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Print")
            {
                LinkButton btn = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)(btn.NamingContainer);

                ExportToPDF(row.Cells[0].Text, e.CommandArgument.ToString());
            }
        }

        protected void ExportToPDF(string FinYear, string Mon)
        {
            System.Data.DataView dv1 = null;
            dv1 = (System.Data.DataView)this.sdsInvoice.Select(DataSourceSelectArguments.Empty);
            dv1.RowFilter = "FinYear = " + FinYear + " and MonNo = " + Mon; ;
            System.Data.DataTable dt1 = new System.Data.DataTable();
            dt1 = dv1.ToTable("DataSet1");

            ReportDataSource rds1 = new ReportDataSource("DataSet1", dt1);

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = "report/Invoice.rdlc";
            viewer.LocalReport.DataSources.Add(rds1);
            //FillReport(viewer);

            //if (SaveFile == "No")
            {
                byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                string filename = "Invoice";
                Response.Clear();
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".pdf");
                Response.AddHeader("Content-Length", bytes.Length.ToString());
                Response.OutputStream.Write(bytes, 0, bytes.Length);
                Response.End();
            }
        }
    }
}
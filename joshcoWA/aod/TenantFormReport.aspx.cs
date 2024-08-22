using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronPdf; 

namespace joshcoWA.aod
{
  public partial class TenantFormReport : System.Web.UI.Page
  {
    csProperty csP = new csProperty();
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!this.IsPostBack)
      {
        GetTenantsAODDetails();
      }
    }

    private void GetTenantsAODDetails()
    {
      DataView dataView;
      dataView = (DataView)this.sdsTenantFormReport.Select(DataSourceSelectArguments.Empty);
      DataTable dataTable = new DataTable();
      dataTable = dataView.ToTable();
      this.GridView1.DataSource = dataTable;
      this.GridView1.DataBind();
    }

    private void GetTenantsAODDetailsByPropertyName(string PropertyName)
    {
      DataTable dataTable = new DataTable();
      dataTable = csP.GetTenantsByPropertyName(PropertyName);
      this.GridView1.DataSource = dataTable;
      this.GridView1.DataBind();
    }

    public void showMessageBox(string message)
    {
      string sScript = null;
      message = message.Replace("'", "\\'");
      sScript = string.Format("alert('{0}');", message);
      ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
    }
    protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
    {
      GetTenantsAODDetailsByPropertyName(this.ddlProjectName.SelectedValue); 
    } 

    protected void ExportToPdf(object sender, EventArgs e)
    {
      //converting DataTable to Csv file.
      DataTable dataTable = new DataTable();
      dataTable = csP.GetTenantsByPropertyName(this.ddlProjectName.SelectedValue);
       
      string csv = string.Empty;

      foreach (DataColumn column in dataTable.Columns)
      {
        //Add the Header row for CSV file.
        csv += column.ColumnName + ',';
      }

      //Add new line.
      csv += "\r\n";

      foreach (DataRow row in dataTable.Rows)
      {
        foreach (DataColumn column in dataTable.Columns)
        {
          //Add the Data rows.
          csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
        }

        //Add new line.
        csv += "\r\n";
      }

      //Download the CSV file.
      Response.Clear();
      Response.Buffer = true;
      Response.AddHeader("content-disposition", $"attachment;filename=TenantFormReport-{DateTime.Now.ToString("yyyy-MM-dd HH.mm.ss")}.csv");
      Response.Charset = "";
      Response.ContentType = "application/text";
      Response.Output.Write(csv);
      Response.Flush();
      Response.End();

      showMessageBox("File Saved Successfully"); 
    }

    //This method convertrs the DataTable to Csv (in the form of StringBuilder instance).
    public StringBuilder ConvertDataTableToCsvFile(DataTable dtData)
    {
      StringBuilder data = new StringBuilder();

      //Taking the column names.
      for (int column = 0; column < dtData.Columns.Count; column++)
      {
        //Making sure that end of the line, shoould not have comma delimiter.
        if (column == dtData.Columns.Count - 1)
          data.Append(dtData.Columns[column].ColumnName.ToString().Replace(",", ";"));
        else
          data.Append(dtData.Columns[column].ColumnName.ToString().Replace(",", ";") + ',');
      }

      data.Append(Environment.NewLine);//New line after appending columns.

      for (int row = 0; row < dtData.Rows.Count; row++)
      {
        for (int column = 0; column < dtData.Columns.Count; column++)
        {
          ////Making sure that end of the line, shoould not have comma delimiter.
          if (column == dtData.Columns.Count - 1)
            data.Append(dtData.Rows[row][column].ToString().Replace(",", ";"));
          else
            data.Append(dtData.Rows[row][column].ToString().Replace(",", ";") + ',');
        }

        //Making sure that end of the file, should not have a new line.
        if (row != dtData.Rows.Count - 1)
          data.Append(Environment.NewLine);
      }
      return data;
    }

    //This method saves the data to the csv file. 
    public void SaveData(StringBuilder data, string filePath)
    {
      using (StreamWriter objWriter = new StreamWriter(filePath))
      {
        objWriter.WriteLine(data);
      }
    }
  }
}
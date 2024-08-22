using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.applicant
{
    public partial class ApplicantIncome : System.Web.UI.UserControl
    {
        clApplicantIncome appIn = new clApplicantIncome();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtTotalIncome.Attributes.Add("readonly", "readonly");
        }
        public int GetApplicantIncome(long ApplicantID)
        {
            DataTable dt = new DataTable();
            appIn.ApplicantID = ApplicantID;
            dt = appIn.GetApplicantIncome();

            if (dt.Rows.Count > 0)
            {    
                hfID.Value = dt.Rows[0]["ApplicantIncomeID"].ToString();
             
                txtGrossIncome.Value = (dt.Rows[0]["GrossIncome"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["GrossIncome"].ToString())) ? decimal.Parse(dt.Rows[0]["GrossIncome"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtPeriodicAllowance.Value = (dt.Rows[0]["PeriodicAllowance"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["PeriodicAllowance"].ToString())) ? decimal.Parse(dt.Rows[0]["PeriodicAllowance"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtFinancialObligationByEmployer.Value = (dt.Rows[0]["FinancialObligationByEmployer"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["FinancialObligationByEmployer"].ToString())) ? decimal.Parse(dt.Rows[0]["FinancialObligationByEmployer"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtHousingAllowancePayable.Value = (dt.Rows[0]["HousingAllowancePayable"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["HousingAllowancePayable"].ToString())) ? decimal.Parse(dt.Rows[0]["HousingAllowancePayable"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00";  
                txtCommissionsReceived.Value = (dt.Rows[0]["CommissionsReceived"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["CommissionsReceived"].ToString())) ? decimal.Parse(dt.Rows[0]["CommissionsReceived"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtPensionDisabilityMaintenanceGrant.Value = (dt.Rows[0]["PensionDisabilityMaintenanceGrant"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["PensionDisabilityMaintenanceGrant"].ToString())) ? decimal.Parse(dt.Rows[0]["PensionDisabilityMaintenanceGrant"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtOther.Value = (dt.Rows[0]["Other"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["Other"].ToString())) ? decimal.Parse(dt.Rows[0]["Other"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 

                             
                txtGrossIncomeSpouse.Value = (dt.Rows[0]["GrossIncomeSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["GrossIncomeSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["GrossIncomeSpouse"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtPeriodicAllowanceSpouse.Value = (dt.Rows[0]["PeriodicAllowanceSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["PeriodicAllowanceSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["PeriodicAllowanceSpouse"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtFinancialObligationByEmployerSpouse.Value = (dt.Rows[0]["FinancialObligationByEmployerSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["FinancialObligationByEmployerSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["FinancialObligationByEmployerSpouse"].ToString()).ToString("0.00",CultureInfo.InvariantCulture) : "0.00"; 
                txtHousingAllowancePayableSpouse.Value = (dt.Rows[0]["HousingAllowancePayableSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["HousingAllowancePayableSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["HousingAllowancePayableSpouse"].ToString()).ToString("0.00", CultureInfo.InvariantCulture) : "0.00";

            }

            return Convert.ToInt32(hfID.Value);
        }

        public string SaveApplicantIncome(string ApplicantID)
        {
            string ID = "";
            appIn.ApplicantIncomeID = Convert.ToInt32(hfID.Value);
            appIn.ApplicantID = Convert.ToInt32(ApplicantID);
            appIn.GrossIncome = Convert.ToDouble(txtGrossIncome.Value.ToString().Replace(".", ","));

            appIn.PeriodicAllowance = Convert.ToDouble(txtPeriodicAllowance.Value.Replace(".", ","));
            appIn.FinancialObligationByEmployer = Convert.ToDouble(txtFinancialObligationByEmployer.Value.ToString().Replace(".", ","));
            appIn.HousingAllowancePayable = Convert.ToDouble(txtHousingAllowancePayable.Value.ToString().Replace(".", ","));
            //////////////////appIn.CommissionsReceived = Convert.ToDouble(txtCommissionsReceived.Value);
            //////////////////appIn.PensionDisabilityMaintenanceGrant = Convert.ToDouble(txtPensionDisabilityMaintenanceGrant.Value);
            //////////////////appIn.Other = Convert.ToDouble(txtOther.Value);
            appIn.TotalIncome = Convert.ToDouble(txtTotalIncome.Value.ToString().Replace(".", ","));

            appIn.GrossIncomeSpouse = Convert.ToDouble(txtGrossIncomeSpouse.Value == "" ? "0" : txtGrossIncomeSpouse.Value.ToString().Replace(".", ","));
            appIn.PeriodicAllowanceSpouse = Convert.ToDouble(txtPeriodicAllowanceSpouse.Value == "" ? "0" : txtPeriodicAllowanceSpouse.Value.ToString().Replace(".", ","));
            appIn.FinancialObligationByEmployerSpouse = Convert.ToDouble(txtFinancialObligationByEmployerSpouse.Value == "" ? "0" : txtFinancialObligationByEmployerSpouse.Value.ToString().Replace(".", ","));
            appIn.HousingAllowancePayableSpouse = Convert.ToDouble(txtHousingAllowancePayableSpouse.Value == "" ? "0" : txtHousingAllowancePayableSpouse.Value.ToString().Replace(".", ","));
            appIn.TotalIncomeSpouse = Convert.ToDouble(txtTotalIncomeSpouse.Value.ToString().Replace(".", ","));

            ID = appIn.SaveApplicantIncome();

            return ID;
        }

        public string SaveAdminApplicantIncome(string ApplicantID)
        {
            string ID = "";
            appIn.ApplicantIncomeID = Convert.ToInt32(hfID.Value);
            appIn.ApplicantID = Convert.ToInt32(ApplicantID);
            appIn.CommissionsReceived = Convert.ToDouble(txtCommissionsReceived.Value == "" ? "0" : txtCommissionsReceived.Value);
            appIn.PensionDisabilityMaintenanceGrant = Convert.ToDouble(txtPensionDisabilityMaintenanceGrant.Value == "" ? "0" : txtPensionDisabilityMaintenanceGrant.Value);
            appIn.Other = Convert.ToDouble(txtOther.Value == "" ? "0" : txtOther.Value);
            ID = appIn.SaveAdminApplicantIncome();

            return ID;
        }


        protected void btnIncomeAdmin_Click(object sender, EventArgs e)
        {       
            appIn.ApplicantIncomeID = Convert.ToInt32(hfID.Value);
            //appIn.ApplicantID = Convert.ToInt32(ApplicantID);
            appIn.CommissionsReceived = Convert.ToDouble(txtCommissionsReceived.Value);
            appIn.PensionDisabilityMaintenanceGrant = Convert.ToDouble(txtPensionDisabilityMaintenanceGrant.Value);
            appIn.Other = Convert.ToDouble(txtOther.Value);
            ID = appIn.SaveAdminApplicantIncome(); 
        }     

        
    }
}
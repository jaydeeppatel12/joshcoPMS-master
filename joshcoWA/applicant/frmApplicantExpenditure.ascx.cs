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
    public partial class ApplicantExpenditure : System.Web.UI.UserControl
    {
        clApplicantExpenditure appE = new clApplicantExpenditure();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void GetRentalAmount(int PropertyUnitID)
        {
            //txtRent.Value
            DataTable dt = new DataTable();
            appE.PropertyUnitID = PropertyUnitID;
            dt = appE.GetRentalAmount();
            if (dt.Rows.Count > 0)
            {
                txtRent.Value = decimal.Parse(dt.Rows[0]["EstRatePerSQM"].ToString()).ToString("0.00", CultureInfo.InvariantCulture);
            }
        }

        public void GetApplicantExpenditure(long ApplicantID)
        {
            DataTable dt = new DataTable();
            appE.ApplicantID = ApplicantID;
            dt = appE.GetApplicantExpenditure();
          
            if (dt.Rows.Count > 0)
            {
                hfID.Value = dt.Rows[0]["ApplicantExpenditureID"].ToString();
                //To choose the best formatting approach btwn string.Format("{0:0.##}", string.Format("{0:#,##0.00}" and string.Format("{0:0.00}"
                txtCellphoneAccount.Value = (dt.Rows[0]["CellphoneAccount"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["CellphoneAccount"].ToString())) ? decimal.Parse(dt.Rows[0]["CellphoneAccount"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtClothingAccount.Value = (dt.Rows[0]["ClothingAccount"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["ClothingAccount"].ToString())) ? decimal.Parse(dt.Rows[0]["ClothingAccount"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtDSTVAccount.Value = (dt.Rows[0]["DSTVAccount"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["DSTVAccount"].ToString())) ? decimal.Parse(dt.Rows[0]["DSTVAccount"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";  
                txtFurnitureAccount.Value = (dt.Rows[0]["FurnitureAccount"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["FurnitureAccount"].ToString())) ? decimal.Parse(dt.Rows[0]["FurnitureAccount"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtGroceries.Value = (dt.Rows[0]["Groceries"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["Groceries"].ToString())) ? decimal.Parse(dt.Rows[0]["Groceries"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtInsurancePolicies.Value = (dt.Rows[0]["InsurancePolicies"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["InsurancePolicies"].ToString())) ? decimal.Parse(dt.Rows[0]["InsurancePolicies"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtLoans.Value = (dt.Rows[0]["Loans"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["Loans"].ToString())) ? decimal.Parse(dt.Rows[0]["Loans"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtChildMaintenance.Value = (dt.Rows[0]["ChildMaintenance"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["ChildMaintenance"].ToString())) ? decimal.Parse(dt.Rows[0]["ChildMaintenance"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtMedicalAid.Value = (dt.Rows[0]["MedicalAid"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["MedicalAid"].ToString())) ? decimal.Parse(dt.Rows[0]["MedicalAid"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtMotorVehicleInsurance.Value = (dt.Rows[0]["MotorVehicleInsurance"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["MotorVehicleInsurance"].ToString())) ? decimal.Parse(dt.Rows[0]["MotorVehicleInsurance"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtMotorVehicleInstalment.Value = (dt.Rows[0]["MotorVehicleInstalment"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["MotorVehicleInstalment"].ToString())) ? decimal.Parse(dt.Rows[0]["MotorVehicleInstalment"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";

                txtRent.Value = (dt.Rows[0]["Rent"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["Rent"].ToString())) ? decimal.Parse(dt.Rows[0]["Rent"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 

                txtSavings.Value = (dt.Rows[0]["Savings"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["Savings"].ToString())) ? decimal.Parse(dt.Rows[0]["Savings"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtSchoolFees.Value = (dt.Rows[0]["SchoolFees"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["SchoolFees"].ToString())) ? decimal.Parse(dt.Rows[0]["SchoolFees"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtTransportCosts.Value = (dt.Rows[0]["TransportCosts"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["TransportCosts"].ToString())) ? decimal.Parse(dt.Rows[0]["TransportCosts"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00"; 
                txtWaterAndElectricity.Value = (dt.Rows[0]["WaterAndElectricity"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["WaterAndElectricity"].ToString())) ? decimal.Parse(dt.Rows[0]["WaterAndElectricity"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtOther.Value = (dt.Rows[0]["Other"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["Other"].ToString())) ? decimal.Parse(dt.Rows[0]["Other"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
               
                txtCellphoneAccountSpouse.Value = (dt.Rows[0]["CellphoneAccountSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["CellphoneAccountSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["CellphoneAccountSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtClothingAccountSpouse.Value = (dt.Rows[0]["ClothingAccountSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["ClothingAccountSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["ClothingAccountSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtDSTVAccountSpouse.Value = (dt.Rows[0]["DSTVAccountSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["DSTVAccountSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["DSTVAccountSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtFurnitureAccountSpouse.Value = (dt.Rows[0]["FurnitureAccountSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["FurnitureAccountSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["FurnitureAccountSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtGroceriesSpouse.Value = (dt.Rows[0]["GroceriesSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["GroceriesSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["GroceriesSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtInsurancePoliciesSpouse.Value = (dt.Rows[0]["InsurancePoliciesSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["InsurancePoliciesSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["InsurancePoliciesSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtLoansSpouse.Value = (dt.Rows[0]["LoansSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["LoansSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["LoansSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtChildMaintenanceSpouse.Value = (dt.Rows[0]["ChildMaintenanceSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["ChildMaintenanceSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["ChildMaintenanceSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtMedicalAidSpouse.Value = (dt.Rows[0]["MedicalAidSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["MedicalAidSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["MedicalAidSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtMotorVehicleInsuranceSpouse.Value = (dt.Rows[0]["MotorVehicleInsuranceSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["MotorVehicleInsuranceSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["MotorVehicleInsuranceSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtMotorVehicleInstalmentSpouse.Value = (dt.Rows[0]["MotorVehicleInstalmentSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["MotorVehicleInstalmentSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["MotorVehicleInstalmentSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";

                txtSavingsSpouse.Value = (dt.Rows[0]["SavingsSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["SavingsSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["SavingsSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";

                txtSchoolFeesSpouse.Value = (dt.Rows[0]["SchoolFeesSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["SchoolFeesSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["SchoolFeesSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtTransportCostsSpouse.Value = (dt.Rows[0]["TransportCostsSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["TransportCostsSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["TransportCostsSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtWaterAndElectricitySpouse.Value = (dt.Rows[0]["WaterAndElectricitySpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["WaterAndElectricitySpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["WaterAndElectricitySpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";
                txtOtherSpouse.Value = (dt.Rows[0]["OtherSpouse"] != DBNull.Value || !string.IsNullOrEmpty(dt.Rows[0]["OtherSpouse"].ToString())) ? decimal.Parse(dt.Rows[0]["OtherSpouse"].ToString()).ToString("00.00", CultureInfo.InvariantCulture) : "0.00";              
            }
        }
        public string SaveApplicantExpenditure(string ApplicantID)
        {
            string ID = "";
            appE.ApplicantExpenditureID = Convert.ToInt32(hfID.Value);
            appE.ApplicantID = Convert.ToInt32(ApplicantID);

            appE.CellphoneAccount = double.Parse(txtCellphoneAccount.Value.ToString().Replace(".", ","));
            appE.ClothingAccount = double.Parse(txtClothingAccount.Value.ToString().Replace(".", ","));
            appE.DSTVAccount = double.Parse(txtDSTVAccount.Value.ToString().Replace(".", ","));
            appE.FurnitureAccount = double.Parse(txtFurnitureAccount.Value.ToString().Replace(".", ","));
            appE.Groceries = double.Parse(txtGroceries.Value.ToString().Replace(".", ","));
            appE.InsurancePolicies = double.Parse(txtInsurancePolicies.Value.ToString().Replace(".", ","));
            appE.Loans = double.Parse(txtLoans.Value.ToString().Replace(".", ","));
            appE.ChildMaintenance = double.Parse(txtChildMaintenance.Value.ToString().Replace(".", ","));
            appE.MedicalAid = double.Parse(txtMedicalAid.Value.ToString().Replace(".", ","));
            appE.MotorVehicleInsurance = double.Parse(txtMotorVehicleInsurance.Value.ToString().Replace(".", ","));
            appE.MotorVehicleInstalment = double.Parse(txtMotorVehicleInstalment.Value.ToString().Replace(".", ","));
            appE.Rent = double.Parse(txtRent.Value.ToString().Replace(".", ","));
            appE.Savings = double.Parse(txtSavings.Value.ToString().Replace(".", ","));
            appE.SchoolFees = double.Parse(txtSchoolFees.Value.ToString().Replace(".", ","));
            appE.TransportCosts = double.Parse(txtTransportCosts.Value.ToString().Replace(".", ","));
            appE.WaterAndElectricity = double.Parse(txtWaterAndElectricity.Value.ToString().Replace(".", ","));
            appE.Other = double.Parse(txtOther.Value == "" ? "0" : txtOther.Value.ToString().Replace(".", ","));
            appE.TotalExpenditure = double.Parse(txtTotalExpenditure.Value == "" ? "0" : txtTotalExpenditure.Value.ToString().Replace(".", ","));

            appE.CellphoneAccountSpouse = double.Parse(txtCellphoneAccountSpouse.Value == "" ? "0" : txtCellphoneAccountSpouse.Value.ToString().Replace(".", ","));
            appE.ClothingAccountSpouse = double.Parse(txtClothingAccountSpouse.Value == "" ? "0" : txtClothingAccountSpouse.Value.ToString().Replace(".", ","));
            appE.DSTVAccountSpouse = double.Parse(txtDSTVAccountSpouse.Value == "" ? "0" : txtDSTVAccountSpouse.Value.ToString().Replace(".", ","));
            appE.FurnitureAccountSpouse = double.Parse(txtFurnitureAccountSpouse.Value == "" ? "0" : txtFurnitureAccountSpouse.Value.ToString().Replace(".", ","));
            appE.GroceriesSpouse = double.Parse(txtGroceriesSpouse.Value == "" ? "0" : txtGroceriesSpouse.Value.ToString().Replace(".", ","));
            appE.InsurancePoliciesSpouse = double.Parse(txtInsurancePoliciesSpouse.Value == "" ? "0" : txtInsurancePoliciesSpouse.Value.ToString().Replace(".", ","));
            appE.LoansSpouse = double.Parse(txtLoansSpouse.Value == "" ? "0" : txtLoansSpouse.Value.ToString().Replace(".", ","));
            appE.ChildMaintenanceSpouse = double.Parse(txtChildMaintenanceSpouse.Value == "" ? "0" : txtChildMaintenanceSpouse.Value.ToString().Replace(".", ","));
            appE.MedicalAidSpouse = double.Parse(txtMedicalAidSpouse.Value == "" ? "0" : txtMedicalAidSpouse.Value.ToString().Replace(".", ","));
            appE.MotorVehicleInsuranceSpouse = double.Parse(txtMotorVehicleInsuranceSpouse.Value == "" ? "0" : txtMotorVehicleInsuranceSpouse.Value.ToString().Replace(".", ","));
            appE.MotorVehicleInstalmentSpouse = double.Parse(txtMotorVehicleInstalmentSpouse.Value == "" ? "0" : txtMotorVehicleInstalmentSpouse.Value.ToString().Replace(".", ","));

            appE.SavingsSpouse = double.Parse(txtSavingsSpouse.Value == "" ? "0" : txtSavingsSpouse.Value.ToString().Replace(".", ","));
            appE.SchoolFeesSpouse = double.Parse(txtSchoolFeesSpouse.Value == "" ? "0" : txtSchoolFeesSpouse.Value.ToString().Replace(".", ","));
            appE.TransportCostsSpouse = double.Parse(txtTransportCostsSpouse.Value == "" ? "0" : txtTransportCostsSpouse.Value.ToString().Replace(".", ","));
            appE.WaterAndElectricitySpouse = double.Parse(txtWaterAndElectricitySpouse.Value == "" ? "0" : txtWaterAndElectricitySpouse.Value.ToString().Replace(".", ","));
            appE.OtherSpouse = double.Parse(txtOtherSpouse.Value == "" ? "0" : txtOtherSpouse.Value.ToString().Replace(".", ","));
            appE.TotalExpenditureSpouse = double.Parse(txtTotalExpenditureSpouse.Value == "" ? "0" : txtTotalExpenditureSpouse.Value.ToString().Replace(".", ","));

            ID = appE.SaveApplicantExpenditure();

            return ID;
        }
        public double GetRent(string ApplicantID)
        {
            return Convert.ToDouble(txtRent.Value);
        }
            protected void txtCellphoneAccount_TextChanged(object sender, EventArgs e)
        {
            decimal sum = 0;
            sum = Convert.ToDecimal(txtCellphoneAccount.Value == "" ? "0" : txtCellphoneAccount.Value)
            + Convert.ToDecimal(txtClothingAccount.Value == "" ? "0" : txtClothingAccount.Value)
            + Convert.ToDecimal(txtDSTVAccount.Value == "" ? "0" : txtDSTVAccount.Value)
            + Convert.ToDecimal(txtFurnitureAccount.Value == "" ? "0" : txtFurnitureAccount.Value)
            + Convert.ToDecimal(txtGroceries.Value == "" ? "0" : txtGroceries.Value)
            + Convert.ToDecimal(txtInsurancePolicies.Value == "" ? "0" : txtInsurancePolicies.Value)
            + Convert.ToDecimal(txtLoans.Value == "" ? "0" : txtLoans.Value)
            + Convert.ToDecimal(txtChildMaintenance.Value == "" ? "0" : txtChildMaintenance.Value)
            + Convert.ToDecimal(txtMedicalAid.Value == "" ? "0" : txtMedicalAid.Value)
            + Convert.ToDecimal(txtMotorVehicleInsurance.Value == "" ? "0" : txtMotorVehicleInsurance.Value)
            + Convert.ToDecimal(txtMotorVehicleInstalment.Value == "" ? "0" : txtMotorVehicleInstalment.Value)
            + Convert.ToDecimal(txtRent.Value == "" ? "0" : txtRent.Value)
            + Convert.ToDecimal(txtSavings.Value == "" ? "0" : txtSavings.Value)
            + Convert.ToDecimal(txtSchoolFees.Value == "" ? "0" : txtSchoolFees.Value)
            + Convert.ToDecimal(txtTransportCosts.Value == "" ? "0" : txtTransportCosts.Value)
            + Convert.ToDecimal(txtWaterAndElectricity.Value == "" ? "0" : txtWaterAndElectricity.Value)
            + Convert.ToDecimal(txtOther.Value == "" ? "0" : txtOther.Value);
           // this.txtTotalExpenditure.Value = sum.ToString();
        }

        protected void txtCellphoneAccountSpouse_TextChanged(object sender, EventArgs e)
        {
            decimal sum = 0;
            sum = Convert.ToDecimal(txtCellphoneAccountSpouse.Value == "" ? "0" : txtCellphoneAccountSpouse.Value)
            + Convert.ToDecimal(txtClothingAccountSpouse.Value == "" ? "0" : txtClothingAccountSpouse.Value)
            + Convert.ToDecimal(txtDSTVAccountSpouse.Value == "" ? "0" : txtDSTVAccountSpouse.Value)
            + Convert.ToDecimal(txtFurnitureAccountSpouse.Value == "" ? "0" : txtFurnitureAccountSpouse.Value)
            + Convert.ToDecimal(txtGroceriesSpouse.Value == "" ? "0" : txtGroceriesSpouse.Value)
            + Convert.ToDecimal(txtInsurancePoliciesSpouse.Value == "" ? "0" : txtInsurancePoliciesSpouse.Value)
            + Convert.ToDecimal(txtLoansSpouse.Value == "" ? "0" : txtLoansSpouse.Value)
            + Convert.ToDecimal(txtChildMaintenanceSpouse.Value == "" ? "0" : txtChildMaintenanceSpouse.Value)
            + Convert.ToDecimal(txtMedicalAidSpouse.Value == "" ? "0" : txtMedicalAidSpouse.Value)
            + Convert.ToDecimal(txtMotorVehicleInsuranceSpouse.Value == "" ? "0" : txtMotorVehicleInsuranceSpouse.Value)
            + Convert.ToDecimal(txtMotorVehicleInstalmentSpouse.Value == "" ? "0" : txtMotorVehicleInstalmentSpouse.Value)
            + Convert.ToDecimal(txtRentSpouse.Value == "" ? "0" : txtRentSpouse.Value)
            + Convert.ToDecimal(txtSavingsSpouse.Value == "" ? "0" : txtSavingsSpouse.Value)
            + Convert.ToDecimal(txtSchoolFeesSpouse.Value == "" ? "0" : txtSchoolFeesSpouse.Value)
            + Convert.ToDecimal(txtTransportCostsSpouse.Value == "" ? "0" : txtTransportCostsSpouse.Value)
            + Convert.ToDecimal(txtWaterAndElectricitySpouse.Value == "" ? "0" : txtWaterAndElectricitySpouse.Value)
            + Convert.ToDecimal(txtOtherSpouse.Value == "" ? "0" : txtOtherSpouse.Value);
            //this.txtTotalExpenditureSpouse.Value = sum.ToString();
        }
    }
}
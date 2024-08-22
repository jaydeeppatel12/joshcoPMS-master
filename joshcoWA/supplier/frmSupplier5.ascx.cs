using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joshcoWA.supplier
{
    public partial class frmSupplier5 : System.Web.UI.UserControl
    {
        clSupplier supp = new clSupplier();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SaveDetails(string ServiceProviderID)
        {
            string ID = "";
            supp.ServiceProviderID = Convert.ToInt32(ServiceProviderID);
            supp.SalesContactName = txtSalesContactName.Value;
            supp.SalesContactDesignation = txtSalesContactDesignation.Value;
            supp.SalesContactCellNumber = txtSalesContactCellNumber.Value;
            supp.SalesContactEmailAddress = txtSalesContactEmailAddress.Value;
            supp.SalesContactTelephone = txtSalesContactTelephone.Value;
            supp.SalesContactFaxNumber = txtSalesContactFaxNumber.Value;
            supp.AccountsContactName = txtAccountsContactName.Value;
            supp.AccountsContactDesignation = txtAccountsContactDesignation.Value;
            supp.AccountsContactCellNumber = txtAccountsContactCellNumber.Value;
            supp.AccountsContactEmailAddress = txtAccountsContactEmailAddress.Value;
            supp.AccountsContactTelephone = txtAccountsContactTelephone.Value;
            supp.AccountsContactFaxNumber = txtAccountsContactFaxNumber.Value;
            supp.BankName = txtBankName.Value;
            supp.BranchCode = txtBranchCode.Value;
            supp.BranchName = txtBranchName.Value;
            supp.AccountNumber = txtAccountNumber.Value;
            supp.AccountType = txtAccountType.Value;
            supp.AccountHolderName = txtAccountHolderName.Value;
            supp.BusinessPreviouslyExist = Convert.ToBoolean(chkPropertyOwner.SelectedValue);
            supp.PreviousBusinessName = txtPreviousBusinessName.Value;
            supp.PreviousBusinessRegistration = txtPreviousBusinessRegistration.Value;

            ID = supp.SaveSupplier5();

            return ID;
        }

        public void GetDetails(long ServiceProviderID)
        {
            DataTable dt = new DataTable();
            supp.ServiceProviderID = ServiceProviderID;
            dt = supp.GetSupplier(ServiceProviderID.ToString());

            if (dt.Rows.Count > 0)
            {
                 txtSalesContactName.Value = dt.Rows[0]["SalesContactName"].ToString();
                txtSalesContactDesignation.Value = dt.Rows[0]["SalesContactDesignation"].ToString();
                txtSalesContactCellNumber.Value = dt.Rows[0]["SalesContactCellNumber"].ToString();
                txtSalesContactEmailAddress.Value = dt.Rows[0]["SalesContactEmailAddress"].ToString();
                txtSalesContactTelephone.Value = dt.Rows[0]["SalesContactTelephone"].ToString();
                txtSalesContactFaxNumber.Value = dt.Rows[0]["SalesContactFaxNumber"].ToString();
                txtAccountsContactName.Value = dt.Rows[0]["AccountsContactName"].ToString();
                txtAccountsContactDesignation.Value = dt.Rows[0]["AccountsContactDesignation"].ToString();
                txtAccountsContactCellNumber.Value = dt.Rows[0]["AccountsContactCellNumber"].ToString();
                txtAccountsContactEmailAddress.Value = dt.Rows[0]["AccountsContactEmailAddress"].ToString();
                txtAccountsContactTelephone.Value = dt.Rows[0]["AccountsContactTelephone"].ToString();
                txtAccountsContactFaxNumber.Value = dt.Rows[0]["AccountsContactFaxNumber"].ToString();
                txtBankName.Value = dt.Rows[0]["BankName"].ToString();
                txtBranchCode.Value = dt.Rows[0]["BranchCode"].ToString();
                txtAccountNumber.Value = dt.Rows[0]["AccountNumber"].ToString();
                txtAccountType.Value = dt.Rows[0]["AccountType"].ToString();
                txtAccountHolderName.Value = dt.Rows[0]["AccountHolderName"].ToString();

                if (dt.Rows[0]["BusinessPreviouslyExist"] == DBNull.Value)
                {
       
                }
                else
                {
                    chkPropertyOwner.SelectedValue =  dt.Rows[0]["BusinessPreviouslyExist"].ToString() ;

                }
                txtPreviousBusinessName.Value = dt.Rows[0]["PreviousBusinessName"].ToString();
                txtPreviousBusinessRegistration.Value = dt.Rows[0]["PreviousBusinessRegistration"].ToString();

            }
        }

        protected void chkPropertyOwner_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (chkPropertyOwner.SelectedValue == "True")
            {
                this.RequiredFieldValidator29.Enabled = true;
                this.RequiredFieldValidator30.Enabled = true;

            }
            else
            {
                this.RequiredFieldValidator29.Enabled = false;
                this.RequiredFieldValidator30.Enabled = false;
            }
        }
    }
}
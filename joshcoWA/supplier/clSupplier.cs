using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace joshcoWA.supplier
{
    public class clSupplier
    {
        private long mServiceProviderID;
        public long ServiceProviderID
        {
            get { return mServiceProviderID; }
            set { mServiceProviderID = value; }
        }
        
        private long mCompanyTypeID;
        public long CompanyTypeID
        {
            get { return mCompanyTypeID; }
            set { mCompanyTypeID = value; }
        }
        private string mReferenceNumber;
        public string ReferenceNumber
        {
            get { return mReferenceNumber; }
            set { mReferenceNumber = value; }
        }

        private string mRepresentativeCapacity;
        public string RepresentativeCapacity
        {
            get { return mRepresentativeCapacity; }
            set { mRepresentativeCapacity = value; }
        }

        private string mRepresentativeName;
        public string RepresentativeName
        {
            get { return mRepresentativeName; }
            set { mRepresentativeName = value; }
        }


        private string mCompanyTypeOther;
        public string CompanyTypeOther
        {
            get { return mCompanyTypeOther; }
            set { mCompanyTypeOther = value; }
        }

        private Boolean mIsNullCompanyRegistrationDoc_NA;
        public Boolean IsNullCompanyRegistrationDoc_NA
        {
            get { return mIsNullCompanyRegistrationDoc_NA; }
            set { mIsNullCompanyRegistrationDoc_NA = value; }
        }

        private Boolean mCompanyRegistrationDoc_NA;
        public Boolean CompanyRegistrationDoc_NA
        {
            get { return mCompanyRegistrationDoc_NA; }
            set { mCompanyRegistrationDoc_NA = value; }
        }

        private Boolean mIsNullProofOfShareHoldingDoc_NA;
        public Boolean IsNullProofOfShareHoldingDoc_NA
        {
            get { return mIsNullProofOfShareHoldingDoc_NA; }
            set { mIsNullProofOfShareHoldingDoc_NA = value; }
        }

        private Boolean mProofOfShareHoldingDoc_NA;
        public Boolean ProofOfShareHoldingDoc_NA
        {
            get { return mProofOfShareHoldingDoc_NA; }
            set { mProofOfShareHoldingDoc_NA = value; }
        }

        private Boolean mIsNullProofOfBankingDetailDoc_NA;
        public Boolean IsNullProofOfBankingDetailDoc_NA
        {
            get { return mIsNullProofOfBankingDetailDoc_NA; }
            set { mIsNullProofOfBankingDetailDoc_NA = value; }
        }

        private Boolean mProofOfBankingDetailDoc_NA;
        public Boolean ProofOfBankingDetailDoc_NA
        {
            get { return mProofOfBankingDetailDoc_NA; }
            set { mProofOfBankingDetailDoc_NA = value; }
        }

        private Boolean mIsNullVatRegistrationNoDoc_NA;
        public Boolean IsNullVatRegistrationNoDoc_NA
        {
            get { return mIsNullVatRegistrationNoDoc_NA; }
            set { mIsNullVatRegistrationNoDoc_NA = value; }
        }

        private Boolean mTaxClearanceCertificateDoc_NA;
        public Boolean TaxClearanceCertificateDoc_NA
        {
            get { return mTaxClearanceCertificateDoc_NA; }
            set { mTaxClearanceCertificateDoc_NA = value; }
        }

        private Boolean mVatRegistrationNoDoc_NA;
        public Boolean VatRegistrationNoDoc_NA
        {
            get { return mVatRegistrationNoDoc_NA; }
            set { mVatRegistrationNoDoc_NA = value; }
        }

        private Boolean mIsNullPAYEDoc_NA;
        public Boolean IsNullPAYEDoc_NA
        {
            get { return mIsNullPAYEDoc_NA; }
            set { mIsNullPAYEDoc_NA = value; }
        }

        private Boolean mPAYEDoc_NA;
        public Boolean PAYEDoc_NA
        {
            get { return mPAYEDoc_NA; }
            set { mPAYEDoc_NA = value; }
        }

        private Boolean mIsNullUnemployementInsuranceFundNumber;
        public Boolean IsNullUnemployementInsuranceFundNumber
        {
            get { return mIsNullUnemployementInsuranceFundNumber; }
            set { mIsNullUnemployementInsuranceFundNumber = value; }
        }

        private String mUnemployementInsuranceFundNumber;
        public String UnemployementInsuranceFundNumber
        {
            get { return mUnemployementInsuranceFundNumber; }
            set { mUnemployementInsuranceFundNumber = value; }
        }

        private Boolean mIsNullUnemployementInsuranceFundDoc_NA;
        public Boolean IsNullUnemployementInsuranceFundDoc_NA
        {
            get { return mIsNullUnemployementInsuranceFundDoc_NA; }
            set { mIsNullUnemployementInsuranceFundDoc_NA = value; }
        }

        private Boolean mUnemployementInsuranceFundDoc_NA;
        public Boolean UnemployementInsuranceFundDoc_NA
        {
            get { return mUnemployementInsuranceFundDoc_NA; }
            set { mUnemployementInsuranceFundDoc_NA = value; }
        }

        private Boolean mIsNullWorkmanCompensationFundNumber;
        public Boolean IsNullWorkmanCompensationFundNumber
        {
            get { return mIsNullWorkmanCompensationFundNumber; }
            set { mIsNullWorkmanCompensationFundNumber = value; }
        }

        private String mWorkmanCompensationFundNumber;
        public String WorkmanCompensationFundNumber
        {
            get { return mWorkmanCompensationFundNumber; }
            set { mWorkmanCompensationFundNumber = value; }
        }

        private Boolean mIsNullWorkmanCompensationFundDoc_NA;
        public Boolean IsNullWorkmanCompensationFundDoc_NA
        {
            get { return mIsNullWorkmanCompensationFundDoc_NA; }
            set { mIsNullWorkmanCompensationFundDoc_NA = value; }
        }

        private Boolean mWorkmanCompensationFundDoc_NA;
        public Boolean WorkmanCompensationFundDoc_NA
        {
            get { return mWorkmanCompensationFundDoc_NA; }
            set { mWorkmanCompensationFundDoc_NA = value; }
        }

        private Boolean mIsNullProfessionalRegistrationNumber;
        public Boolean IsNullProfessionalRegistrationNumber
        {
            get { return mIsNullProfessionalRegistrationNumber; }
            set { mIsNullProfessionalRegistrationNumber = value; }
        }

        private String mProfessionalRegistrationNumber;
        public String ProfessionalRegistrationNumber
        {
            get { return mProfessionalRegistrationNumber; }
            set { mProfessionalRegistrationNumber = value; }
        }

        private Boolean mIsNullProfessionalRegistrationDoc_NA;
        public Boolean IsNullProfessionalRegistrationDoc_NA
        {
            get { return mIsNullProfessionalRegistrationDoc_NA; }
            set { mIsNullProfessionalRegistrationDoc_NA = value; }
        }

        private Boolean mProfessionalRegistrationDoc_NA;
        public Boolean ProfessionalRegistrationDoc_NA
        {
            get { return mProfessionalRegistrationDoc_NA; }
            set { mProfessionalRegistrationDoc_NA = value; }
        }

        private Boolean mIsNullDisabilityDoc_NA;
        public Boolean IsNullDisabilityDoc_NA
        {
            get { return mIsNullDisabilityDoc_NA; }
            set { mIsNullDisabilityDoc_NA = value; }
        }

        private Boolean mDisabilityDoc_NA;
        public Boolean DisabilityDoc_NA
        {
            get { return mDisabilityDoc_NA; }
            set { mDisabilityDoc_NA = value; }
        }

        private Boolean mIsNullIncomeTaxRegistrationNumber;
        public Boolean IsNullIncomeTaxRegistrationNumber
        {
            get { return mIsNullIncomeTaxRegistrationNumber; }
            set { mIsNullIncomeTaxRegistrationNumber = value; }
        }

        private String mIncomeTaxRegistrationNumber;
        public String IncomeTaxRegistrationNumber
        {
            get { return mIncomeTaxRegistrationNumber; }
            set { mIncomeTaxRegistrationNumber = value; }
        }

        private Boolean mIsNullIncomeTaxRegistrationDoc_NA;
        public Boolean IsNullIncomeTaxRegistrationDoc_NA
        {
            get { return mIsNullIncomeTaxRegistrationDoc_NA; }
            set { mIsNullIncomeTaxRegistrationDoc_NA = value; }
        }

        private Boolean mIncomeTaxRegistrationDoc_NA;
        public Boolean IncomeTaxRegistrationDoc_NA
        {
            get { return mIncomeTaxRegistrationDoc_NA; }
            set { mIncomeTaxRegistrationDoc_NA = value; }
        }

        private Boolean mIsNullBEECertificateDoc_NA;
        public Boolean IsNullBEECertificateDoc_NA
        {
            get { return mIsNullBEECertificateDoc_NA; }
            set { mIsNullBEECertificateDoc_NA = value; }
        }

        private Boolean mBEECertificateDoc_NA;
        public Boolean BEECertificateDoc_NA
        {
            get { return mBEECertificateDoc_NA; }
            set { mBEECertificateDoc_NA = value; }
        }

        private Boolean mIsNullBEELevelID;
        public Boolean IsNullBEELevelID
        {
            get { return mIsNullBEELevelID; }
            set { mIsNullBEELevelID = value; }
        }

        private long mBEELevelID;
        public long BEELevelID
        {
            get { return mBEELevelID; }
            set { mBEELevelID = value; }
        }

        private Boolean mIsNullBusinessOperationID;
        public Boolean IsNullBusinessOperationID
        {
            get { return mIsNullBusinessOperationID; }
            set { mIsNullBusinessOperationID = value; }
        }

        private long mBusinessOperationID;
        public long BusinessOperationID
        {
            get { return mBusinessOperationID; }
            set { mBusinessOperationID = value; }
        }

        private Boolean mIsNullAnnualAvarageTurnover;
        public Boolean IsNullAnnualAvarageTurnover
        {
            get { return mIsNullAnnualAvarageTurnover; }
            set { mIsNullAnnualAvarageTurnover = value; }
        }

        private double mAnnualAvarageTurnover;
        public double AnnualAvarageTurnover
        {
            get { return mAnnualAvarageTurnover; }
            set { mAnnualAvarageTurnover = value; }
        }

        private Boolean mIsNullGrossAssetValue;
        public Boolean IsNullGrossAssetValue
        {
            get { return mIsNullGrossAssetValue; }
            set { mIsNullGrossAssetValue = value; }
        }

        private double mGrossAssetValue;
        public double GrossAssetValue
        {
            get { return mGrossAssetValue; }
            set { mGrossAssetValue = value; }
        }

        private Boolean mIsNullEconomicSectorID;
        public Boolean IsNullEconomicSectorID
        {
            get { return mIsNullEconomicSectorID; }
            set { mIsNullEconomicSectorID = value; }
        }

        private long mEconomicSectorID;
        public long EconomicSectorID
        {
            get { return mEconomicSectorID; }
            set { mEconomicSectorID = value; }
        }

        private Boolean mIsNullTypeOfBusinessID;
        public Boolean IsNullTypeOfBusinessID
        {
            get { return mIsNullTypeOfBusinessID; }
            set { mIsNullTypeOfBusinessID = value; }
        }

        private long mTypeOfBusinessID;
        public long TypeOfBusinessID
        {
            get { return mTypeOfBusinessID; }
            set { mTypeOfBusinessID = value; }
        }

        private Boolean mIsNullFullTimePaidEmployees;
        public Boolean IsNullFullTimePaidEmployees
        {
            get { return mIsNullFullTimePaidEmployees; }
            set { mIsNullFullTimePaidEmployees = value; }
        }

        private long mFullTimePaidEmployees;
        public long FullTimePaidEmployees
        {
            get { return mFullTimePaidEmployees; }
            set { mFullTimePaidEmployees = value; }
        }

        private Boolean mIsNullSMMEStatusID;
        public Boolean IsNullSMMEStatusID
        {
            get { return mIsNullSMMEStatusID; }
            set { mIsNullSMMEStatusID = value; }
        }

        private long mSMMEStatusID;
        public long SMMEStatusID
        {
            get { return mSMMEStatusID; }
            set { mSMMEStatusID = value; }
        }

        private Boolean mIsNullBusinessName;
        public Boolean IsNullBusinessName
        {
            get { return mIsNullBusinessName; }
            set { mIsNullBusinessName = value; }
        }

        private String mBusinessName;
        public String BusinessName
        {
            get { return mBusinessName; }
            set { mBusinessName = value; }
        }

        private Boolean mIsNullPhysicalAddress;
        public Boolean IsNullPhysicalAddress
        {
            get { return mIsNullPhysicalAddress; }
            set { mIsNullPhysicalAddress = value; }
        }

        private String mPhysicalAddress;
        public String PhysicalAddress
        {
            get { return mPhysicalAddress; }
            set { mPhysicalAddress = value; }
        }

        private Boolean mIsNullCity;
        public Boolean IsNullCity
        {
            get { return mIsNullCity; }
            set { mIsNullCity = value; }
        }

        private String mCity;
        public String City
        {
            get { return mCity; }
            set { mCity = value; }
        }

        private Boolean mIsNullPhysicalAddressCode;
        public Boolean IsNullPhysicalAddressCode
        {
            get { return mIsNullPhysicalAddressCode; }
            set { mIsNullPhysicalAddressCode = value; }
        }

        private long mPhysicalAddressCode;
        public long PhysicalAddressCode
        {
            get { return mPhysicalAddressCode; }
            set { mPhysicalAddressCode = value; }
        }

        private Boolean mIsNullProvinceID;
        public Boolean IsNullProvinceID
        {
            get { return mIsNullProvinceID; }
            set { mIsNullProvinceID = value; }
        }

        private long mProvinceID;
        public long ProvinceID
        {
            get { return mProvinceID; }
            set { mProvinceID = value; }
        }

        private Boolean mIsNullTelephone;
        public Boolean IsNullTelephone
        {
            get { return mIsNullTelephone; }
            set { mIsNullTelephone = value; }
        }

        private String mTelephone;
        public String Telephone
        {
            get { return mTelephone; }
            set { mTelephone = value; }
        }

        private Boolean mIsNullFax;
        public Boolean IsNullFax
        {
            get { return mIsNullFax; }
            set { mIsNullFax = value; }
        }

        private String mFax;
        public String Fax
        {
            get { return mFax; }
            set { mFax = value; }
        }

        private Boolean mIsNullEmail;
        public Boolean IsNullEmail
        {
            get { return mIsNullEmail; }
            set { mIsNullEmail = value; }
        }

        private String mEmail;
        public String Email
        {
            get { return mEmail; }
            set { mEmail = value; }
        }

        private Boolean mIsNullWebPageAddress;
        public Boolean IsNullWebPageAddress
        {
            get { return mIsNullWebPageAddress; }
            set { mIsNullWebPageAddress = value; }
        }

        private String mWebPageAddress;
        public String WebPageAddress
        {
            get { return mWebPageAddress; }
            set { mWebPageAddress = value; }
        }

        private Boolean mIsNullCorrespondenceEmail;
        public Boolean IsNullCorrespondenceEmail
        {
            get { return mIsNullCorrespondenceEmail; }
            set { mIsNullCorrespondenceEmail = value; }
        }

        private Boolean mCorrespondenceEmail;
        public Boolean CorrespondenceEmail
        {
            get { return mCorrespondenceEmail; }
            set { mCorrespondenceEmail = value; }
        }

        private Boolean mIsNullCorrespondencePost;
        public Boolean IsNullCorrespondencePost
        {
            get { return mIsNullCorrespondencePost; }
            set { mIsNullCorrespondencePost = value; }
        }

        private Boolean mCorrespondencePost;
        public Boolean CorrespondencePost
        {
            get { return mCorrespondencePost; }
            set { mCorrespondencePost = value; }
        }

        private Boolean mIsNullCorrespondenceFax;
        public Boolean IsNullCorrespondenceFax
        {
            get { return mIsNullCorrespondenceFax; }
            set { mIsNullCorrespondenceFax = value; }
        }

        private Boolean mCorrespondenceFax;
        public Boolean CorrespondenceFax
        {
            get { return mCorrespondenceFax; }
            set { mCorrespondenceFax = value; }
        }

        private Boolean mIsNullContactPersonTitle;
        public Boolean IsNullContactPersonTitle
        {
            get { return mIsNullContactPersonTitle; }
            set { mIsNullContactPersonTitle = value; }
        }

        private String mContactPersonTitle;
        public String ContactPersonTitle
        {
            get { return mContactPersonTitle; }
            set { mContactPersonTitle = value; }
        }

        private Boolean mIsNullContactPersonName;
        public Boolean IsNullContactPersonName
        {
            get { return mIsNullContactPersonName; }
            set { mIsNullContactPersonName = value; }
        }

        private String mContactPersonName;
        public String ContactPersonName
        {
            get { return mContactPersonName; }
            set { mContactPersonName = value; }
        }

        private Boolean mIsNullContactPersonSurname;
        public Boolean IsNullContactPersonSurname
        {
            get { return mIsNullContactPersonSurname; }
            set { mIsNullContactPersonSurname = value; }
        }

        private String mContactPersonSurname;
        public String ContactPersonSurname
        {
            get { return mContactPersonSurname; }
            set { mContactPersonSurname = value; }
        }

        private Boolean mIsNullSalesContactName;
        public Boolean IsNullSalesContactName
        {
            get { return mIsNullSalesContactName; }
            set { mIsNullSalesContactName = value; }
        }

        private String mSalesContactName;
        public String SalesContactName
        {
            get { return mSalesContactName; }
            set { mSalesContactName = value; }
        }

        private Boolean mIsNullSalesContactDesignation;
        public Boolean IsNullSalesContactDesignation
        {
            get { return mIsNullSalesContactDesignation; }
            set { mIsNullSalesContactDesignation = value; }
        }

        private String mSalesContactDesignation;
        public String SalesContactDesignation
        {
            get { return mSalesContactDesignation; }
            set { mSalesContactDesignation = value; }
        }

        private Boolean mIsNullSalesContactCellNumber;
        public Boolean IsNullSalesContactCellNumber
        {
            get { return mIsNullSalesContactCellNumber; }
            set { mIsNullSalesContactCellNumber = value; }
        }
        
        private String mSalesContactCellNumber;
        public String SalesContactCellNumber
        {
            get { return mSalesContactCellNumber; }
            set { mSalesContactCellNumber = value; }
        }

        private String mBusinessOperationOther;
         public String BusinessOperationOther
        {
            get { return mBusinessOperationOther; }
            set { mBusinessOperationOther = value; }
        }


        private Boolean mIsNullSalesContactEmailAddress;
        public Boolean IsNullSalesContactEmailAddress
        {
            get { return mIsNullSalesContactEmailAddress; }
            set { mIsNullSalesContactEmailAddress = value; }
        }

        private String mSalesContactEmailAddress;
        public String SalesContactEmailAddress
        {
            get { return mSalesContactEmailAddress; }
            set { mSalesContactEmailAddress = value; }
        }

        private Boolean mIsNullSalesContactTelephone;
        public Boolean IsNullSalesContactTelephone
        {
            get { return mIsNullSalesContactTelephone; }
            set { mIsNullSalesContactTelephone = value; }
        }

        private String mSalesContactTelephone;
        public String SalesContactTelephone
        {
            get { return mSalesContactTelephone; }
            set { mSalesContactTelephone = value; }
        }

        private Boolean mIsNullSalesContactFaxNumber;
        public Boolean IsNullSalesContactFaxNumber
        {
            get { return mIsNullSalesContactFaxNumber; }
            set { mIsNullSalesContactFaxNumber = value; }
        }

        private String mSalesContactFaxNumber;
        public String SalesContactFaxNumber
        {
            get { return mSalesContactFaxNumber; }
            set { mSalesContactFaxNumber = value; }
        }

        private Boolean mIsNullAccountsContactName;
        public Boolean IsNullAccountsContactName
        {
            get { return mIsNullAccountsContactName; }
            set { mIsNullAccountsContactName = value; }
        }

        private String mAccountsContactName;
        public String AccountsContactName
        {
            get { return mAccountsContactName; }
            set { mAccountsContactName = value; }
        }

        private Boolean mIsNullAccountsContactDesignation;
        public Boolean IsNullAccountsContactDesignation
        {
            get { return mIsNullAccountsContactDesignation; }
            set { mIsNullAccountsContactDesignation = value; }
        }

        private String mAccountsContactDesignation;
        public String AccountsContactDesignation
        {
            get { return mAccountsContactDesignation; }
            set { mAccountsContactDesignation = value; }
        }

        private Boolean mIsNullAccountsContactCellNumber;
        public Boolean IsNullAccountsContactCellNumber
        {
            get { return mIsNullAccountsContactCellNumber; }
            set { mIsNullAccountsContactCellNumber = value; }
        }

        private String mAccountsContactCellNumber;
        public String AccountsContactCellNumber
        {
            get { return mAccountsContactCellNumber; }
            set { mAccountsContactCellNumber = value; }
        }

        private Boolean mIsNullAccountsContactEmailAddress;
        public Boolean IsNullAccountsContactEmailAddress
        {
            get { return mIsNullAccountsContactEmailAddress; }
            set { mIsNullAccountsContactEmailAddress = value; }
        }

        private String mAccountsContactEmailAddress;
        public String AccountsContactEmailAddress
        {
            get { return mAccountsContactEmailAddress; }
            set { mAccountsContactEmailAddress = value; }
        }

        private Boolean mIsNullAccountsContactTelephone;
        public Boolean IsNullAccountsContactTelephone
        {
            get { return mIsNullAccountsContactTelephone; }
            set { mIsNullAccountsContactTelephone = value; }
        }

        private String mAccountsContactTelephone;
        public String AccountsContactTelephone
        {
            get { return mAccountsContactTelephone; }
            set { mAccountsContactTelephone = value; }
        }

        private Boolean mIsNullAccountsContactFaxNumber;
        public Boolean IsNullAccountsContactFaxNumber
        {
            get { return mIsNullAccountsContactFaxNumber; }
            set { mIsNullAccountsContactFaxNumber = value; }
        }

        private String mAccountsContactFaxNumber;
        public String AccountsContactFaxNumber
        {
            get { return mAccountsContactFaxNumber; }
            set { mAccountsContactFaxNumber = value; }
        }

        private Boolean mIsNullBankName;
        public Boolean IsNullBankName
        {
            get { return mIsNullBankName; }
            set { mIsNullBankName = value; }
        }

        private String mBankName;
        public String BankName
        {
            get { return mBankName; }
            set { mBankName = value; }
        }

        private Boolean mIsNullBranchCode;
        public Boolean IsNullBranchCode
        {
            get { return mIsNullBranchCode; }
            set { mIsNullBranchCode = value; }
        }

        private String mBranchName;
        public String BranchName
        {
            get { return mBranchName; }
            set { mBranchName = value; }
        }

        private String mBranchCode;
        public String BranchCode
        {
            get { return mBranchCode; }
            set { mBranchCode = value; }
        }

        private Boolean mIsNullAccountNumber;
        public Boolean IsNullAccountNumber
        {
            get { return mIsNullAccountNumber; }
            set { mIsNullAccountNumber = value; }
        }

        private String mAccountNumber;
        public String AccountNumber
        {
            get { return mAccountNumber; }
            set { mAccountNumber = value; }
        }

        private Boolean mIsNullAccountType;
        public Boolean IsNullAccountType
        {
            get { return mIsNullAccountType; }
            set { mIsNullAccountType = value; }
        }

        private String mAccountType;
        public String AccountType
        {
            get { return mAccountType; }
            set { mAccountType = value; }
        }

        private Boolean mIsNullAccountHolderName;
        public Boolean IsNullAccountHolderName
        {
            get { return mIsNullAccountHolderName; }
            set { mIsNullAccountHolderName = value; }
        }

        private String mAccountHolderName;
        public String AccountHolderName
        {
            get { return mAccountHolderName; }
            set { mAccountHolderName = value; }
        }

        private Boolean mIsNullBusinessPreviouslyExist;
        public Boolean IsNullBusinessPreviouslyExist
        {
            get { return mIsNullBusinessPreviouslyExist; }
            set { mIsNullBusinessPreviouslyExist = value; }
        }

        private Boolean mBusinessPreviouslyExist;
        public Boolean BusinessPreviouslyExist
        {
            get { return mBusinessPreviouslyExist; }
            set { mBusinessPreviouslyExist = value; }
        }

        private Boolean mIsNullPreviousBusinessName;
        public Boolean IsNullPreviousBusinessName
        {
            get { return mIsNullPreviousBusinessName; }
            set { mIsNullPreviousBusinessName = value; }
        }

        private String mPreviousBusinessName;
        public String PreviousBusinessName
        {
            get { return mPreviousBusinessName; }
            set { mPreviousBusinessName = value; }
        }

        private Boolean mIsNullPreviousBusinessRegistration;
        public Boolean IsNullPreviousBusinessRegistration
        {
            get { return mIsNullPreviousBusinessRegistration; }
            set { mIsNullPreviousBusinessRegistration = value; }
        }

        private String mPreviousBusinessRegistration;
        public String PreviousBusinessRegistration
        {
            get { return mPreviousBusinessRegistration; }
            set { mPreviousBusinessRegistration = value; }
        }

        private Boolean mIsNullPostalAddress;
        public Boolean IsNullPostalAddress
        {
            get { return mIsNullPostalAddress; }
            set { mIsNullPostalAddress = value; }
        }

        private String mPostalAddress;
        public String PostalAddress
        {
            get { return mPostalAddress; }
            set { mPostalAddress = value; }
        }

        private Boolean mIsNullDeclaration;
        public Boolean IsNullDeclaration
        {
            get { return mIsNullDeclaration; }
            set { mIsNullDeclaration = value; }
        }

        private Boolean mDeclaration;
        public Boolean Declaration
        {
            get { return mDeclaration; }
            set { mDeclaration = value; }
        }


        public DataTable GetSupplier(string ServiceProviderID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT * FROM [dbo].[ServiceProvider] Where ServiceProviderID = '" + ServiceProviderID + "';", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public DataTable GetSupplierDocuments(string ServiceProviderID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);
            SqlCommand CmdSql = new SqlCommand("SELECT [DocumentName], [DocumentCategoryID] FROM [dbo].[ServiceProviderDocument] Where ServiceProviderID = '" + ServiceProviderID + "';", conn);

            DataTable dsExists = new DataTable();
            SqlDataAdapter ExistsAdapter = new SqlDataAdapter();
            ExistsAdapter.SelectCommand = CmdSql;

            conn.Open();
            CmdSql.ExecuteNonQuery();
            ExistsAdapter.Fill(dsExists);
            conn.Close();

            return dsExists;
        }

        public string SaveSupplier1()
        {
            String ID = ServiceProviderID.ToString();


            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[ServiceProvider] ( [ReferenceNumber], [CompanyTypeOther], [CompanyTypeID],  [CompanyRegistrationDoc_NA], [ProofOfShareHoldingDoc_NA], [ProofOfBankingDetailDoc_NA], [VatRegistrationNoDoc_NA], [PAYEDoc_NA], [UnemployementInsuranceFundNumber], [UnemployementInsuranceFundDoc_NA], [WorkmanCompensationFundNumber], [WorkmanCompensationFundDoc_NA], [ProfessionalRegistrationNumber], [ProfessionalRegistrationDoc_NA], [DisabilityDoc_NA], [IncomeTaxRegistrationNumber], [IncomeTaxRegistrationDoc_NA], [TaxClearanceCertificateDoc_NA], [BEECertificateDoc_NA], [BEELevelID], [BusinessOperationID], [AnnualAvarageTurnover], [GrossAssetValue], [EconomicSectorID], [TypeOfBusinessID], [FullTimePaidEmployees], [SMMEStatusID], [BusinessName], [PhysicalAddress], [City], [PhysicalAddressCode], [ProvinceID], [Telephone], [Fax], [Email], [WebPageAddress], [CorrespondenceEmail], [CorrespondencePost], [CorrespondenceFax], [ContactPersonTitle], [ContactPersonName], [ContactPersonSurname], [SalesContactName], [SalesContactDesignation], [SalesContactCellNumber], [SalesContactEmailAddress], [SalesContactTelephone], [SalesContactFaxNumber], [AccountsContactName], [AccountsContactDesignation], [AccountsContactCellNumber], [AccountsContactEmailAddress], [AccountsContactTelephone], [AccountsContactFaxNumber], [BankName], [BranchCode], [AccountNumber], [AccountType], [AccountHolderName], [BusinessPreviouslyExist], [PreviousBusinessName], [PreviousBusinessRegistration], [PostalAddress], [Declaration] ) VALUES (@ReferenceNumber, @BusinessOperationOther, @CompanyTypeOther, @CompanyTypeID,  @CompanyRegistrationDoc_NA, @ProofOfShareHoldingDoc_NA, @ProofOfBankingDetailDoc_NA, @VatRegistrationNoDoc_NA, @PAYEDoc_NA, @UnemployementInsuranceFundNumber, @UnemployementInsuranceFundDoc_NA, @WorkmanCompensationFundNumber, @WorkmanCompensationFundDoc_NA, @ProfessionalRegistrationNumber, @ProfessionalRegistrationDoc_NA, @DisabilityDoc_NA, @IncomeTaxRegistrationNumber, @IncomeTaxRegistrationDoc_NA, @TaxClearanceCertificateDoc_NA, @BEECertificateDoc_NA, @BEELevelID, @BusinessOperationID, @AnnualAvarageTurnover, @GrossAssetValue, @EconomicSectorID, @TypeOfBusinessID, @FullTimePaidEmployees, @SMMEStatusID, @BusinessName, @PhysicalAddress, @City, @PhysicalAddressCode, @ProvinceID, @Telephone, @Fax, @Email, @WebPageAddress, @CorrespondenceEmail, @CorrespondencePost, @CorrespondenceFax, @ContactPersonTitle, @ContactPersonName, @ContactPersonSurname, @SalesContactName, @SalesContactDesignation, @SalesContactCellNumber, @SalesContactEmailAddress, @SalesContactTelephone, @SalesContactFaxNumber, @AccountsContactName, @AccountsContactDesignation, @AccountsContactCellNumber, @AccountsContactEmailAddress, @AccountsContactTelephone, @AccountsContactFaxNumber, @BankName, @BranchCode, @AccountNumber, @AccountType, @AccountHolderName, @BusinessPreviouslyExist, @PreviousBusinessName, @PreviousBusinessRegistration, @PostalAddress, @Declaration ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ServiceProvider] set  ReferenceNumber = @ReferenceNumber, [CompanyTypeOther] = @CompanyTypeOther, [CompanyTypeID] = @CompanyTypeID,  [CompanyRegistrationDoc_NA] = @CompanyRegistrationDoc_NA, [ProofOfShareHoldingDoc_NA] = @ProofOfShareHoldingDoc_NA, [ProofOfBankingDetailDoc_NA] = @ProofOfBankingDetailDoc_NA, [VatRegistrationNoDoc_NA] = @VatRegistrationNoDoc_NA, [PAYEDoc_NA] = @PAYEDoc_NA  where [ServiceProviderID] = @ServiceProviderID; select  @ServiceProviderID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ServiceProviderID field for updates. 
                Command.Parameters.AddWithValue("@ServiceProviderID", ID);

            }

            Command.Parameters.AddWithValue("@ReferenceNumber", ReferenceNumber);

            Command.Parameters.AddWithValue("@CompanyTypeID", CompanyTypeID);

            Command.Parameters.AddWithValue("@CompanyTypeOther", CompanyTypeOther);

            Command.Parameters.AddWithValue("@CompanyRegistrationDoc_NA", CompanyRegistrationDoc_NA);

            Command.Parameters.AddWithValue("@ProofOfShareHoldingDoc_NA", ProofOfShareHoldingDoc_NA);

            Command.Parameters.AddWithValue("@ProofOfBankingDetailDoc_NA", ProofOfBankingDetailDoc_NA);

            Command.Parameters.AddWithValue("@VatRegistrationNoDoc_NA", VatRegistrationNoDoc_NA);

            Command.Parameters.AddWithValue("@PAYEDoc_NA", PAYEDoc_NA);

            
            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public string SaveSupplier2()
        {
            String ID = ServiceProviderID.ToString();


            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[ServiceProvider] ([BusinessOperationOther], [CompanyTypeOther], [CompanyTypeID], [CompanyRegistrationDoc_NA], [ProofOfShareHoldingDoc_NA], [ProofOfBankingDetailDoc_NA], [VatRegistrationNoDoc_NA], [PAYEDoc_NA], [UnemployementInsuranceFundNumber], [UnemployementInsuranceFundDoc_NA], [WorkmanCompensationFundNumber], [WorkmanCompensationFundDoc_NA], [ProfessionalRegistrationNumber], [ProfessionalRegistrationDoc_NA], [DisabilityDoc_NA], [IncomeTaxRegistrationNumber], [IncomeTaxRegistrationDoc_NA], [TaxClearanceCertificateDoc_NA], [BEECertificateDoc_NA], [BEELevelID], [BusinessOperationID], [AnnualAvarageTurnover], [GrossAssetValue], [EconomicSectorID], [TypeOfBusinessID], [FullTimePaidEmployees], [SMMEStatusID], [BusinessName], [PhysicalAddress], [City], [PhysicalAddressCode], [ProvinceID], [Telephone], [Fax], [Email], [WebPageAddress], [CorrespondenceEmail], [CorrespondencePost], [CorrespondenceFax], [ContactPersonTitle], [ContactPersonName], [ContactPersonSurname], [SalesContactName], [SalesContactDesignation], [SalesContactCellNumber], [SalesContactEmailAddress], [SalesContactTelephone], [SalesContactFaxNumber], [AccountsContactName], [AccountsContactDesignation], [AccountsContactCellNumber], [AccountsContactEmailAddress], [AccountsContactTelephone], [AccountsContactFaxNumber], [BankName], [BranchCode], [AccountNumber], [AccountType], [AccountHolderName], [BusinessPreviouslyExist], [PreviousBusinessName], [PreviousBusinessRegistration], [PostalAddress], [Declaration] ) VALUES (@BusinessOperationOther, @CompanyTypeOther, @CompanyTypeID,  @CompanyRegistrationDoc_NA, @ProofOfShareHoldingDoc_NA, @ProofOfBankingDetailDoc_NA, @VatRegistrationNoDoc_NA, @PAYEDoc_NA, @UnemployementInsuranceFundNumber, @UnemployementInsuranceFundDoc_NA, @WorkmanCompensationFundNumber, @WorkmanCompensationFundDoc_NA, @ProfessionalRegistrationNumber, @ProfessionalRegistrationDoc_NA, @DisabilityDoc_NA, @IncomeTaxRegistrationNumber, @IncomeTaxRegistrationDoc_NA, @TaxClearanceCertificateDoc_NA, @BEECertificateDoc_NA, @BEELevelID, @BusinessOperationID, @AnnualAvarageTurnover, @GrossAssetValue, @EconomicSectorID, @TypeOfBusinessID, @FullTimePaidEmployees, @SMMEStatusID, @BusinessName, @PhysicalAddress, @City, @PhysicalAddressCode, @ProvinceID, @Telephone, @Fax, @Email, @WebPageAddress, @CorrespondenceEmail, @CorrespondencePost, @CorrespondenceFax, @ContactPersonTitle, @ContactPersonName, @ContactPersonSurname, @SalesContactName, @SalesContactDesignation, @SalesContactCellNumber, @SalesContactEmailAddress, @SalesContactTelephone, @SalesContactFaxNumber, @AccountsContactName, @AccountsContactDesignation, @AccountsContactCellNumber, @AccountsContactEmailAddress, @AccountsContactTelephone, @AccountsContactFaxNumber, @BankName, @BranchCode, @AccountNumber, @AccountType, @AccountHolderName, @BusinessPreviouslyExist, @PreviousBusinessName, @PreviousBusinessRegistration, @PostalAddress, @Declaration ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ServiceProvider] set [UnemployementInsuranceFundNumber] = @UnemployementInsuranceFundNumber, [UnemployementInsuranceFundDoc_NA] = @UnemployementInsuranceFundDoc_NA, [WorkmanCompensationFundNumber] = @WorkmanCompensationFundNumber, [WorkmanCompensationFundDoc_NA] = @WorkmanCompensationFundDoc_NA, [ProfessionalRegistrationNumber] = @ProfessionalRegistrationNumber, [ProfessionalRegistrationDoc_NA] = @ProfessionalRegistrationDoc_NA, [DisabilityDoc_NA] = @DisabilityDoc_NA, [IncomeTaxRegistrationNumber] = @IncomeTaxRegistrationNumber, [IncomeTaxRegistrationDoc_NA] = @IncomeTaxRegistrationDoc_NA, [BEECertificateDoc_NA] = @BEECertificateDoc_NA, [BEELevelID] = @BEELevelID   where [ServiceProviderID] = @ServiceProviderID; select  @ServiceProviderID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ServiceProviderID field for updates. 
                Command.Parameters.AddWithValue("@ServiceProviderID", ID);

            }
 
            Command.Parameters.AddWithValue("@UnemployementInsuranceFundNumber", UnemployementInsuranceFundNumber);

            Command.Parameters.AddWithValue("@UnemployementInsuranceFundDoc_NA", UnemployementInsuranceFundDoc_NA);

            Command.Parameters.AddWithValue("@WorkmanCompensationFundNumber", WorkmanCompensationFundNumber);

            Command.Parameters.AddWithValue("@WorkmanCompensationFundDoc_NA", WorkmanCompensationFundDoc_NA);

            Command.Parameters.AddWithValue("@ProfessionalRegistrationNumber", ProfessionalRegistrationNumber);

            Command.Parameters.AddWithValue("@ProfessionalRegistrationDoc_NA", ProfessionalRegistrationDoc_NA);

            Command.Parameters.AddWithValue("@DisabilityDoc_NA", DisabilityDoc_NA);

            Command.Parameters.AddWithValue("@IncomeTaxRegistrationNumber", IncomeTaxRegistrationNumber);

            Command.Parameters.AddWithValue("@IncomeTaxRegistrationDoc_NA", IncomeTaxRegistrationDoc_NA);

            Command.Parameters.AddWithValue("@TaxClearanceCertificateDoc_NA", TaxClearanceCertificateDoc_NA);

            Command.Parameters.AddWithValue("@BEECertificateDoc_NA", BEECertificateDoc_NA);

            Command.Parameters.AddWithValue("@BEELevelID", BEELevelID);

          

            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public string SaveSupplier3()
        {
            String ID = ServiceProviderID.ToString();


            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[ServiceProvider] ([BusinessOperationOther],  [CompanyRegistrationDoc_NA], [ProofOfShareHoldingDoc_NA], [ProofOfBankingDetailDoc_NA], [VatRegistrationNoDoc_NA], [PAYEDoc_NA], [UnemployementInsuranceFundNumber], [UnemployementInsuranceFundDoc_NA], [WorkmanCompensationFundNumber], [WorkmanCompensationFundDoc_NA], [ProfessionalRegistrationNumber], [ProfessionalRegistrationDoc_NA], [DisabilityDoc_NA], [IncomeTaxRegistrationNumber], [IncomeTaxRegistrationDoc_NA], [TaxClearanceCertificateDoc_NA], [BEECertificateDoc_NA], [BEELevelID], [BusinessOperationID], [AnnualAvarageTurnover], [GrossAssetValue], [EconomicSectorID], [TypeOfBusinessID], [FullTimePaidEmployees], [SMMEStatusID], [BusinessName], [PhysicalAddress], [City], [PhysicalAddressCode], [ProvinceID], [Telephone], [Fax], [Email], [WebPageAddress], [CorrespondenceEmail], [CorrespondencePost], [CorrespondenceFax], [ContactPersonTitle], [ContactPersonName], [ContactPersonSurname], [SalesContactName], [SalesContactDesignation], [SalesContactCellNumber], [SalesContactEmailAddress], [SalesContactTelephone], [SalesContactFaxNumber], [AccountsContactName], [AccountsContactDesignation], [AccountsContactCellNumber], [AccountsContactEmailAddress], [AccountsContactTelephone], [AccountsContactFaxNumber], [BankName], [BranchCode], [AccountNumber], [AccountType], [AccountHolderName], [BusinessPreviouslyExist], [PreviousBusinessName], [PreviousBusinessRegistration], [PostalAddress], [Declaration] ) VALUES (@BusinessOperationOther, @CompanyTypeOther, @CompanyTypeID,   @CompanyRegistrationDoc_NA, @ProofOfShareHoldingDoc_NA, @ProofOfBankingDetailDoc_NA, @VatRegistrationNoDoc_NA, @PAYEDoc_NA, @UnemployementInsuranceFundNumber, @UnemployementInsuranceFundDoc_NA, @WorkmanCompensationFundNumber, @WorkmanCompensationFundDoc_NA, @ProfessionalRegistrationNumber, @ProfessionalRegistrationDoc_NA, @DisabilityDoc_NA, @IncomeTaxRegistrationNumber, @IncomeTaxRegistrationDoc_NA, @TaxClearanceCertificateDoc_NA, @BEECertificateDoc_NA, @BEELevelID, @BusinessOperationID, @AnnualAvarageTurnover, @GrossAssetValue, @EconomicSectorID, @TypeOfBusinessID, @FullTimePaidEmployees, @SMMEStatusID, @BusinessName, @PhysicalAddress, @City, @PhysicalAddressCode, @ProvinceID, @Telephone, @Fax, @Email, @WebPageAddress, @CorrespondenceEmail, @CorrespondencePost, @CorrespondenceFax, @ContactPersonTitle, @ContactPersonName, @ContactPersonSurname, @SalesContactName, @SalesContactDesignation, @SalesContactCellNumber, @SalesContactEmailAddress, @SalesContactTelephone, @SalesContactFaxNumber, @AccountsContactName, @AccountsContactDesignation, @AccountsContactCellNumber, @AccountsContactEmailAddress, @AccountsContactTelephone, @AccountsContactFaxNumber, @BankName, @BranchCode, @AccountNumber, @AccountType, @AccountHolderName, @BusinessPreviouslyExist, @PreviousBusinessName, @PreviousBusinessRegistration, @PostalAddress, @Declaration ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ServiceProvider] set  [BusinessOperationID] = @BusinessOperationID, [AnnualAvarageTurnover] = @AnnualAvarageTurnover, [GrossAssetValue] = @GrossAssetValue, [EconomicSectorID] = @EconomicSectorID, [TypeOfBusinessID] = @TypeOfBusinessID, [FullTimePaidEmployees] = @FullTimePaidEmployees, [SMMEStatusID] = @SMMEStatusID  where [ServiceProviderID] = @ServiceProviderID; select  @ServiceProviderID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ServiceProviderID field for updates. 
                Command.Parameters.AddWithValue("@ServiceProviderID", ID);

            }

 
            Command.Parameters.AddWithValue("@BusinessOperationID", BusinessOperationID);

            Command.Parameters.AddWithValue("@BusinessOperationOther", BusinessOperationOther);

            Command.Parameters.AddWithValue("@AnnualAvarageTurnover", AnnualAvarageTurnover);


            Command.Parameters.AddWithValue("@GrossAssetValue", GrossAssetValue);

            Command.Parameters.AddWithValue("@EconomicSectorID", EconomicSectorID);


            Command.Parameters.AddWithValue("@TypeOfBusinessID", TypeOfBusinessID);

            Command.Parameters.AddWithValue("@FullTimePaidEmployees", FullTimePaidEmployees);

            Command.Parameters.AddWithValue("@SMMEStatusID", SMMEStatusID);

             
            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public string SaveSupplier4()
        {
            String ID = ServiceProviderID.ToString();


            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[ServiceProvider] ([BusinessOperationOther], [CompanyTypeOther], [CompanyTypeID], [BranchName], [CompanyRegistrationDoc_NA], [ProofOfShareHoldingDoc_NA], [ProofOfBankingDetailDoc_NA], [VatRegistrationNoDoc_NA], [PAYEDoc_NA], [UnemployementInsuranceFundNumber], [UnemployementInsuranceFundDoc_NA], [WorkmanCompensationFundNumber], [WorkmanCompensationFundDoc_NA], [ProfessionalRegistrationNumber], [ProfessionalRegistrationDoc_NA], [DisabilityDoc_NA], [IncomeTaxRegistrationNumber], [IncomeTaxRegistrationDoc_NA], [TaxClearanceCertificateDoc_NA], [BEECertificateDoc_NA], [BEELevelID], [BusinessOperationID], [AnnualAvarageTurnover], [GrossAssetValue], [EconomicSectorID], [TypeOfBusinessID], [FullTimePaidEmployees], [SMMEStatusID], [BusinessName], [PhysicalAddress], [City], [PhysicalAddressCode], [ProvinceID], [Telephone], [Fax], [Email], [WebPageAddress], [CorrespondenceEmail], [CorrespondencePost], [CorrespondenceFax], [ContactPersonTitle], [ContactPersonName], [ContactPersonSurname], [SalesContactName], [SalesContactDesignation], [SalesContactCellNumber], [SalesContactEmailAddress], [SalesContactTelephone], [SalesContactFaxNumber], [AccountsContactName], [AccountsContactDesignation], [AccountsContactCellNumber], [AccountsContactEmailAddress], [AccountsContactTelephone], [AccountsContactFaxNumber], [BankName], [BranchCode], [AccountNumber], [AccountType], [AccountHolderName], [BusinessPreviouslyExist], [PreviousBusinessName], [PreviousBusinessRegistration], [PostalAddress], [Declaration] ) VALUES (@BusinessOperationOther, @CompanyTypeOther, @CompanyTypeID, @BranchName, @CompanyRegistrationDoc_NA, @ProofOfShareHoldingDoc_NA, @ProofOfBankingDetailDoc_NA, @VatRegistrationNoDoc_NA, @PAYEDoc_NA, @UnemployementInsuranceFundNumber, @UnemployementInsuranceFundDoc_NA, @WorkmanCompensationFundNumber, @WorkmanCompensationFundDoc_NA, @ProfessionalRegistrationNumber, @ProfessionalRegistrationDoc_NA, @DisabilityDoc_NA, @IncomeTaxRegistrationNumber, @IncomeTaxRegistrationDoc_NA, @TaxClearanceCertificateDoc_NA, @BEECertificateDoc_NA, @BEELevelID, @BusinessOperationID, @AnnualAvarageTurnover, @GrossAssetValue, @EconomicSectorID, @TypeOfBusinessID, @FullTimePaidEmployees, @SMMEStatusID, @BusinessName, @PhysicalAddress, @City, @PhysicalAddressCode, @ProvinceID, @Telephone, @Fax, @Email, @WebPageAddress, @CorrespondenceEmail, @CorrespondencePost, @CorrespondenceFax, @ContactPersonTitle, @ContactPersonName, @ContactPersonSurname, @SalesContactName, @SalesContactDesignation, @SalesContactCellNumber, @SalesContactEmailAddress, @SalesContactTelephone, @SalesContactFaxNumber, @AccountsContactName, @AccountsContactDesignation, @AccountsContactCellNumber, @AccountsContactEmailAddress, @AccountsContactTelephone, @AccountsContactFaxNumber, @BankName, @BranchCode, @AccountNumber, @AccountType, @AccountHolderName, @BusinessPreviouslyExist, @PreviousBusinessName, @PreviousBusinessRegistration, @PostalAddress, @Declaration ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ServiceProvider] set  [BusinessName] = @BusinessName, [PhysicalAddress] = @PhysicalAddress, [City] = @City, [PhysicalAddressCode] = @PhysicalAddressCode, [ProvinceID] = @ProvinceID, [Telephone] = @Telephone, [Fax] = @Fax, [Email] = @Email, [WebPageAddress] = @WebPageAddress, [CorrespondenceEmail] = @CorrespondenceEmail, [CorrespondencePost] = @CorrespondencePost, [CorrespondenceFax] = @CorrespondenceFax, [ContactPersonTitle] = @ContactPersonTitle, [ContactPersonName] = @ContactPersonName, [ContactPersonSurname] = @ContactPersonSurname where [ServiceProviderID] = @ServiceProviderID; select  @ServiceProviderID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ServiceProviderID field for updates. 
                Command.Parameters.AddWithValue("@ServiceProviderID", ID);

            }
  
   
            Command.Parameters.AddWithValue("@BusinessName", BusinessName);

            Command.Parameters.AddWithValue("@PhysicalAddress", PhysicalAddress);

            Command.Parameters.AddWithValue("@City", City);

            Command.Parameters.AddWithValue("@PhysicalAddressCode", PhysicalAddressCode);

            Command.Parameters.AddWithValue("@ProvinceID", ProvinceID);

            Command.Parameters.AddWithValue("@Telephone", Telephone);

            Command.Parameters.AddWithValue("@Fax", Fax);

            Command.Parameters.AddWithValue("@Email", Email);

            Command.Parameters.AddWithValue("@WebPageAddress", WebPageAddress);

            Command.Parameters.AddWithValue("@CorrespondenceEmail", CorrespondenceEmail);

            Command.Parameters.AddWithValue("@CorrespondencePost", CorrespondencePost);

            Command.Parameters.AddWithValue("@CorrespondenceFax", CorrespondenceFax);

            Command.Parameters.AddWithValue("@ContactPersonTitle", ContactPersonTitle);

            Command.Parameters.AddWithValue("@ContactPersonName", ContactPersonName);

            Command.Parameters.AddWithValue("@ContactPersonSurname", ContactPersonSurname);

            

            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public string SaveSupplier5()
        {
            String ID = ServiceProviderID.ToString();


            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[ServiceProvider] ([SalesContactName], [SalesContactDesignation], [SalesContactCellNumber], [SalesContactEmailAddress], [SalesContactTelephone], [SalesContactFaxNumber], [AccountsContactName], [AccountsContactDesignation], [AccountsContactCellNumber], [AccountsContactEmailAddress], [AccountsContactTelephone], [AccountsContactFaxNumber], [BankName], [BranchName], [BranchCode], [AccountNumber], [AccountType], [AccountHolderName], [BusinessPreviouslyExist], [PreviousBusinessName], [PreviousBusinessRegistration]  ) VALUES (@SalesContactName, @SalesContactDesignation, @SalesContactCellNumber, @SalesContactEmailAddress, @SalesContactTelephone, @SalesContactFaxNumber, @AccountsContactName, @AccountsContactDesignation, @AccountsContactCellNumber, @AccountsContactEmailAddress, @AccountsContactTelephone, @AccountsContactFaxNumber, @BankName, @BranchName, @BranchCode, @AccountNumber, @AccountType, @AccountHolderName, @BusinessPreviouslyExist, @PreviousBusinessName, @PreviousBusinessRegistration ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ServiceProvider] set  [SalesContactName] = @SalesContactName, [SalesContactDesignation] = @SalesContactDesignation, [SalesContactCellNumber] = @SalesContactCellNumber, [SalesContactEmailAddress] = @SalesContactEmailAddress, [SalesContactTelephone] = @SalesContactTelephone, [SalesContactFaxNumber] = @SalesContactFaxNumber, [AccountsContactName] = @AccountsContactName, [AccountsContactDesignation] = @AccountsContactDesignation, [AccountsContactCellNumber] = @AccountsContactCellNumber, [AccountsContactEmailAddress] = @AccountsContactEmailAddress, [AccountsContactTelephone] = @AccountsContactTelephone, [AccountsContactFaxNumber] = @AccountsContactFaxNumber, [BankName] = @BankName, BranchName = @BranchName, [BranchCode] = @BranchCode, [AccountNumber] = @AccountNumber, [AccountType] = @AccountType, [AccountHolderName] = @AccountHolderName, [BusinessPreviouslyExist] = @BusinessPreviouslyExist, [PreviousBusinessName] = @PreviousBusinessName, [PreviousBusinessRegistration] = @PreviousBusinessRegistration  where [ServiceProviderID] = @ServiceProviderID; select  @ServiceProviderID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ServiceProviderID field for updates. 
                Command.Parameters.AddWithValue("@ServiceProviderID", ID);

            }
     
            Command.Parameters.AddWithValue("@SalesContactName", SalesContactName);

            Command.Parameters.AddWithValue("@SalesContactDesignation", SalesContactDesignation);

            Command.Parameters.AddWithValue("@SalesContactCellNumber", SalesContactCellNumber);

            Command.Parameters.AddWithValue("@SalesContactEmailAddress", SalesContactEmailAddress);

            Command.Parameters.AddWithValue("@SalesContactTelephone", SalesContactTelephone);

            Command.Parameters.AddWithValue("@SalesContactFaxNumber", SalesContactFaxNumber);

            Command.Parameters.AddWithValue("@AccountsContactName", AccountsContactName);

            Command.Parameters.AddWithValue("@AccountsContactDesignation", AccountsContactDesignation);

            Command.Parameters.AddWithValue("@AccountsContactCellNumber", AccountsContactCellNumber);

            Command.Parameters.AddWithValue("@AccountsContactEmailAddress", AccountsContactEmailAddress);

            Command.Parameters.AddWithValue("@AccountsContactTelephone", AccountsContactTelephone);

            Command.Parameters.AddWithValue("@AccountsContactFaxNumber", AccountsContactFaxNumber);

            Command.Parameters.AddWithValue("@BankName", BankName);

            Command.Parameters.AddWithValue("@BranchName", BranchName);

            Command.Parameters.AddWithValue("@BranchCode", BranchCode);

            Command.Parameters.AddWithValue("@AccountNumber", AccountNumber);

            Command.Parameters.AddWithValue("@AccountType", AccountType);

            Command.Parameters.AddWithValue("@AccountHolderName", AccountHolderName);

            Command.Parameters.AddWithValue("@BusinessPreviouslyExist", BusinessPreviouslyExist);

            Command.Parameters.AddWithValue("@PreviousBusinessName", PreviousBusinessName);

            Command.Parameters.AddWithValue("@PreviousBusinessRegistration", PreviousBusinessRegistration);

 

            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public string SaveSupplier6()
        {
            String ID = ServiceProviderID.ToString();


            //Create a new connection to the database
            SqlConnection Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString);

            //Opens a connection to the database.
            Connection.Open();

            // 
            //Declare SqlCommand Object named Command 
            //To be used to invoke the Update or Insert statements 
            SqlCommand Command;

            // 
            //Declare string InsertSQL 
            String InsertSQL = "Insert into [dbo].[ServiceProvider] ([BusinessOperationOther], [CompanyTypeOther], [CompanyTypeID], [BranchName], [CompanyRegistrationDoc_NA], [ProofOfShareHoldingDoc_NA], [ProofOfBankingDetailDoc_NA], [VatRegistrationNoDoc_NA], [PAYEDoc_NA], [UnemployementInsuranceFundNumber], [UnemployementInsuranceFundDoc_NA], [WorkmanCompensationFundNumber], [WorkmanCompensationFundDoc_NA], [ProfessionalRegistrationNumber], [ProfessionalRegistrationDoc_NA], [DisabilityDoc_NA], [IncomeTaxRegistrationNumber], [IncomeTaxRegistrationDoc_NA], [TaxClearanceCertificateDoc_NA], [BEECertificateDoc_NA], [BEELevelID], [BusinessOperationID], [AnnualAvarageTurnover], [GrossAssetValue], [EconomicSectorID], [TypeOfBusinessID], [FullTimePaidEmployees], [SMMEStatusID], [BusinessName], [PhysicalAddress], [City], [PhysicalAddressCode], [ProvinceID], [Telephone], [Fax], [Email], [WebPageAddress], [CorrespondenceEmail], [CorrespondencePost], [CorrespondenceFax], [ContactPersonTitle], [ContactPersonName], [ContactPersonSurname], [SalesContactName], [SalesContactDesignation], [SalesContactCellNumber], [SalesContactEmailAddress], [SalesContactTelephone], [SalesContactFaxNumber], [AccountsContactName], [AccountsContactDesignation], [AccountsContactCellNumber], [AccountsContactEmailAddress], [AccountsContactTelephone], [AccountsContactFaxNumber], [BankName], [BranchCode], [AccountNumber], [AccountType], [AccountHolderName], [BusinessPreviouslyExist], [PreviousBusinessName], [PreviousBusinessRegistration], [PostalAddress], [Declaration] ) VALUES (@BusinessOperationOther, @CompanyTypeOther, @CompanyTypeID, @BranchName, @CompanyRegistrationDoc_NA, @ProofOfShareHoldingDoc_NA, @ProofOfBankingDetailDoc_NA, @VatRegistrationNoDoc_NA, @PAYEDoc_NA, @UnemployementInsuranceFundNumber, @UnemployementInsuranceFundDoc_NA, @WorkmanCompensationFundNumber, @WorkmanCompensationFundDoc_NA, @ProfessionalRegistrationNumber, @ProfessionalRegistrationDoc_NA, @DisabilityDoc_NA, @IncomeTaxRegistrationNumber, @IncomeTaxRegistrationDoc_NA, @TaxClearanceCertificateDoc_NA, @BEECertificateDoc_NA, @BEELevelID, @BusinessOperationID, @AnnualAvarageTurnover, @GrossAssetValue, @EconomicSectorID, @TypeOfBusinessID, @FullTimePaidEmployees, @SMMEStatusID, @BusinessName, @PhysicalAddress, @City, @PhysicalAddressCode, @ProvinceID, @Telephone, @Fax, @Email, @WebPageAddress, @CorrespondenceEmail, @CorrespondencePost, @CorrespondenceFax, @ContactPersonTitle, @ContactPersonName, @ContactPersonSurname, @SalesContactName, @SalesContactDesignation, @SalesContactCellNumber, @SalesContactEmailAddress, @SalesContactTelephone, @SalesContactFaxNumber, @AccountsContactName, @AccountsContactDesignation, @AccountsContactCellNumber, @AccountsContactEmailAddress, @AccountsContactTelephone, @AccountsContactFaxNumber, @BankName, @BranchCode, @AccountNumber, @AccountType, @AccountHolderName, @BusinessPreviouslyExist, @PreviousBusinessName, @PreviousBusinessRegistration, @PostalAddress, @Declaration ); select Scope_identity();  ";

            // 
            //Declare String UpdateSQL 
            String UpdateSQL = "Update [dbo].[ServiceProvider] set [RepresentativeCapacity] = @RepresentativeCapacity, [RepresentativeName] = @RepresentativeName, [Declaration] = @Declaration where [ServiceProviderID] = @ServiceProviderID; select  @ServiceProviderID; ";

            // 
            //if ID > 0 run the update 
            //if ID = 0 run the Insert
            if (String.IsNullOrEmpty(ID) || ID == "0")
            {
                // 
                //Create a new Command object for inserting a new record. 
                Command = new SqlCommand(InsertSQL, Connection);
                // 
                //We are doing an insert 
            }
            else
            {
                // 
                //Set the command object with the update sql and connection. 
                Command = new SqlCommand(UpdateSQL, Connection);
                // 
                //Set the @ServiceProviderID field for updates. 
                Command.Parameters.AddWithValue("@ServiceProviderID", ID);

            }

            Command.Parameters.AddWithValue("@RepresentativeCapacity", RepresentativeCapacity);

            Command.Parameters.AddWithValue("@RepresentativeName", RepresentativeName);

            Command.Parameters.AddWithValue("@Declaration", Declaration);

            // 
            //Run the sql command against the database with no return values 
            // 
            //Run the statement
            ID = Convert.ToString(Command.ExecuteScalar());

            //Close the Connection Object 
            Connection.Close();
            // 
            //Go to the Summary page 
            return ID;
        }

        public void SaveSupplierDocument(string DocumentCategoryID, string name, string contentType, int size, byte[] data, string ServiceProviderID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("IF(Select Count(*) From [ServiceProviderDocument] Where [ServiceProviderID]  =@ServiceProviderID and [DocumentCategoryID] = @DocumentCategoryID)=0 Begin Insert into [ServiceProviderDocument]([DocumentName], [ContentType], [Size], [Data], [ServiceProviderID], [DocumentCategoryID])values(@DocumentName,@ContentType, @Size, @Data, @ServiceProviderID, @DocumentCategoryID) End", connection))
                {
                    SqlParameter DocumentNameParameter = new SqlParameter("@DocumentName", System.Data.SqlDbType.VarChar, 500);
                    DocumentNameParameter.Value = name;
                    SqlParameter ContentTypeParameter = new SqlParameter("@ContentType", System.Data.SqlDbType.VarChar, 150);
                    ContentTypeParameter.Value = contentType;
                    SqlParameter SizeParameter = new SqlParameter("@Size", System.Data.SqlDbType.BigInt);
                    SizeParameter.Value = size;
                    SqlParameter DataParameter = new SqlParameter("@Data", System.Data.SqlDbType.VarBinary);
                    DataParameter.Value = data;
                    SqlParameter ReferenceIDParameter = new SqlParameter("@ServiceProviderID", System.Data.SqlDbType.Int, 20);
                    ReferenceIDParameter.Value = ServiceProviderID;
                    SqlParameter DocumentCategoryIDParameter = new SqlParameter("@DocumentCategoryID", System.Data.SqlDbType.Int, 20);
                    DocumentCategoryIDParameter.Value = DocumentCategoryID;
                    command.Parameters.AddRange(new SqlParameter[] { DocumentNameParameter, ContentTypeParameter, SizeParameter, DataParameter, ReferenceIDParameter, DocumentCategoryIDParameter });
                    command.ExecuteNonQuery();
                }
            }

        }
    }
}
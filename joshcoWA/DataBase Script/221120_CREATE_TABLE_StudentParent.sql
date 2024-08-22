

CREATE TABLE [dbo].[Student_Parent](
	[StudentParentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
	[ReferenceNo] [nvarchar](50) NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[IdentificationNumber] [nvarchar](20) NOT NULL,
	[ResidentialAddress] [nvarchar](200) NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[MobileNumber] [nvarchar](20) NOT NULL,
	[CurrentEmployer] [nvarchar](10) NULL,
	[MonthlyIncome] [decimal](18, 2) NOT NULL,
	[Bank] [nvarchar](100) NULL,
	[AccountNumber] [nvarchar](20) NULL,
	[BillingDay] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO



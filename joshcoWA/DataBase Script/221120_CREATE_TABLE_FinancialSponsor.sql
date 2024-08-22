

CREATE TABLE [dbo].[Student_FinancialSponsor](
	[StudentFinancialSponsoerID] [int] IDENTITY(1,1) NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
	[FinancialSponsorType] [nvarchar](200) NOT NULL,
	[FinancialSponsorDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student_FinancialSponsor] PRIMARY KEY CLUSTERED 
(
	[StudentFinancialSponsoerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



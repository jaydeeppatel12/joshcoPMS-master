

CREATE TABLE [dbo].[Student_Sponsor](
	[StudentSponsorID] [int] IDENTITY(1,1) NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
	[StudentSponsorName] [nvarchar](100) NULL,
	[StudentSponsorContactNumber] [nvarchar](20) NULL,
	[StudentSponsorEmailAddress] [nvarchar](100) NULL,
	[FundingType] [int] NOT NULL,
 CONSTRAINT [PK_Student_Sponsor] PRIMARY KEY CLUSTERED 
(
	[StudentSponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


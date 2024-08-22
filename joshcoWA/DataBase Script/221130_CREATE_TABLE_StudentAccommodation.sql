
CREATE TABLE [dbo].[Student_Accommodation](
	[StudentAccommodationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentAccommodationName] [varchar](150) NULL,
	[Address] [varchar](500) NULL,
	[AddressCode] [int] NULL,
	[PostalAddress] [varchar](500) NULL,
	[PostalAddressCode] [int] NULL,
	[Telephone] [varchar](10) NULL,
	[Fax] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
	[Long] [varchar](50) NULL,
	[Lat] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StudentAccommodationArea] [decimal](18, 4) NULL,
	[ProfilePic] [int] NULL,
	[ErfNo] [varchar](10) NULL,
	[PortionNo] [varchar](10) NULL,
 CONSTRAINT [PK_Student_Accommodation] PRIMARY KEY CLUSTERED 
(
	[StudentAccommodationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


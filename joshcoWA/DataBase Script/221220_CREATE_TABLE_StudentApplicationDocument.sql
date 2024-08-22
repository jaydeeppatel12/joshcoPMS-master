

CREATE TABLE [dbo].[Student_ApplicationDocument](
	[StudentApplicationDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentCategoryID] [int] NOT NULL,
	[DocumentName] [varchar](500) NOT NULL,
	[ContentType] [varchar](150) NOT NULL,
	[Size] [bigint] NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_Student_ApplicantDocument] PRIMARY KEY CLUSTERED 
(
	[StudentApplicationDocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



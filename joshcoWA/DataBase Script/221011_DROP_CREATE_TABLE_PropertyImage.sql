﻿USE [joshco_pms]
GO

/****** Object:  Table [dbo].[PropertyImage]    Script Date: 2022/10/11 12:40:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP TABLE [dbo].[PropertyImage]
CREATE TABLE [dbo].[PropertyImage](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[ImageFileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_PropertyImage_] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

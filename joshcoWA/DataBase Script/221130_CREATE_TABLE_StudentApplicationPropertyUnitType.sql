USE [joshco_pms]
GO

/****** Object:  Table [dbo].[Student_ApplicationPropertyUnitType]    Script Date: 2022/12/04 02:48:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_ApplicationPropertyUnitType]') AND type in (N'U'))
DROP TABLE [dbo].[Student_ApplicationPropertyUnitType]
GO

/****** Object:  Table [dbo].[Student_ApplicationPropertyUnitType]    Script Date: 2022/12/04 02:48:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student_ApplicationPropertyUnitType](
	[StudentApplicationID] [int] NOT NULL,
	[StudentAccommodationID] [int] NOT NULL,
	[StudentPropertyUnitTypeID] [int] NOT NULL
) ON [PRIMARY]
GO

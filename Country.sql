USE [Country]
GO
/****** Object:  Table [dbo].[AdresaPersoana]    Script Date: 7/8/2016 12:56:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdresaPersoana](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdresaID] [int] NOT NULL,
	[PersoanaID] [int] NOT NULL,
	[TipAdresa] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdresaPersoana] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adrese]    Script Date: 7/8/2016 12:56:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adrese](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocalitateID] [int] NOT NULL,
	[JudetID] [int] NOT NULL,
	[Strada] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adrese] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Judete]    Script Date: 7/8/2016 12:56:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Judete](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[CodJudet] [varchar](2) NULL,
 CONSTRAINT [PK_Judete] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localitati]    Script Date: 7/8/2016 12:56:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localitati](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JudetID] [int] NOT NULL,
	[Nume] [nvarchar](50) NULL,
 CONSTRAINT [PK_Localitati] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persoane]    Script Date: 7/8/2016 12:56:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persoane](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[Prenume] [nvarchar](50) NULL,
 CONSTRAINT [PK_Persoane] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AdresaPersoana]  WITH CHECK ADD  CONSTRAINT [FK_AdresaPersoana_Adrese] FOREIGN KEY([AdresaID])
REFERENCES [dbo].[Adrese] ([ID])
GO
ALTER TABLE [dbo].[AdresaPersoana] CHECK CONSTRAINT [FK_AdresaPersoana_Adrese]
GO
ALTER TABLE [dbo].[AdresaPersoana]  WITH CHECK ADD  CONSTRAINT [FK_AdresaPersoana_Persoane] FOREIGN KEY([PersoanaID])
REFERENCES [dbo].[Persoane] ([ID])
GO
ALTER TABLE [dbo].[AdresaPersoana] CHECK CONSTRAINT [FK_AdresaPersoana_Persoane]
GO
ALTER TABLE [dbo].[Adrese]  WITH CHECK ADD  CONSTRAINT [FK_Adrese_Judete] FOREIGN KEY([JudetID])
REFERENCES [dbo].[Judete] ([ID])
GO
ALTER TABLE [dbo].[Adrese] CHECK CONSTRAINT [FK_Adrese_Judete]
GO
ALTER TABLE [dbo].[Adrese]  WITH CHECK ADD  CONSTRAINT [FK_Adrese_Localitati] FOREIGN KEY([LocalitateID])
REFERENCES [dbo].[Localitati] ([ID])
GO
ALTER TABLE [dbo].[Adrese] CHECK CONSTRAINT [FK_Adrese_Localitati]
GO
ALTER TABLE [dbo].[Localitati]  WITH CHECK ADD  CONSTRAINT [FK_Localitati_Judete] FOREIGN KEY([JudetID])
REFERENCES [dbo].[Judete] ([ID])
GO
ALTER TABLE [dbo].[Localitati] CHECK CONSTRAINT [FK_Localitati_Judete]
GO

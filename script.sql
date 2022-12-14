USE [GSB_gesAMM]
GO
/****** Object:  Database [GSB_gesAMM]    Script Date: 04/01/2023 15:18:41 ******/
CREATE DATABASE [GSB_gesAMM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GSB_gesAMM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GSB_gesAMM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GSB_gesAMM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GSB_gesAMM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GSB_gesAMM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GSB_gesAMM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GSB_gesAMM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET ARITHABORT OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GSB_gesAMM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GSB_gesAMM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GSB_gesAMM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GSB_gesAMM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GSB_gesAMM] SET  MULTI_USER 
GO
ALTER DATABASE [GSB_gesAMM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GSB_gesAMM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GSB_gesAMM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GSB_gesAMM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GSB_gesAMM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GSB_gesAMM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GSB_gesAMM] SET QUERY_STORE = OFF
GO
USE [GSB_gesAMM]
GO
/****** Object:  Table [dbo].[DECISION]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DECISION](
	[DCS_ID] [int] IDENTITY(1,1) NOT NULL,
	[DCS_LIBELLE] [varchar](50) NOT NULL,
 CONSTRAINT [PK1] PRIMARY KEY CLUSTERED 
(
	[DCS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETAPE]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETAPE](
	[ETP_NUM] [int] IDENTITY(1,1) NOT NULL,
	[ETP_LIBELLE] [varchar](500) NOT NULL,
 CONSTRAINT [PK4] PRIMARY KEY CLUSTERED 
(
	[ETP_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETAPE_NORME]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETAPE_NORME](
	[NORME] [varchar](500) NULL,
	[NORME_DATE] [date] NOT NULL,
	[ETAPE_ETP_NUM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILLE]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILLE](
	[FAM_CODE] [varchar](50) NOT NULL,
	[FAM_LIBELLE] [varchar](500) NULL,
	[FAM_NB_MEDI_AMM] [varchar](500) NULL,
 CONSTRAINT [PK2] PRIMARY KEY CLUSTERED 
(
	[FAM_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORIQUE]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORIQUE](
	[HIST_ID] [int] IDENTITY(1,1) NOT NULL,
	[HIST_USR] [varchar](50) NOT NULL,
	[HIST_ETP_AV] [int] NOT NULL,
	[HIST_DATE_AV] [date] NOT NULL,
	[HIST_DATE_AP] [date] NOT NULL,
	[HIST_NORME_AV] [varchar](30) NULL,
	[HIST_NORME_AP] [varchar](30) NULL,
 CONSTRAINT [PK6] PRIMARY KEY CLUSTERED 
(
	[HIST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICAMENT]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICAMENT](
	[MED_DEPOTLEGAL] [varchar](5000) NOT NULL,
	[MED_NOMCOMMERCIAL] [varchar](5000) NULL,
	[FAM_CODE] [varchar](5000) NULL,
	[MED_COMPOSITION] [varchar](5000) NULL,
	[MED_EFFETS] [varchar](5000) NULL,
	[MED_CONTREINDIC] [varchar](5000) NULL,
	[MED_PRIXECHANTILLON] [varchar](5000) NULL,
 CONSTRAINT [PK3] PRIMARY KEY CLUSTERED 
(
	[MED_DEPOTLEGAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKFLOW]    Script Date: 04/01/2023 15:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKFLOW](
	[WRK_MED_DEPOT] [varchar](5000) NOT NULL,
	[WRK_ETP_NUM] [int] NOT NULL,
	[WRK_DCS_ID] [int] NOT NULL,
	[WRK_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK5] PRIMARY KEY CLUSTERED 
(
	[WRK_MED_DEPOT] ASC,
	[WRK_ETP_NUM] ASC,
	[WRK_DATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DECISION] ON 

INSERT [dbo].[DECISION] ([DCS_ID], [DCS_LIBELLE]) VALUES (1, N'Validé')
INSERT [dbo].[DECISION] ([DCS_ID], [DCS_LIBELLE]) VALUES (2, N'Refusé')
INSERT [dbo].[DECISION] ([DCS_ID], [DCS_LIBELLE]) VALUES (1003, N'En cours...')
SET IDENTITY_INSERT [dbo].[DECISION] OFF
GO
SET IDENTITY_INSERT [dbo].[ETAPE] ON 

INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (1, N'Définition du protocole de validation')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (2, N'Pharmacologie expérimentale')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (3, N'Toxicologie')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (4, N'Pharmacocinétique')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (5, N'Expérimentation animale')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (6, N'Méthodes alternatives')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (7, N'Essais cliniques')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (8, N'Autorisation Mise sur le Marché')
SET IDENTITY_INSERT [dbo].[ETAPE] OFF
GO
INSERT [dbo].[ETAPE_NORME] ([NORME], [NORME_DATE], [ETAPE_ETP_NUM]) VALUES (N'726/2004/CEE', CAST(N'2004-05-12' AS Date), 3)
INSERT [dbo].[ETAPE_NORME] ([NORME], [NORME_DATE], [ETAPE_ETP_NUM]) VALUES (N'180/2012/CEE', CAST(N'2022-12-29' AS Date), 5)
INSERT [dbo].[ETAPE_NORME] ([NORME], [NORME_DATE], [ETAPE_ETP_NUM]) VALUES (N'457/2008/CEE', CAST(N'2008-03-15' AS Date), 7)
INSERT [dbo].[ETAPE_NORME] ([NORME], [NORME_DATE], [ETAPE_ETP_NUM]) VALUES (N'665/2005/CEE', CAST(N'2005-04-30' AS Date), 8)
GO
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AA', N'Antalgiques en association', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AAA', N'Antalgiques antipyrétiques en association', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AAC', N'Antidépresseur d''action centrale', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AAH', N'Antivertigineux antihistaminique H1', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'ABA', N'Antibiotique antituberculeux', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'ABC', N'Antibiotique antiacnéique local', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'ABP', N'Antibiotique de la famille des béta-lactamines (pénicilline A)', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AFC', N'Antibiotique de la famille des cyclines', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AFM', N'Antibiotique de la famille des macrolides', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AH', N'Antihistaminique H1 local', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AIM', N'Antidépresseur imipraminique (tricyclique)', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AIN', N'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'ALO', N'Antibiotique local (ORL)', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'ANS', N'Antidépresseur IMAO non sélectif', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AO', N'Antibiotique ophtalmique', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AP', N'Antipsychotique normothymique', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'AUM', N'Antibiotique urinaire minute', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'CRT', N'Corticoïde, antibiotique et antifongique à  usage local', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'HYP', N'Hypnotique antihistaminique', N'0')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE], [FAM_NB_MEDI_AMM]) VALUES (N'PSA', N'Psychostimulant, antiasthénique', N'0')
GO
SET IDENTITY_INSERT [dbo].[HISTORIQUE] ON 

INSERT [dbo].[HISTORIQUE] ([HIST_ID], [HIST_USR], [HIST_ETP_AV], [HIST_DATE_AV], [HIST_DATE_AP], [HIST_NORME_AV], [HIST_NORME_AP]) VALUES (1, N'a', 5, CAST(N'2012-01-05' AS Date), CAST(N'2022-12-13' AS Date), NULL, NULL)
INSERT [dbo].[HISTORIQUE] ([HIST_ID], [HIST_USR], [HIST_ETP_AV], [HIST_DATE_AV], [HIST_DATE_AP], [HIST_NORME_AV], [HIST_NORME_AP]) VALUES (2, N'a', 5, CAST(N'2022-12-13' AS Date), CAST(N'2022-12-13' AS Date), N'180/2012/CEE', N'180/2012/CEE2')
INSERT [dbo].[HISTORIQUE] ([HIST_ID], [HIST_USR], [HIST_ETP_AV], [HIST_DATE_AV], [HIST_DATE_AP], [HIST_NORME_AV], [HIST_NORME_AP]) VALUES (3, N'a', 5, CAST(N'2022-12-13' AS Date), CAST(N'2022-12-29' AS Date), N'180/2012/CEE2', N'180/2012/CEE')
INSERT [dbo].[HISTORIQUE] ([HIST_ID], [HIST_USR], [HIST_ETP_AV], [HIST_DATE_AV], [HIST_DATE_AP], [HIST_NORME_AV], [HIST_NORME_AP]) VALUES (4, N'a', 5, CAST(N'2022-12-29' AS Date), CAST(N'2022-12-29' AS Date), N'180/2012/CEE', N'180/2012/CEE')
SET IDENTITY_INSERT [dbo].[HISTORIQUE] OFF
GO
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'3MYC7', N'TRIMYCINE', N'CRT', N'Triamcinolone (acétonide) + Néomycine + Nystatine', N'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''infections de la peau ou de parasitisme non traités, d''acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'ADIMOL9', N'ADIMOL', N'ABP', N'Amoxicilline + Acide clavulanique', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines ou aux céphalosporines.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'AMOPIL7', N'AMOPIL', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'AMOX45', N'AMOXAR', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'AMOXIG12', N'AMOXI Gé', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'APATOUX22', N'APATOUX Vitamine C', N'ALO', N'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', N'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, en cas de phénylcétonurie et chez l''enfant de moins de 6 ans.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'BACTIG10', N'BACTIGEL', N'ABC', N'Erythromycine', N'Ce médicament est utilisé en application locale pour traiter l''acné et les infections cutanées bactériennes associées.', N'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'BACTIV13', N'BACTIVIL', N'AFM', N'Erythromycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'BITALV', N'BIVALIC', N'AAA', N'Dextropropoxyphène + Paracétamol', N'Ce médicament est utilisé pour traiter les douleurs d''intensité modérée ou intense.', N'Ce médicament est contre-indiqué en cas d''allergie aux médicaments de cette famille, d''insuffisance hépatique ou d''insuffisance rénale.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'CARTION6', N'CARTION', N'AAA', N'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', N'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', N'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d''ulcère gastroduodénal, maladies graves du foie.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'CLAZER6', N'CLAZER', N'AFM', N'Clarithromycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l''ulcère gastro-duodénal, en association avec d''autres médicaments.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'DEPRIL9', N'DEPRAMIL', N'AIM', N'Clomipramine', N'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l''enfant.', N'Ce médicament est contre-indiqué en cas de glaucome ou d''adénome de la prostate, d''infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d''allergie aux antidépresseurs imipraminiques.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'DIMIRTAM6', N'DIMIRTAM', N'AAC', N'Mirtazapine', N'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', N'La prise de ce produit est contre-indiquée en cas de d''allergie à  l''un des constituants.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'DOLRIL7', N'DOLORIL', N'AAA', N'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', N'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', N'Ce médicament est contre-indiqué en cas d''allergie au paracétamol ou aux salicylates.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'DORNOM8', N'NORMADOR', N'HYP', N'Doxylamine', N'Ce médicament est utilisé pour traiter l''insomnie chez l''adulte.', N'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l''enfant de moins de 15 ans.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'EQUILARX6', N'EQUILAR', N'AAH', N'Méclozine', N'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', N'Ce médicament ne doit pas être utilisé en cas d''allergie au produit, en cas de glaucome ou de rétention urinaire.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'EVILR7', N'EVEILLOR', N'PSA', N'Adrafinil', N'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'INSXT5', N'INSECTIL', N'AH', N'Diphénydramine', N'Ce médicament est utilisé en application locale sur les piqûres d''insecte et l''urticaire.', N'Ce médicament est contre-indiqué en cas d''allergie aux antihistaminiques.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'JOVAI8', N'JOVENIL', N'AFM', N'Josamycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'LIDOXY23', N'LIDOXYTRACINE', N'AFC', N'Oxytétracycline +Lidocaïne', N'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants. Il ne doit pas être associé aux rétinoïdes.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'LITHOR12', N'LITHORINE', N'AP', N'Lithium', N'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', N'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d''insuffisance rénale, ou si vous avez un régime sans sel.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'PARMOL16', N'PARMOCODEINE', N'AA', N'Codéine + Paracétamol', N'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, chez l''enfant de moins de 15 Kg, en cas d''insuffisance hépatique ou respiratoire, d''asthme, de phénylcétonurie et chez la femme qui allaite.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'PHYSOI8', N'PHYSICOR', N'PSA', N'Sulbutiamine', N'Ce médicament est utilisé pour traiter les baisses d''activité physique ou psychique, souvent dans un contexte de dépression.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'PIRIZ8', N'PIRIZAN', N'ABA', N'Pyrazinamide', N'Ce médicament est utilisé, en association à  d''autres antibiotiques, pour traiter la tuberculose.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''insuffisance rénale ou hépatique, d''hyperuricémie ou de porphyrie.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'POMDI20', N'POMADINE', N'AO', N'Bacitracine', N'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l''oeil.', N'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques appliqués localement.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'TROXT21', N'TROXADET', N'AIN', N'Paroxétine', N'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', N'Ce médicament est contre-indiqué en cas d''allergie au produit.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'TXISOL22', N'TOUXISOL Vitamine C', N'ALO', N'Tyrothricine + Acide ascorbique (Vitamine C)', N'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants et chez l''enfant de moins de 6 ans.', N'')
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON]) VALUES (N'URIEG6', N'URIREGUL', N'AUM', N'Fosfomycine trométamol', N'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', N'La prise de ce médicament est contre-indiquée en cas d''allergie à  l''un des constituants et d''insuffisance rénale.', N'')
GO
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'3MYC7', 1, 1, CAST(N'2022-12-02T14:13:47.573' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'3MYC7', 2, 1, CAST(N'2022-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'3MYC7', 3, 1, CAST(N'2022-12-06T16:42:36.570' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'3MYC7', 4, 1, CAST(N'2022-12-09T17:37:39.540' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'3MYC7', 5, 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'3MYC7', 6, 1003, CAST(N'2022-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'ADIMOL9', 1, 2, CAST(N'2022-12-02T14:14:07.077' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'AMOPIL7', 1, 1, CAST(N'2022-12-02T14:14:16.623' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'AMOPIL7', 2, 2, CAST(N'2022-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'AMOX45', 1, 2, CAST(N'2022-12-02T14:14:26.793' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'AMOXIG12', 1, 1003, CAST(N'2022-12-02T14:14:38.637' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'APATOUX22', 1, 1003, CAST(N'2022-12-02T14:14:44.270' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'BACTIG10', 1, 1003, CAST(N'2022-12-02T14:14:49.477' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'BACTIV13', 1, 1003, CAST(N'2022-12-02T14:14:55.877' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'BITALV', 1, 1003, CAST(N'2022-12-02T14:15:01.857' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'CARTION6', 1, 1003, CAST(N'2022-12-02T14:15:05.880' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'CLAZER6', 1, 1003, CAST(N'2022-12-02T14:15:11.697' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'DEPRIL9', 1, 1003, CAST(N'2022-12-02T14:15:15.590' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'DIMIRTAM6', 1, 1003, CAST(N'2022-12-02T14:15:20.283' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'DOLRIL7', 1, 1003, CAST(N'2022-12-02T14:15:24.100' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'DORNOM8', 1, 1003, CAST(N'2022-12-02T14:15:27.890' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'EQUILARX6', 1, 1003, CAST(N'2022-12-02T14:15:33.080' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'EVILR7', 1, 1003, CAST(N'2022-12-02T14:15:36.937' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'INSXT5', 1, 1003, CAST(N'2022-12-02T14:15:40.467' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'JOVAI8', 1, 1003, CAST(N'2022-12-02T14:15:44.117' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'LIDOXY23', 1, 1003, CAST(N'2022-12-02T14:15:49.297' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'LITHOR12', 1, 1003, CAST(N'2022-12-02T14:15:53.340' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'PARMOL16', 1, 1003, CAST(N'2022-12-02T14:15:56.823' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'PHYSOI8', 1, 1003, CAST(N'2022-12-02T14:16:00.250' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'PIRIZ8', 1, 1003, CAST(N'2022-12-02T14:16:05.077' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'POMDI20', 1, 1003, CAST(N'2022-12-02T14:16:08.753' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'TROXT21', 1, 1003, CAST(N'2022-12-02T14:16:13.727' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'TXISOL22', 1, 1, CAST(N'2022-12-02T14:16:17.580' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'TXISOL22', 2, 1003, CAST(N'2022-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[WORKFLOW] ([WRK_MED_DEPOT], [WRK_ETP_NUM], [WRK_DCS_ID], [WRK_DATE]) VALUES (N'URIEG6', 1, 2, CAST(N'2022-12-02T14:16:22.280' AS DateTime))
GO
ALTER TABLE [dbo].[ETAPE_NORME]  WITH CHECK ADD  CONSTRAINT [FK1] FOREIGN KEY([ETAPE_ETP_NUM])
REFERENCES [dbo].[ETAPE] ([ETP_NUM])
GO
ALTER TABLE [dbo].[ETAPE_NORME] CHECK CONSTRAINT [FK1]
GO
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [FK2] FOREIGN KEY([WRK_MED_DEPOT])
REFERENCES [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [FK2]
GO
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [FK3] FOREIGN KEY([WRK_ETP_NUM])
REFERENCES [dbo].[ETAPE] ([ETP_NUM])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [FK3]
GO
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [FK4] FOREIGN KEY([WRK_DCS_ID])
REFERENCES [dbo].[DECISION] ([DCS_ID])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [FK4]
GO
/****** Object:  StoredProcedure [dbo].[prc_ajoutEtapeWorkflow]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_ajoutEtapeWorkflow] (@depot as Varchar(20), @etpNum as int, @dcsNum as int, @date as Date) 
AS
BEGIN
	SET NOCOUNT ON;
	IF @dcsNum = 2
	BEGIN
		UPDATE WORKFLOW SET WRK_DCS_ID = 2 WHERE WRK_MED_DEPOT = @depot AND WRK_ETP_NUM = @etpNum;
	END
	ELSE
	BEGIN
		UPDATE WORKFLOW SET WRK_DCS_ID = 1 WHERE WRK_MED_DEPOT = @depot AND WRK_ETP_NUM = @etpNum;
		INSERT INTO WORKFLOW(WRK_MED_DEPOT, WRK_ETP_NUM, WRK_DCS_ID, WRK_DATE) VALUES (@depot, @etpNum + 1, @dcsNum, @date);
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_etapes_workflow]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:    <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_etapes_workflow]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

 

    SELECT WRK_MED_DEPOT, WRK_ETP_NUM, WRK_DCS_ID, WRK_DATE
    FROM WORKFLOW
END

GO
/****** Object:  StoredProcedure [dbo].[prc_getEtapes]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_getEtapes] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ETP_NUM, ETP_LIBELLE, NORME, NORME_DATE
	FROM ETAPE
	LEFT JOIN ETAPE_NORME
	ON ETP_NUM = ETAPE_ETP_NUM
END
GO
/****** Object:  StoredProcedure [dbo].[prc_getInsertMed]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:    <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_getInsertMed] (@dpt varchar(50), @nomMed varchar(50), @fam varchar(50), @compo varchar(50), @effets varchar(50), @contreIndi varchar(50))
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

 

    IF not exists (SELECT FAM_CODE FROM FAMILLE WHERE FAM_CODE = @fam)
    BEGIN
        PRINT 'Erreur, le code famille est incorrect'
        RETURN
    END

 

    IF exists (SELECT MED_DEPOTLEGAL FROM MEDICAMENT WHERE MED_DEPOTLEGAL = @dpt)
    BEGIN
        PRINT 'Erreur, le dépôt légal n est pas unique'
        RETURN
    END

 

    INSERT INTO MEDICAMENT
    VALUES (@dpt, @nomMed, @fam, @compo, @effets, @contreIndi, '0')

 

    INSERT INTO WORKFLOW
    VALUES (@dpt, '1', '3', GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[prc_getWorkflow]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_getWorkflow]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT WRK_MED_DEPOT, WRK_ETP_NUM, WRK_DCS_ID, WRK_DATE
	FROM WORKFLOW;

END
GO
/****** Object:  StoredProcedure [dbo].[prc_liste_fam]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:    <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_liste_fam]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

 

    SELECT FAMILLE.FAM_CODE, fam_libelle, COUNT(FAMILLE.FAM_CODE) AS nbMed
    FROM FAMILLE
    INNER JOIN MEDICAMENT on FAMILLE.FAM_CODE = MEDICAMENT.FAM_CODE
    GROUP BY FAMILLE.FAM_CODE, fam_libelle
    
END

GO
/****** Object:  StoredProcedure [dbo].[prc_liste_medicament]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:    <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_liste_medicament] 
    -- Add the parameters for the stored procedure here

 

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

 

    -- Insert statements for procedure here
    SELECT DISTINCT(MED_DEPOTLEGAL), MED_NOMCOMMERCIAL, FAM_CODE, MED_COMPOSITION, MED_EFFETS, MED_CONTREINDIC
    FROM MEDICAMENT
END

GO
/****** Object:  StoredProcedure [dbo].[prc_liste_medicamentNonAutorise]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_liste_medicamentNonAutorise] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MEDICAMENT
END
GO
/****** Object:  StoredProcedure [dbo].[prc_liste_medicamentNonAutoriseT]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:    <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_liste_medicamentNonAutoriseT]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

 

    SELECT DISTINCT(MED_DEPOTLEGAL), MED_NOMCOMMERCIAL, FAM_CODE, MED_COMPOSITION, MED_EFFETS, MED_CONTREINDIC
    FROM MEDICAMENT
    INNER JOIN WORKFLOW ON WRK_MED_DEPOT = MED_DEPOTLEGAL
    WHERE WRK_ETP_NUM != 8
END

GO
/****** Object:  StoredProcedure [dbo].[prc_update_norme]    Script Date: 04/01/2023 15:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_update_norme] (@etpNum as int, @user as varchar(40), @date as Date, @norme as Varchar(30))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ancNorme as varchar(30)
	DECLARE @ancDate as Date

	SELECT @ancNorme = NORME, @ancDate = NORME_DATE FROM ETAPE_NORME WHERE ETAPE_ETP_NUM = @etpNum

	INSERT INTO HISTORIQUE(HIST_USR, HIST_ETP_AV, HIST_DATE_AV, HIST_DATE_AP, HIST_NORME_AV, HIST_NORME_AP) VALUES (@user, @etpNum, @ancDate, @date, @ancNorme, @norme)
	UPDATE ETAPE_NORME SET NORME_DATE = @date, NORME = @norme WHERE ETAPE_ETP_NUM = @etpNum
END
GO
USE [master]
GO
ALTER DATABASE [GSB_gesAMM] SET  READ_WRITE 
GO

USE [DevSpa]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Business](
	[Business_ID] [int] IDENTITY(1,1) NOT NULL,
	[Business_Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[Business_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Business_Details]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Business_Details](
	[Business_ID] [int] NOT NULL,
	[Business_Address] [varchar](100) NULL,
	[Business_City] [varchar](50) NULL,
	[Business_State] [varchar](50) NULL,
	[Business_Org_Country] [varchar](50) NULL,
	[Business_Is_Registered] [char](1) NULL,
	[Business_Description] [varchar](200) NULL,
	[Business_Created_Dt] [datetime] NOT NULL,
	[Business_Updated_Dt] [datetime] NOT NULL,
	[Business_Updated_By] [varchar](50) NULL,
 CONSTRAINT [PK_Business_Details] PRIMARY KEY CLUSTERED 
(
	[Business_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Fname] [varchar](50) NULL,
	[Customer_Lname] [varchar](50) NULL,
	[Customer_Gender] [char](1) NOT NULL,
	[Customer_MobileNo] [varchar](15) NOT NULL,
	[Customer_DOB] [datetime] NULL,
	[Customer_EmailID] [varchar](50) NULL,
	[Customer_AltMobileNo] [varchar](15) NULL,
	[Customer_Created_Loc_ID] [int] NOT NULL,
	[Customer_CreatedBy] [varchar](50) NULL,
	[Customer_Is_Active] [char](1) NOT NULL,
	[Customer_Created_Dt] [datetime] NOT NULL,
	[Customer_Updated_Dt] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer_Membership_Details]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer_Membership_Details](
	[Customer_Membership_Details_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Membership_ID] [int] NOT NULL,
	[Membership_Start_Dt] [datetime] NULL,
	[Membership_Stop_Dt] [datetime] NULL,
	[Membership_Validity_Last_Dt] [datetime] NULL,
	[Amount_Paid] [decimal](8, 2) NULL,
	[Membership_Is_Active] [char](1) NOT NULL,
	[Membership_Is_Upgrade] [char](1) NOT NULL,
	[Comments] [varchar](250) NULL,
	[Created_Dt] [datetime] NOT NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_Dt] [datetime] NOT NULL,
	[Updated_By] [varchar](50) NULL,
 CONSTRAINT [PK_Customer_Membership_Details] PRIMARY KEY CLUSTERED 
(
	[Customer_Membership_Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[Loc_ID] [int] IDENTITY(1,1) NOT NULL,
	[Business_ID] [int] NOT NULL,
	[Loc_Code] [varchar](20) NOT NULL,
	[Loc_Region] [varchar](20) NOT NULL,
	[Loc_Name] [varchar](100) NULL,
	[Loc_Hotel_Name] [varchar](100) NULL,
	[Loc_Spa_Name] [varchar](100) NULL,
	[Loc_Address] [varchar](150) NULL,
	[Loc_City] [varchar](50) NULL,
	[Loc_State] [varchar](50) NULL,
	[Loc_Country] [varchar](100) NULL,
	[Loc_ContactNo] [varchar](50) NULL,
	[Loc_Comment] [varchar](200) NULL,
	[Loc_Is_Active] [char](1) NOT NULL,
	[Loc_Created_Dt] [datetime] NOT NULL,
	[Loc_Updated_Dt] [datetime] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Loc_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location_Tax]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Tax](
	[Location_Tax_ID] [int] IDENTITY(1,1) NOT NULL,
	[Location_ID] [int] NOT NULL,
	[Tax_ID] [int] NOT NULL,
	[Tax_Value] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Location_Tax] PRIMARY KEY CLUSTERED 
(
	[Location_Tax_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookUp_Country]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookUp_Country](
	[Country_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [varchar](100) NULL,
 CONSTRAINT [PK_LookUp_Country] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookUp_LocationRegion]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookUp_LocationRegion](
	[Region_Name] [varchar](20) NOT NULL,
	[Comment] [varchar](100) NULL,
 CONSTRAINT [PK_LookUp_LocationRegion] PRIMARY KEY CLUSTERED 
(
	[Region_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookUp_Payment_Mode]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookUp_Payment_Mode](
	[Payment_Mode_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Mode_Code] [varchar](15) NOT NULL,
	[Payment_Mode_Description] [varchar](50) NULL,
 CONSTRAINT [PK_LookUp_Payment_Mode] PRIMARY KEY CLUSTERED 
(
	[Payment_Mode_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookUp_State]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookUp_State](
	[State_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_ID] [int] NOT NULL,
	[State_Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_LookUp_State] PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Membership_Master]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Membership_Master](
	[Membership_ID] [int] IDENTITY(1,1) NOT NULL,
	[Business_ID] [int] NOT NULL,
	[Membership_Type] [varchar](50) NOT NULL,
	[Membership_Amount] [decimal](8, 2) NOT NULL,
	[Membership_Validity] [int] NOT NULL,
	[Membership_Desc] [varchar](200) NULL,
 CONSTRAINT [PK_Membership_Master] PRIMARY KEY CLUSTERED 
(
	[Membership_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Order_Dt] [datetime] NOT NULL,
	[Order_Loc_ID] [int] NOT NULL,
	[Order_Currency_Code] [varchar](10) NULL,
	[Order_Gross_Amount] [decimal](8, 2) NULL,
	[Order_Net_Amount] [decimal](8, 2) NULL,
	[Voucher_Usage_ID] [int] NULL,
	[Order_Comments] [varchar](50) NULL,
	[Order_Created_By] [varchar](50) NULL,
	[Order_Updated_Dt] [datetime] NULL,
	[Order_Updated_By] [varchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Payment_Mode]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Payment_Mode](
	[Order_ID] [int] NOT NULL,
	[Payment_Mode_ID] [int] NOT NULL,
	[Amount] [decimal](8, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Taxes]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Taxes](
	[Order_ID] [int] NOT NULL,
	[Location_Tax_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](50) NOT NULL,
	[Product_Weight] [int] NULL,
	[Product_Weight_UOM] [varchar](50) NULL,
	[Product_MRP] [decimal](7, 2) NOT NULL,
	[Product_Balance_Qty] [int] NULL,
	[Product_Min_Stock_Lvl] [int] NULL,
	[Product_Vendor] [varchar](50) NULL,
	[Product_MFG_Dt] [datetime] NULL,
	[Product_Expiry_Dt] [datetime] NULL,
	[Product_Barcode] [varchar](200) NULL,
	[Product_Description] [varchar](200) NULL,
	[Product_Created_Dt] [datetime] NOT NULL,
	[Product_Updated_Dt] [datetime] NOT NULL,
	[Product_Created_By] [varchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchase_Order]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order](
	[Order_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL,
	[Service_Amount] [decimal](8, 2) NULL,
	[Service_Discount] [decimal](8, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[Service_ID] [int] IDENTITY(1,1) NOT NULL,
	[Service_Name] [varchar](50) NULL,
	[Service_Description] [varchar](200) NULL,
	[Service_Created_Dt] [datetime] NOT NULL,
	[Service_Updated_Dt] [datetime] NOT NULL,
	[Service_Created_By] [varchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock_Added]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock_Added](
	[Product_ID] [int] NOT NULL,
	[Qty_Added] [int] NULL,
	[Added_Dt] [datetime] NOT NULL,
	[Added_By] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tax_Master]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tax_Master](
	[Tax_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_ID] [int] NOT NULL,
	[Tax_Short_Name] [varchar](15) NOT NULL,
	[Tax_Description] [varchar](50) NULL,
 CONSTRAINT [PK_Tax_Master] PRIMARY KEY CLUSTERED 
(
	[Tax_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Therapist]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Therapist](
	[Therapist_ID] [int] IDENTITY(1,1) NOT NULL,
	[Therapist_FName] [varchar](50) NOT NULL,
	[Therapist_LName] [varchar](50) NULL,
	[Therapist_Gender] [char](1) NOT NULL,
	[Therapist_ContactNo] [varchar](50) NULL,
	[Therapist_Is_Active] [char](1) NOT NULL,
	[Therapist_Created_Dt] [datetime] NOT NULL,
	[Therapist_Updated_Dt] [datetime] NOT NULL,
 CONSTRAINT [PK_Therapist] PRIMARY KEY CLUSTERED 
(
	[Therapist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Treatment](
	[Treatment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_Name] [varchar](100) NULL,
	[Treatment_Description] [varchar](200) NULL,
	[Treatment_Created_Dt] [datetime] NOT NULL,
	[Treatment_Updated_Dt] [datetime] NOT NULL,
	[Treatment_Created_By] [varchar](50) NULL,
 CONSTRAINT [PK_Treatment] PRIMARY KEY CLUSTERED 
(
	[Treatment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Treatment_Inventory_Usage]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Inventory_Usage](
	[Treatment_Inventory_Usage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Treatment_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Qty_Used] [decimal](8, 2) NULL,
 CONSTRAINT [PK_Treatment_Inventory_Usage] PRIMARY KEY CLUSTERED 
(
	[Treatment_Inventory_Usage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [varchar](100) NOT NULL,
	[Pwd] [varchar](100) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[User_Fname] [varchar](50) NULL,
	[User_Lname] [varchar](50) NULL,
	[User_Is_Active] [char](1) NOT NULL,
	[User_Created_Dt] [datetime] NOT NULL,
	[User_Updated_Dt] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Location_Access]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Location_Access](
	[User_Loc_Access_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [varchar](100) NOT NULL,
	[Loc_ID] [int] NOT NULL,
	[Permissions] [varchar](50) NULL,
 CONSTRAINT [PK_User_Location_Access] PRIMARY KEY CLUSTERED 
(
	[User_Loc_Access_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[User_Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [varchar](100) NOT NULL,
	[Log_TimeStamp] [datetime] NOT NULL,
	[Log_Comment] [varchar](250) NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[User_Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRole](
	[Role_Name] [varchar](50) NOT NULL,
	[Comment] [varchar](100) NULL,
 CONSTRAINT [PK_UserRole_1] PRIMARY KEY CLUSTERED 
(
	[Role_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Voucher_Master]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Voucher_Master](
	[Voucher_ID] [int] IDENTITY(1,1) NOT NULL,
	[Business_ID] [int] NOT NULL,
	[Voucher_Code] [varchar](50) NOT NULL,
	[Voucher_Amount] [decimal](8, 2) NOT NULL,
	[Voucher_Description] [varchar](100) NULL,
	[Voucher_Created_Dt] [datetime] NOT NULL,
	[Voucher_Start_Dt] [datetime] NOT NULL,
	[Voucher_Expiry_Dt] [datetime] NULL,
	[Voucher_Created_By] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Voucher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Business_ID] ASC,
	[Voucher_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Voucher_Usage]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher_Usage](
	[Voucher_Usage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Voucher_ID] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
 CONSTRAINT [PK_Voucher_Usage] PRIMARY KEY CLUSTERED 
(
	[Voucher_Usage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xref_Location_Service]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xref_Location_Service](
	[Location_Service_Xref_ID] [int] IDENTITY(1,1) NOT NULL,
	[Loc_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL,
	[Amount] [decimal](7, 2) NULL,
 CONSTRAINT [PK_Xref_Location_Service] PRIMARY KEY CLUSTERED 
(
	[Location_Service_Xref_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xref_Location_Therapist]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xref_Location_Therapist](
	[Loc_Ther_Xref_ID] [int] IDENTITY(1,1) NOT NULL,
	[Loc_ID] [int] NOT NULL,
	[Therapist_ID] [int] NOT NULL,
 CONSTRAINT [PK_Xref_Location_Therapist] PRIMARY KEY CLUSTERED 
(
	[Loc_Ther_Xref_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xref_Service_Treatment]    Script Date: 7/10/2015 7:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xref_Service_Treatment](
	[Service_Treatment_Xref_ID] [int] IDENTITY(1,1) NOT NULL,
	[Service_ID] [int] NOT NULL,
	[Treatment_ID] [int] NOT NULL,
 CONSTRAINT [PK_Xref_Service_Treatment] PRIMARY KEY CLUSTERED 
(
	[Service_Treatment_Xref_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Business_Details] ADD  CONSTRAINT [DF_Business_Details_Business_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Business_Created_Dt]
GO
ALTER TABLE [dbo].[Business_Details] ADD  CONSTRAINT [DF_Business_Details_Business_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Business_Updated_Dt]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Customer_Is_Active]  DEFAULT ('Y') FOR [Customer_Is_Active]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Customer_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Customer_Created_Dt]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Customer_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Customer_Updated_Dt]
GO
ALTER TABLE [dbo].[Customer_Membership_Details] ADD  CONSTRAINT [DF_Customer_Membership_Details_Membership_Is_Active]  DEFAULT ('Y') FOR [Membership_Is_Active]
GO
ALTER TABLE [dbo].[Customer_Membership_Details] ADD  CONSTRAINT [DF_Customer_Membership_Details_Membership_Is_Upgrade]  DEFAULT ('N') FOR [Membership_Is_Upgrade]
GO
ALTER TABLE [dbo].[Customer_Membership_Details] ADD  CONSTRAINT [DF_Customer_Membership_Details_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Created_Dt]
GO
ALTER TABLE [dbo].[Customer_Membership_Details] ADD  CONSTRAINT [DF_Customer_Membership_Details_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Updated_Dt]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Loc_Country]  DEFAULT ('India') FOR [Loc_Country]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Loc_Is_Active]  DEFAULT ('Y') FOR [Loc_Is_Active]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Loc_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Loc_Created_Dt]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Loc_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Loc_Updated_Dt]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Order_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Order_Dt]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Order_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Order_Updated_Dt]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Product_MRP]  DEFAULT ((0.0)) FOR [Product_MRP]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Product_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Product_Created_Dt]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Product_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Product_Updated_Dt]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Service_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Service_Created_Dt]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Service_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Service_Updated_Dt]
GO
ALTER TABLE [dbo].[Stock_Added] ADD  CONSTRAINT [DF_Stock_Added_Added_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Added_Dt]
GO
ALTER TABLE [dbo].[Therapist] ADD  CONSTRAINT [DF_Therapist_Therapist_Gender]  DEFAULT ('M') FOR [Therapist_Gender]
GO
ALTER TABLE [dbo].[Therapist] ADD  CONSTRAINT [DF_Therapist_Therapist_Is_Active]  DEFAULT ('Y') FOR [Therapist_Is_Active]
GO
ALTER TABLE [dbo].[Therapist] ADD  CONSTRAINT [DF_Therapist_Therapist_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Therapist_Created_Dt]
GO
ALTER TABLE [dbo].[Therapist] ADD  CONSTRAINT [DF_Therapist_Therapist_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Therapist_Updated_Dt]
GO
ALTER TABLE [dbo].[Treatment] ADD  CONSTRAINT [DF_Treatment_Treatment_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Treatment_Created_Dt]
GO
ALTER TABLE [dbo].[Treatment] ADD  CONSTRAINT [DF_Treatment_Treatment_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Treatment_Updated_Dt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User_Is_Active]  DEFAULT ('Y') FOR [User_Is_Active]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [User_Created_Dt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User_Updated_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [User_Updated_Dt]
GO
ALTER TABLE [dbo].[UserLog] ADD  CONSTRAINT [DF_UserLog_Log_TimeStamp]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Log_TimeStamp]
GO
ALTER TABLE [dbo].[Voucher_Master] ADD  CONSTRAINT [DF_Voucher_Master_Voucher_Amount]  DEFAULT ((0.00)) FOR [Voucher_Amount]
GO
ALTER TABLE [dbo].[Voucher_Master] ADD  CONSTRAINT [DF_Voucher_Master_Voucher_Created_Dt]  DEFAULT (switchoffset(sysdatetimeoffset(),'+05:30')) FOR [Voucher_Created_Dt]
GO
ALTER TABLE [dbo].[Business_Details]  WITH CHECK ADD  CONSTRAINT [FK_Business_Details_Business] FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
ALTER TABLE [dbo].[Business_Details] CHECK CONSTRAINT [FK_Business_Details_Business]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Location] FOREIGN KEY([Customer_Created_Loc_ID])
REFERENCES [dbo].[Location] ([Loc_ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Location]
GO
ALTER TABLE [dbo].[Customer_Membership_Details]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Membership_Details_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customer_Membership_Details] CHECK CONSTRAINT [FK_Customer_Membership_Details_Customer]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Business] FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Business]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_LookUp_LocationRegion] FOREIGN KEY([Loc_Region])
REFERENCES [dbo].[LookUp_LocationRegion] ([Region_Name])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_LookUp_LocationRegion]
GO
ALTER TABLE [dbo].[Location_Tax]  WITH CHECK ADD  CONSTRAINT [FK_Location_Tax_Location] FOREIGN KEY([Location_ID])
REFERENCES [dbo].[Location] ([Loc_ID])
GO
ALTER TABLE [dbo].[Location_Tax] CHECK CONSTRAINT [FK_Location_Tax_Location]
GO
ALTER TABLE [dbo].[Location_Tax]  WITH CHECK ADD  CONSTRAINT [FK_Location_Tax_Tax_Master] FOREIGN KEY([Tax_ID])
REFERENCES [dbo].[Tax_Master] ([Tax_ID])
GO
ALTER TABLE [dbo].[Location_Tax] CHECK CONSTRAINT [FK_Location_Tax_Tax_Master]
GO
ALTER TABLE [dbo].[LookUp_State]  WITH CHECK ADD  CONSTRAINT [FK_LookUp_State_LookUp_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[LookUp_Country] ([Country_ID])
GO
ALTER TABLE [dbo].[LookUp_State] CHECK CONSTRAINT [FK_LookUp_State_LookUp_Country]
GO
ALTER TABLE [dbo].[Membership_Master]  WITH CHECK ADD  CONSTRAINT [FK_Membership_Master_Business] FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
ALTER TABLE [dbo].[Membership_Master] CHECK CONSTRAINT [FK_Membership_Master_Business]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Location] FOREIGN KEY([Order_Loc_ID])
REFERENCES [dbo].[Location] ([Loc_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Location]
GO
ALTER TABLE [dbo].[Order_Payment_Mode]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment_Mode_LookUp_Payment_Mode] FOREIGN KEY([Payment_Mode_ID])
REFERENCES [dbo].[LookUp_Payment_Mode] ([Payment_Mode_ID])
GO
ALTER TABLE [dbo].[Order_Payment_Mode] CHECK CONSTRAINT [FK_Order_Payment_Mode_LookUp_Payment_Mode]
GO
ALTER TABLE [dbo].[Order_Payment_Mode]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment_Mode_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Order_Payment_Mode] CHECK CONSTRAINT [FK_Order_Payment_Mode_Order]
GO
ALTER TABLE [dbo].[Order_Taxes]  WITH CHECK ADD  CONSTRAINT [FK_Order_Taxes_Location_Tax] FOREIGN KEY([Location_Tax_ID])
REFERENCES [dbo].[Location_Tax] ([Location_Tax_ID])
GO
ALTER TABLE [dbo].[Order_Taxes] CHECK CONSTRAINT [FK_Order_Taxes_Location_Tax]
GO
ALTER TABLE [dbo].[Order_Taxes]  WITH CHECK ADD  CONSTRAINT [FK_Order_Taxes_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Order_Taxes] CHECK CONSTRAINT [FK_Order_Taxes_Order]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Order_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_Purchase_Order_Order]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Order_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([Service_ID])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_Purchase_Order_Service]
GO
ALTER TABLE [dbo].[Stock_Added]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Added_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Stock_Added] CHECK CONSTRAINT [FK_Stock_Added_Product]
GO
ALTER TABLE [dbo].[Tax_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tax_Master_LookUp_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[LookUp_Country] ([Country_ID])
GO
ALTER TABLE [dbo].[Tax_Master] CHECK CONSTRAINT [FK_Tax_Master_LookUp_Country]
GO
ALTER TABLE [dbo].[Treatment_Inventory_Usage]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Inventory_Usage_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Treatment_Inventory_Usage] CHECK CONSTRAINT [FK_Treatment_Inventory_Usage_Product]
GO
ALTER TABLE [dbo].[Treatment_Inventory_Usage]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Inventory_Usage_Treatment] FOREIGN KEY([Treatment_ID])
REFERENCES [dbo].[Treatment] ([Treatment_ID])
GO
ALTER TABLE [dbo].[Treatment_Inventory_Usage] CHECK CONSTRAINT [FK_Treatment_Inventory_Usage_Treatment]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([Role])
REFERENCES [dbo].[UserRole] ([Role_Name])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
ALTER TABLE [dbo].[User_Location_Access]  WITH CHECK ADD  CONSTRAINT [FK_User_Location_Access_Location] FOREIGN KEY([Loc_ID])
REFERENCES [dbo].[Location] ([Loc_ID])
GO
ALTER TABLE [dbo].[User_Location_Access] CHECK CONSTRAINT [FK_User_Location_Access_Location]
GO
ALTER TABLE [dbo].[User_Location_Access]  WITH CHECK ADD  CONSTRAINT [FK_User_Location_Access_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[User_Location_Access] CHECK CONSTRAINT [FK_User_Location_Access_User]
GO
ALTER TABLE [dbo].[UserLog]  WITH CHECK ADD  CONSTRAINT [FK_UserLog_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[UserLog] CHECK CONSTRAINT [FK_UserLog_User]
GO
ALTER TABLE [dbo].[Voucher_Master]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_Master_Business] FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
ALTER TABLE [dbo].[Voucher_Master] CHECK CONSTRAINT [FK_Voucher_Master_Business]
GO
ALTER TABLE [dbo].[Voucher_Usage]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_Usage_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Voucher_Usage] CHECK CONSTRAINT [FK_Voucher_Usage_Order]
GO
ALTER TABLE [dbo].[Voucher_Usage]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_Usage_Voucher_Master] FOREIGN KEY([Voucher_ID])
REFERENCES [dbo].[Voucher_Master] ([Voucher_ID])
GO
ALTER TABLE [dbo].[Voucher_Usage] CHECK CONSTRAINT [FK_Voucher_Usage_Voucher_Master]
GO
ALTER TABLE [dbo].[Xref_Location_Service]  WITH CHECK ADD  CONSTRAINT [FK_Xref_Location_Service_Location] FOREIGN KEY([Loc_ID])
REFERENCES [dbo].[Location] ([Loc_ID])
GO
ALTER TABLE [dbo].[Xref_Location_Service] CHECK CONSTRAINT [FK_Xref_Location_Service_Location]
GO
ALTER TABLE [dbo].[Xref_Location_Service]  WITH CHECK ADD  CONSTRAINT [FK_Xref_Location_Service_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([Service_ID])
GO
ALTER TABLE [dbo].[Xref_Location_Service] CHECK CONSTRAINT [FK_Xref_Location_Service_Service]
GO
ALTER TABLE [dbo].[Xref_Location_Therapist]  WITH CHECK ADD  CONSTRAINT [FK_Xref_Location_Therapist_Location] FOREIGN KEY([Loc_ID])
REFERENCES [dbo].[Location] ([Loc_ID])
GO
ALTER TABLE [dbo].[Xref_Location_Therapist] CHECK CONSTRAINT [FK_Xref_Location_Therapist_Location]
GO
ALTER TABLE [dbo].[Xref_Location_Therapist]  WITH CHECK ADD  CONSTRAINT [FK_Xref_Location_Therapist_Therapist] FOREIGN KEY([Therapist_ID])
REFERENCES [dbo].[Therapist] ([Therapist_ID])
GO
ALTER TABLE [dbo].[Xref_Location_Therapist] CHECK CONSTRAINT [FK_Xref_Location_Therapist_Therapist]
GO
ALTER TABLE [dbo].[Xref_Service_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Xref_Service_Treatment_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([Service_ID])
GO
ALTER TABLE [dbo].[Xref_Service_Treatment] CHECK CONSTRAINT [FK_Xref_Service_Treatment_Service]
GO
ALTER TABLE [dbo].[Xref_Service_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Xref_Service_Treatment_Treatment] FOREIGN KEY([Treatment_ID])
REFERENCES [dbo].[Treatment] ([Treatment_ID])
GO
ALTER TABLE [dbo].[Xref_Service_Treatment] CHECK CONSTRAINT [FK_Xref_Service_Treatment_Treatment]
GO

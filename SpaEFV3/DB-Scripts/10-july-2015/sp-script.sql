USE [DevSpa]
GO
/****** Object:  StoredProcedure [dbo].[ADD_LOCATION]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[ADD_LOCATION] 
	-- Add the parameters for the stored procedure here
		@Loc_Code varchar(20), 
		@Loc_Region varchar(30), 
		@Loc_Name varchar(100), 
		@Loc_Hotel_Name varchar(100), 
		@Loc_Spa_Name varchar(100), 
		@Loc_Address varchar(150), 
		@Loc_City varchar(50), 
		@Loc_State varchar(50), 
		@Loc_Country varchar(100), 
		@Loc_ContactNo varchar(50), 
		@Loc_Comment varchar(200)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
		insert into dbo.Location
		(Loc_Code, Loc_Region, Loc_Name, Loc_Hotel_Name, Loc_Spa_Name, Loc_Address, Loc_City, Loc_State, Loc_Country, Loc_ContactNo, Loc_Comment)
		values
		(@Loc_Code, @Loc_Region, @Loc_Name, @Loc_Hotel_Name, @Loc_Spa_Name, @Loc_Address, @Loc_City, @Loc_State, @Loc_Country, @Loc_ContactNo, @Loc_Comment)

END

GO
/****** Object:  StoredProcedure [dbo].[ADD_USER]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADD_USER]
	-- Add the parameters for the stored procedure here
	@USER_ID varchar(100),
	@PWD varchar(100),
	@ROLE varchar(50),
	@USER_FNAME varchar(100),
	@USER_LNAME varchar(100),
	@MSG varchar(100) OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @Count int
	set @Count = 0

    select @Count = count(*) from [dbo].[User]
	where [User_ID] = @USER_ID

	if (@Count > 0)
		begin
			set @MSG = 'Err: User already exists. Please contact System Admin - admin@myapp.com'
		end
	else
		begin
			
			--insert new user in USER table
			insert into [dbo].[User]
			([User_ID], [Pwd], [Role], [User_Fname], [User_Lname], [User_Is_Active])
			values
			(@USER_ID, @PWD, @ROLE, @USER_FNAME, @USER_LNAME, 'Y')

			--insert log in USERLOG table
			insert into [dbo].[UserLog]
			([User_ID], [Log_Comment])
			values
			(@USER_ID, 'User Created. Logged in for first time.')

		end

END


GO
/****** Object:  StoredProcedure [dbo].[DELETE_LOCATION]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DELETE_LOCATION] 
	-- Add the parameters for the stored procedure here
	@LOC_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update [dbo].[Location]
	set [Loc_Is_Active] = 'N',
	[Loc_Updated_Dt] = (switchoffset(sysdatetimeoffset(),'+05:30'))
	where [Loc_ID] = @LOC_ID

END

GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_LOCATION]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GET_ALL_LOCATION] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
	   [Loc_ID]
	  ,[Loc_Code]
      ,[Loc_Region]
      ,[Loc_Name]
      ,[Loc_Hotel_Name]
      ,[Loc_Spa_Name]
      ,[Loc_Address]
      ,[Loc_City]
      ,[Loc_State]
      ,[Loc_Country]
      ,[Loc_ContactNo]
      ,[Loc_Comment] 
	from
		[dbo].[Location]
	where
		[Loc_Is_Active] = 'Y'
	
END

GO
/****** Object:  StoredProcedure [dbo].[GET_LOC_FOR_REGION]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GET_LOC_FOR_REGION]
@REGION_NAME varchar(25) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
	   [Loc_ID]
	  ,[Loc_Code]
      ,[Loc_Region]
      ,[Loc_Name]
      ,[Loc_Hotel_Name]
      ,[Loc_Spa_Name]
      ,[Loc_Address]
      ,[Loc_City]
      ,[Loc_State]
      ,[Loc_Country]
      ,[Loc_ContactNo]
      ,[Loc_Comment] 
	from
		[dbo].[Location]
	where
		[Loc_Is_Active] = 'Y'
		and [Loc_Region] = @REGION_NAME
	
END

GO
/****** Object:  StoredProcedure [dbo].[GET_LOCATION]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GET_LOCATION] 

@LOC_ID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
	   [Loc_ID]
	  ,[Loc_Code]
      ,[Loc_Region]
      ,[Loc_Name]
      ,[Loc_Hotel_Name]
      ,[Loc_Spa_Name]
      ,[Loc_Address]
      ,[Loc_City]
      ,[Loc_State]
      ,[Loc_Country]
      ,[Loc_ContactNo]
      ,[Loc_Comment] 
	from
		[dbo].[Location]
	where
		[Loc_Is_Active] = 'Y'
		and
		[Loc_ID] = @LOC_ID
	
END

GO
/****** Object:  StoredProcedure [dbo].[GET_THERAPIST_FOR_LOC_ID]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GET_THERAPIST_FOR_LOC_ID] 
	-- Add the parameters for the stored procedure here
	@LOC_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select B.* from
	[dbo].[Xref_Location_Therapist] A join
	[dbo].[Therapist] B
	on A.Therapist_ID = B.Therapist_ID
	where
	A.Loc_ID = @LOC_ID

END

GO
/****** Object:  StoredProcedure [dbo].[IS_VALID_USER]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IS_VALID_USER]
	-- Add the parameters for the stored procedure here
	@USER_ID varchar(100),
	@PWD varchar(100),
	@IS_ACTIVE char(1) OUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @Count int

    -- Insert statements for procedure here
	SELECT @Count = count(*) from [dbo].[User]
	where [User_ID] = @USER_ID
	and
	[Pwd] = @PWD
	and
	[User_Is_Active] = 'Y'

	if (@Count > 0)
		set @IS_ACTIVE = 'Y'
	else
		set @IS_ACTIVE = 'N'


END

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LOCATION]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE_LOCATION] 
	-- Add the parameters for the stored procedure here
		@LOC_ID int,
		@Loc_Code varchar(20), 
		@Loc_Region varchar(30), 
		@Loc_Name varchar(100) = null, 
		@Loc_Hotel_Name varchar(100) = null, 
		@Loc_Spa_Name varchar(100) = null, 
		@Loc_Address varchar(150), 
		@Loc_City varchar(50) = null, 
		@Loc_State varchar(50) = null, 
		@Loc_Country varchar(100), 
		@Loc_ContactNo varchar(50) = null, 
		@Loc_Comment varchar(200) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update [dbo].[Location]
	set 
		[Loc_Code] = @Loc_Code, 
		[Loc_Region] = @Loc_Region, 
		[Loc_Name] = @Loc_Name, 
		[Loc_Hotel_Name] = @Loc_Hotel_Name, 
		[Loc_Spa_Name] = @Loc_Spa_Name, 
		[Loc_Address] = @Loc_Address, 
		[Loc_City] = @Loc_City, 
		[Loc_State] = @Loc_State, 
		[Loc_Country] = @Loc_Country, 
		[Loc_ContactNo] = @Loc_ContactNo, 
		[Loc_Comment] = @Loc_Comment,
		[Loc_Updated_Dt] = (switchoffset(sysdatetimeoffset(),'+05:30'))
	where [Loc_ID] = @LOC_ID

END

GO
/****** Object:  StoredProcedure [dbo].[USER_LOGGED_IN]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_LOGGED_IN] 
	-- Add the parameters for the stored procedure here
	@USER_ID varchar(100),
	@PWD varchar(100),
	@IS_VALID char(1) OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @IS_VALID_USER char(1)

    -- Insert statements for procedure here

	set @IS_VALID_USER = 'N'
	
	exec dbo.IS_VALID_USER @USER_ID, @PWD, @IS_VALID_USER output 

	if (@IS_VALID_USER = 'Y')
	begin
		
		insert into dbo.UserLog
		([User_ID], [Log_Comment])
		values
		(@USER_ID, 'Logged in')

	end


	set @IS_VALID = @IS_VALID_USER
		
	

END

GO
/****** Object:  StoredProcedure [dbo].[USER_LOGGED_OUT]    Script Date: 7/10/2015 7:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[USER_LOGGED_OUT] 
	-- Add the parameters for the stored procedure here
	@USER_ID varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	insert into dbo.UserLog
	([User_ID], [Log_Comment])
	values
	(@USER_ID, 'Logged OUT')



END

GO

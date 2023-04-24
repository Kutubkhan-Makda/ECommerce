Alter PROCEDURE [dbo].[PR_User_SelectAll]
AS
SELECT 
		[dbo].[Users].[UserId],
		[dbo].[Users].[Name],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[Email],
		[dbo].[Users].[Address],
		[dbo].[Users].[ImageUrl]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]


--------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_User_SelectbyPK]

@UserId		int

AS
SELECT 
		[dbo].[Users].[Name],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[Email],
		[dbo].[Users].[Address],
		[dbo].[Users].[Password],
		[dbo].[Users].[ImageUrl]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]
WHERE	[dbo].[Users].UserId=@UserId


--[dbo].[PR_User_SelectbyPK] @UserId=1
---------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_User_Insert]

@Name			varchar(50),
@Email			varchar(50),
@Password		varchar(10),
@Address		varchar(200),
@CreatedON		Datetime,
@ImageUrl		nvarchar(200)

AS

INSERT INTO	[dbo].[Users]
(
		Name,
		Email,
		Password,
		Address,
		CreatedON,
		ImageUrl
)
VALUES
(
	@Name,		
	@Email,		
	@Password,	
	@Address,		
	ISNULL(@CreatedON,GETDATE()),
	@ImageUrl
)

------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_User_UpdateByPK]

@UserId			int,
@Name			varchar(50),
@Email			varchar(50),
@Password		varchar(10),
@Address		varchar(200),
@ImageUrl		nvarchar(200)

AS

UPDATE	[dbo].[Users]
SET
		[dbo].[Users].[Name]		=	@Name,	
		[dbo].[Users].[Email]		=	@Email,
		[dbo].[Users].[Address]		=	@Address,
		[dbo].[Users].[Password]	=	@Password,
		[dbo].[Users].ImageUrl		=	@ImageUrl

WHERE	[dbo].[Users].UserId=@UserId

-----------------------------------------------------------------------------------------

CREATE Procedure [dbo].[PR_User_DeleteByPK]

@UserId	int

AS

DELETE
FROM   [dbo].[Users]
WHERE  [dbo].[Users].UserId=@UserId

------------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_User_SelectByIDPass]

@Email			nvarchar(50),
@Password		nvarchar(10)
AS

SELECT
		[dbo].[Users].[UserId],
		[dbo].[Users].[Name],
		[dbo].[Users].[Email],
		[dbo].[Users].[Password],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[ImageUrl]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]

WHERE   [dbo].[Users].Email = @Email and
		[dbo].[Users].Password = @Password

---------------------------------------------------------------------------------------------

Alter PROCEDURE [dbo].[PR_Product_SelectAll]
AS
SELECT 
		[dbo].[Products].[ProductId],
		[dbo].[Category].[CategoryName],
		[dbo].[Products].[Name],
		[dbo].[Manufacturer].[ManufacturerName],
		[dbo].[Products].[Description],
		[dbo].[Products].[Price],
		[dbo].[Products].[Discount],
		[dbo].[Products].[Quantity],
		[dbo].[Products].[ImageUrl]

FROM	[dbo].[Products]
INNER JOIN [dbo].[Category]
ON [dbo].[Category].[CategoryId] = [dbo].[Products].[CategoryId]
INNER JOIN [dbo].[Manufacturer]
ON [dbo].[Manufacturer].[ManufacturerId] = [dbo].[Products].[ManufacturerId]

--[dbo].[PR_Product_SelectAll]

-----------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_Product_SelectbyPK]

@ProductId		int

AS
SELECT 
		[dbo].[Products].[CategoryId],
		[dbo].[Products].[Name],
		[dbo].[Products].[ManufacturerId],
		[dbo].[Products].[Description],
		[dbo].[Products].[Price],
		[dbo].[Products].[Discount],
		[dbo].[Products].[Quantity],
		[dbo].[Products].[ImageUrl]

FROM	[dbo].[Products]
INNER JOIN [dbo].[Category]
ON [dbo].[Category].[CategoryId] = [dbo].[Products].[CategoryId]
WHERE	[dbo].[Products].ProductId=@ProductId

--[dbo].[PR_Product_SelectbyPK]  @ProductId=3

----------------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_Product_Insert]

@CategoryId			int,
@Name				varchar(100),
@ManufacturerId		int,
@Description		varchar(500),
@Price				decimal(10, 2),
@Discount			decimal(10, 2),
@Quantity			int,
@ImageUrl			nvarchar(200)

AS

INSERT INTO	[dbo].[Products]
(
		CategoryId,
		Name,
		ManufacturerId,
		Description,
		Price,
		Discount,
		Quantity,
		ImageUrl
)
VALUES
(
		@CategoryId,
		@Name,
		@ManufacturerId,
		@Description,
		@Price,
		@Discount,
		@Quantity,
		@ImageUrl
)


-----------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_Product_UpdateByPK]

@ProductId			int,
@CategoryId			int,
@Name				varchar(100),
@ManufacturerId		int,
@Description		varchar(500),
@Price				decimal(10, 2),
@Discount			decimal(10, 2),
@Quantity			int,
@ImageUrl			nvarchar(200)

AS

UPDATE	[dbo].[Products]
SET
		[dbo].[Products].[CategoryId]			=	@CategoryId,
		[dbo].[Products].[Name]					=	@Name,
		[dbo].[Products].[ManufacturerId]		=	@ManufacturerId,
		[dbo].[Products].[Description]			=	@Description,
		[dbo].[Products].[Price]				=	@Price,
		[dbo].[Products].[Discount]				=	@Discount,
		[dbo].[Products].[Quantity]				=	@Quantity,
		[dbo].[Products].[ImageUrl]				=	@ImageUrl

WHERE	[dbo].[Products].ProductId=@ProductId

--------------------------------------------------------------------------------------

CREATE Procedure [dbo].[PR_Product_DeleteByPK]

@ProductId	int

AS 

DELETE
FROM   [dbo].[Products]
WHERE  [dbo].[Products].ProductId=@ProductId

-----------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_Category_SelectAll]

AS
SELECT 
		[dbo].[Category].[CategoryId],
		[dbo].[Category].[CategoryName]

FROM	[dbo].[Category]


--------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[PR_Category_SelectbyPK]

@CategoryId		int

AS
SELECT 
		[dbo].[Category].[CategoryId],
		[dbo].[Category].[CategoryName]

FROM	[dbo].[Category]
WHERE	[dbo].[Category].CategoryId=@CategoryId


---------------------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_Category_Insert]

@CategoryName		nvarchar(50),
@CreatedON			datetime

AS

INSERT INTO	[dbo].[Category]
(
		CategoryName,
		CreatedON
)
VALUES
(
		@CategoryName,
		ISNULL(@CreatedON,GETDATE())
)

-------------------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_Category_UpdateByPK]

@CategoryId			int,
@CategoryName		nvarchar(50),
@CreatedON			datetime

AS

UPDATE	[dbo].[Category]
SET
		[dbo].[Category].[CategoryName]			=	@CategoryName,
		[dbo].[Category].[CreatedON]			=ISNULL (@CreatedON,getdate())

WHERE	[dbo].[Category].CategoryId=@CategoryId

----------------------------------------------------------------------------------------------------

CREATE Procedure [dbo].[PR_Category_DeleteByPK]

@CategoryId		int

AS 

DELETE
FROM   [dbo].[Category]
WHERE  [dbo].[Category].CategoryId=@CategoryId

--------------------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_Orders_Insert]

@UserId				int,
@TotalPrice			int,
@ShippingAddress	varchar(200),
@OrderDate			datetime,
@OrderStatus		varchar(20)

AS

INSERT INTO	[dbo].[Orders]
(
		UserId,
		TotalPrice,
		ShippingAddress,
		OrderDate,
		OrderStatus
)
VALUES
(
		@UserId,
		@TotalPrice,
		@ShippingAddress,
		ISNULL(@OrderDate,GETDATE()),
		@OrderStatus
)

-----------------------------------------------------------------------------------------------------------

CREATE Procedure [dbo].[PR_Orders_DeleteByPK]

@OrderId	int

AS 

DELETE
FROM   [dbo].[Orders]
WHERE  [dbo].[Orders].OrderId=@OrderId

-----------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_OrderItems_Insert]

@OrderId			int,
@ProductId			int,
@Quantity			int,
@TotalPrice			decimal(10, 2)

AS

INSERT INTO	[dbo].[OrderItems]
(
		OrderId,
		ProductId,
		Quantity,
		TotalPrice
)
VALUES
(
		@OrderId,
		@ProductId,
		@Quantity,
		@TotalPrice
)

----------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_Cart_Insert]

@UserId				int,
@ProductId			int,
@Quantity			int,
@TotalPrice			decimal(10, 2)

AS

INSERT INTO	[dbo].[Cart]
(
		UserId,
		ProductId,
		Quantity,
		TotalPrice
)
VALUES
(
		@UserId,
		@ProductId,
		@Quantity,
		@TotalPrice
)

--------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[PR_Cart_SelectbyPK]

@UserId		int

AS
SELECT 
		[dbo].[Products].[Name],
		[dbo].[Cart].[Quantity],
		[dbo].[Cart].[TotalPrice]

FROM	[dbo].[Cart]
INNER JOIN [dbo].[Products]
ON [dbo].[Products].[ProductId] = [dbo].[Cart].[ProductId]
WHERE	[dbo].[Cart].UserId=@UserId

--[dbo].[PR_Cart_SelectbyPK]   @UserId=1


---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_Manufacturer_SelectAll]

AS
SELECT 
		[dbo].[Manufacturer].[ManufacturerId],
		[dbo].[Manufacturer].[ManufacturerName]

FROM	[dbo].[Manufacturer]

-------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_Manufacturer_SelectByPK]

@ManufacturerId		int

AS
SELECT 
		[dbo].[Manufacturer].[ManufacturerId],
		[dbo].[Manufacturer].[ManufacturerName]

FROM   [dbo].[Manufacturer]
WHERE  [dbo].[Manufacturer].ManufacturerId=@ManufacturerId

--------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_Manufacturer_Insert]

@ManufacturerName		nvarchar(50)

AS

INSERT INTO	[dbo].[Manufacturer]
(
		ManufacturerName
)
VALUES
(
		@ManufacturerName
)

-------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PR_Manufacturer_UpdateByPK]

@ManufacturerId			int,
@ManufacturerName		nvarchar(50)

AS

UPDATE	[dbo].[Manufacturer]
SET
		[dbo].[Manufacturer].[ManufacturerName]	=	@ManufacturerName

WHERE	[dbo].[Manufacturer].ManufacturerId=@ManufacturerId

----------------------------------------------------------------------------------------------------

CREATE Procedure [dbo].[PR_Manufacturer_DeleteByPK]

@ManufacturerId		int

AS 

DELETE
FROM   [dbo].[Manufacturer]
WHERE  [dbo].[Manufacturer].ManufacturerId=@ManufacturerId

--------------------------------------------------------------------------------------------------------

ALTER PROCEDURE [dbo].[PR_User_SelectbyPK]

@UserId		int

AS
SELECT 
		[dbo].[Users].[Name],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[Email],
		[dbo].[Users].[Address],
		[dbo].[Users].[Password],
		[dbo].[Users].[Status]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]
WHERE	[dbo].[Users].UserId=@UserId


--[dbo].[PR_User_SelectbyPK] @UserId=1


CREATE PROCEDURE [dbo].[PR_Product_SelectbyPK]

@ProductId		int

AS
SELECT 
		[dbo].[Users].[Name],
		[dbo].[Role].[RoleType],
		[dbo].[Users].[Email],
		[dbo].[Users].[Address],
		[dbo].[Users].[Password],
		[dbo].[Users].[Status]

FROM	[dbo].[Users]
INNER JOIN [dbo].[Role]
ON [dbo].[Role].[RoleId] = [dbo].[Users].[RoleId]
WHERE	[dbo].[Users].UserId=@UserId
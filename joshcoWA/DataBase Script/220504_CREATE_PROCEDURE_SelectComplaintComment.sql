
CREATE PROCEDURE [dbo].[SelectComplaintComment]
	-- Add the parameters for the stored procedure here
     @ComplaintID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT CC.*,
	  CASE
			WHEN CC.CommentFromUserID = 0 OR CC.CommentFromUserID IS NULL THEN CONCAT(UT.UserFirstName, ' ', UT.UserSurname)			
			ELSE CONCAT(U.UserFirstName, ' ', U.UserSurname)
		END AS CommentFrom

	  FROM [dbo].[ComplaintComment]  CC
	  
	  LEFT JOIN [dbo].[Complaint] C
	  ON CC.ComplaintID = C.ComplaintID

	  LEFT JOIN [dbo].[User] U
	  ON U.UserID = CC.CommentFromUserID

	  LEFT JOIN [dbo].[User] UT
	  ON UT.UserID = C.UserID

	  WHERE CC.ComplaintID = @ComplaintID
	  ORDER BY DateAdded desc
END

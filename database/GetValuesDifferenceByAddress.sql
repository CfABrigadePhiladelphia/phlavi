USE [PHL_Assessments]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mark Headd
-- Create date: February 17, 2013
-- Description:	Get Assed Value Differences for a Property by Property Address.
-- =============================================
ALTER PROCEDURE [dbo].[GetValuesDifferenceByAddress] @Address nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT B.Acct_Num, B.[Address], B.Unit
	,B.Mktval_14 - A.Mktval_13 AS MV_Change
	,B.LandVal_14 - A.LandVal_13 AS LV_Change
	,B.ImpVal_14 - A.ImpVal_13 AS IV_Change
	,B.Abat_Ex_14 - A.Abat_Ex_13 AS AV_Change
	FROM [PHL_Assessments].[dbo].[Assessments_2013] A
	,[PHL_Assessments].[dbo].[Assessments_2014] B
	WHERE A.Address = @Address AND B.Address = @Address
  
END

USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[SelectApplicationPropertyList]    Script Date: 2022/10/11 20:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[SelectApplicationPropertyList]


as

Select * from (
Select Distinct P.*
, (Select Count(L.[PropertyUnitID]) as Total  FROM [dbo].[Lease]L join [dbo].[PropertyUnit]PU on PU.PropertyUnitID = L.PropertyUnitID Where PU.PropertyID = P.PropertyID and L.LeaseStatus = 'Active') as UnitOccupied
, (Select Count(PU.[PropertyUnitID]) as Total  FROM [dbo].[PropertyUnit]PU Where PU.PropertyID = P.PropertyID and (PU.[PropertyUnitID] not in (Select L.[PropertyUnitID] From [dbo].[Lease]L Where L.LeaseStatus = 'Active'))) as UnitVacant
, (SELECT pp.PhotoTempFileName FROM [UploaderUsers]pp Where pp.ReferenceID = 1 and pp.ID = P.PropertyID) as PhotoTempFileName 
, (SELECT Top(1) propimage.ImageFileName FROM [PropertyImage]propimage Where propimage.PropertyID = P.PropertyID) as ImageFileName 
, (Select Count(*) From [dbo].[PropertyUnit]PU Where PU.PropertyID = P.PropertyID ) as TotalUnits
FROM  [dbo].[Property]P
left outer join [dbo].[PropertyUnit]propimage
on propimage.PropertyID = P.PropertyID
left join [dbo].[PropertyUnit]PU
on PU.PropertyID = P.PropertyID
left join [dbo].[Lease]L
on L.PropertyUnitID = PU.PropertyUnitID
) as Result
Where UnitVacant > 0 and (UnitVacant <> UnitOccupied)
Order by [PropertyName]
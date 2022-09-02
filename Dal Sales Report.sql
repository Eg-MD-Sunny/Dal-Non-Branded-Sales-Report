Select Year(dbo.toBdt(s.ReconciledOn)) [Year],
	   Month(dbo.toBdt(s.ReconciledOn)) [MNo],
	   DateName(Month,dbo.toBdt(s.ReconciledOn)) [Month],
	  
       pv.id [PVID],
	   pv.name [Product],
	   Count(*) [Sale Quantity],
	   Sum(tr.SalePrice) [Revenue],
	   sum(pv.Weight) [KG],
	   sum(pv.Weight)/1000 [Ton]


from ProductVariant pv
join ThingRequest tr on tr.ProductVariantId=pv.id
join thing t on t.id=tr.AssignedThingId
join Shipment s on s.id=tr.ShipmentId

where s.ReconciledOn is not null
and s.ReconciledOn >= '2022-01-01 00:00 +06:00'
and s.ReconciledOn < '2022-08-01 00:00 +06:00'
and s.ShipmentStatus not in (1,9,10)
and IsReturned=0
and IsCancelled=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and pv.DistributionNetworkId = 1
and pv.id in (10164,9770,2315,8951,3783,8883,3322,3743,6672,7456,24168,2170,27181,28347,30940,31093)

group by Year(dbo.toBdt(s.ReconciledOn)),
		 Month(dbo.toBdt(s.ReconciledOn)),
		 DateName(Month,dbo.toBdt(s.ReconciledOn)),
         pv.id,
	     pv.name



--Imported Dal
--===========================================

Select Year(dbo.toBdt(s.ReconciledOn)) [Year],
       Month(dbo.toBdt(s.ReconciledOn)) [MNo],
	   DateName(Month,dbo.toBdt(s.ReconciledOn)) [Month],
       pv.id [PVID],
	   pv.name [Product],
	   Count(*) [Sale Quantity],
	   Sum(tr.SalePrice) [Revenue],
	   sum(pv.Weight) [KG],
	   sum(pv.Weight)/1000 [Ton]


from ProductVariant pv
join ThingRequest tr on tr.ProductVariantId=pv.id
join thing t on t.id=tr.AssignedThingId
join Shipment s on s.id=tr.ShipmentId

where s.ReconciledOn is not null
and s.ReconciledOn >= '2022-01-01 00:00 +06:00'
and s.ReconciledOn < '2022-08-01 00:00 +06:00'
and s.ShipmentStatus not in (1,9,10)
and IsReturned=0
and IsCancelled=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and pv.DistributionNetworkId = 1
and pv.id in (6940,29812)

group by Year(dbo.toBdt(s.ReconciledOn)),
         Month(dbo.toBdt(s.ReconciledOn)),
		 DateName(Month,dbo.toBdt(s.ReconciledOn)),
         pv.id,
	     pv.name




	
--select *
--from Category c where c.Name like '%Dal or Lentil%'

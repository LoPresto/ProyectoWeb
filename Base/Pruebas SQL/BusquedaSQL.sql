DECLARE @SearchWord varchar(30)
SET @SearchWord ='gopro'


SELECT TOP 1000 [Id_publicacion]
      ,[Id_usr]
      ,[Titulo]
      ,[Descripcion]
      ,[PrecioD]
      ,[PrecioS]
      ,[PecioM]
      ,[FechaDesde]
      ,[FechaHasta]
      ,[Alquilado]
      ,[Suspendido]
      ,[Id_cat_lvl3]
  FROM [LoPresto].[dbo].[Publicaciones]
  WHERE ([Descripcion] LIKE '%% '+@SearchWord+' %%')
or  ([Descripcion] LIKE '%% '+@SearchWord+'')
or  ([Descripcion] LIKE ''+@SearchWord+' %%')
or  ([Descripcion] LIKE ''+@SearchWord+'')
or  ([Titulo] LIKE '%% '+@SearchWord+' %%')
or  ([Titulo] LIKE '%% '+@SearchWord+'')
or  ([Titulo] LIKE ''+@SearchWord+' %%')
or  ([Titulo] LIKE ''+@SearchWord+'')

USE Milk_CORE

GO


SELECT DB_NAME() AS DbName, 
    name AS FileName, 
	file_id,
    type_desc,
    size/128.0 AS CurrentSizeMB,  
    size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT)/128.0 AS FreeSpaceMB
FROM sys.database_files
WHERE type IN (0,1);

GO


CHECKPOINT 

GO

ALTER DATABASE Milk_CORE SET RECOVERY SIMPLE

GO

DBCC SHRINKFILE (N'Milk_CORELog' , 0, TRUNCATEONLY)

GO 

ALTER DATABASE Milk_CORE SET RECOVERY FULL

GO
SELECT DB_NAME() AS DbName, 
    name AS FileName, 
    type_desc,
    size/128.0 AS CurrentSizeMB,  
    size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT)/128.0 AS FreeSpaceMB
FROM sys.database_files
WHERE type IN (0,1);

GO
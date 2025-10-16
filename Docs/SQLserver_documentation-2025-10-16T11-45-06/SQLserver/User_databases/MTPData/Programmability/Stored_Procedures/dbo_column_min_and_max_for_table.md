#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.column_min_and_max_for_table

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[column_min_and_max_for_table]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @SchemaName | varchar(255) | 255 |
| @TableName | varchar(255) | 255 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE procedure [dbo].[column_min_and_max_for_table]
	@SchemaName varchar(255),
	@TableName varchar(255)
as
	--Returns the non-bit-type columns within schema @SchemaName, along with their minimum and maximum values or lengths.
	-- columns of types varchar or nvarchar are summarized as their minimum and maximum lengths
	-- whereas all other data types are summarized as the minimum and max values.
	DECLARE @sqlStatement NVARCHAR(MAX) = '';
	DECLARE @sqlStatementEnclosure NVARCHAR(MAX) = '';

	WITH CTE AS
	(
	    SELECT
	        SCH.[name] AS [Schema]
	        ,TAB.[name] AS [Table]
	        ,COL.[name] AS [Column]
			,COL.column_id
			,tp.name as TypeName
            ,COL.max_length
	    FROM sys.columns AS COL
	        JOIN sys.tables AS TAB
	            ON COL.[object_id] = TAB.[object_id]
	        JOIN sys.schemas AS SCH
	            ON TAB.[schema_id] = SCH.[schema_id]
			join sys.types as tp 
				ON COL.user_type_id = tp.user_type_id
	    WHERE COL.system_type_id NOT IN (104,240)
			AND SCH.name = @SchemaName
			and TAB.name = @TableName
	)

	SELECT @sqlStatement += 

	        'UNION ALL
	        SELECT 
	            '''+[Schema]+''' AS [Schema]
	            ,'''+[Table]+''' AS [Table]
	            ,'''+[Column]+''' AS [Column]
				,' + cast([column_id] as varchar(3)) + ' as ColumnID
				,'''+ [TypeName]  +''' as DataType
				,' + cast([max_length] as varchar(5))  + ' as MaxLenth
	            ,CASE '''+TypeName+'''
					WHEN ''varchar'' then CONVERT(NVARCHAR(MAX),MIN(LEN(['+[Column]+']))) 
					WHEN ''nvarchar'' then CONVERT(NVARCHAR(MAX),MIN(LEN(['+[Column]+']))) 
					else CONVERT(NVARCHAR(MAX),MIN(['+[Column]+'])) 
					END AS ColumnMin
	            ,CASE '''+TypeName+'''
					WHEN ''varchar'' then CONVERT(NVARCHAR(MAX),MAX(LEN(['+[Column]+']))) 
					WHEN ''nvarchar'' then CONVERT(NVARCHAR(MAX),MAX(LEN(['+[Column]+']))) 
					else CONVERT(NVARCHAR(MAX),MAX(['+[Column]+'])) 
					END AS ColumnMax
	        FROM ['+[Schema]+'].['+[Table]+']
	        '
	FROM CTE
	;

	SET @sqlStatement = STUFF(@sqlStatement,1,10,'');

	set @sqlStatementEnclosure = 'SELECT * FROM (' + @sqlStatement + ') as qry ORDER BY ColumnID'

	EXEC sp_executesql @sqlStatementEnclosure;
GO

```


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM


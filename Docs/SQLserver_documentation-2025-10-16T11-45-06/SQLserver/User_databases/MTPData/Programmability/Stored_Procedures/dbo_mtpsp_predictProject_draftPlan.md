#### 

[Project](../../../../../index.md) > [SQLserver](../../../../index.md) > [User databases](../../../index.md) > [MTPData](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > dbo.mtpsp_predictProject_draftPlan

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [dbo].[mtpsp_predictProject_draftPlan]

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
| @RevisionID | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql







CREATE PROCEDURE [dbo].[mtpsp_predictProject_draftPlan]
	@RevisionID as int
AS

DECLARE @EditionID tinyint

IF @RevisionID > 0
	SELECT * FROM dbo.mtpfn_predictProject_draftPlan(@RevisionID)
ELSE
begin
	SELECT @EditionID = EditionID
	FROM tblRevision
	WHERE RevisionID = (select max(RevisionID) from tblRevision where Posted = 1)

	SELECT * FROM dbo.mtpfn_currentProjects(@EditionID)
end
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblRevision]](../../Tables/dbo_tblRevision.md)
* [[dbo].[mtpfn_currentProjects]](../Functions/Table-valued_Functions/dbo_mtpfn_currentProjects.md)
* [[dbo].[mtpfn_predictProject_draftPlan]](../Functions/Table-valued_Functions/dbo_mtpfn_predictProject_draftPlan.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM


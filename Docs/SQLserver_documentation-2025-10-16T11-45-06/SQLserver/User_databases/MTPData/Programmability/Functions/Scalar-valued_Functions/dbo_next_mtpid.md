#### 

[Project](../../../../../../index.md) > [SQLserver](../../../../../index.md) > [User databases](../../../../index.md) > [MTPData](../../../index.md) > Programmability > Functions > [Scalar-valued Functions](Scalar-valued_Functions.md) > dbo.next_mtpid

# ![Scalar-valued Functions](../../../../../../Images/Function_Scalar32.png) [dbo].[next_mtpid]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
create function [dbo].[next_mtpid]()
returns int 
as 
begin

    declare @nextMTPID as int 

    ;with cte as (
        select max(MTPID) as max_mtpid
        from tblReviewPRoject
        union
        select max(MTPID)
        from tblProject
    )
    select @nextMTPID =  max(max_mtpid) + 1 from cte


    return @nextMTPID
end
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[tblProject]](../../../Tables/dbo_tblProject.md)
* [[dbo].[tblReviewProject]](../../../Tables/dbo_tblReviewProject.md)


---

###### Author:  Chris Peak

###### Copyright 2025 - All Rights Reserved

###### Created: Thursday, October 16, 2025 11:45:06 AM


SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
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

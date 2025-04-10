SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE Function [dbo].[mtpfn_CleanString](@Temp VarChar(max))
Returns NVarChar(max)
AS
Begin
	/*
		Returns a string stripped of characters below 32 on the ASCII table
		(i.e. new lines, carriage returns, tabs, etc)
		and of specific other characters that resolve poorly in the front-end (ASCII codes 160, 151, 150, etc)
	*/

    Declare @charindx as int
	select @charindx = 0

	while @charindx < 32 -- ASCII character 32 is the first printable character
	begin
		select @Temp = REPLACE(@Temp, char(@charindx),'')
		select @charindx = @charindx + 1
	end
	
	select @Temp = REPLACE(@Temp, char(34), char(96))
	select @Temp = REPLACE(@Temp, char(160),' ')
	select @Temp = REPLACE(@Temp, char(151),'--')
	select @Temp = REPLACE(@Temp, char(150),'-')
	select @Temp = REPLACE(@Temp, char(148), char(96))
	select @Temp = REPLACE(@Temp, char(147), char(96))
	select @Temp = REPLACE(@Temp, char(146), char(96))
	select @Temp = REPLACE(@Temp, char(145), char(96))

    Return @Temp
End


GO

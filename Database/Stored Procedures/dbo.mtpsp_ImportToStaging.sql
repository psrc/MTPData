SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[mtpsp_ImportToStaging]
	@MTPID INT,
	@Title nvarchar(1000) = null,
	@Agency smallint = null,
	@ProjDesc nvarchar(max) = null,
	@TotProjCost money = null,
	@ContactName nvarchar(50) = null,
	@ContactPhone nvarchar(100) = null,
	@ContactEmail nvarchar(100) = null,
	@EstCostYear int = null,
	@CompletionYear int = null,
	@MTPStatus int = null,
	@ProjectOn nvarchar(255) = null,
	@ProjectFrom nvarchar(255) = null,
	@ProjectTo nvarchar(255) = null,
	@MilePostFrom decimal(18,1) = null, @MilePostTo decimal(18,1) = null, @CountyID smallint = null, @FuncClassID tinyint = null, @StartYear int = null, --5
	@PrimaryImpType nvarchar(5) = null,
	@a1a bit,@a1b bit,@a2a bit,@a2b bit,@a3 bit,@a4 bit, --6
	@c1a bit,@c1b bit,@c1c bit,@c2a bit,@c2b bit,@c3 bit,@c4 bit,@c5 bit, --8
	@f1 bit,@f2 bit,@f3 bit,@f4a bit,@f4b bit,@f5 bit,@f6 bit, --7
	@j1a bit,@j1b bit,@j2 bit,@j3 bit,@j4 bit, --5
	@m1 bit,@m2 bit,@m3 bit, @m3a bit, @m3b bit, @m4 bit,@m5 bit,@m6 bit,@m7 bit, @m7a bit, @m7b bit, --11
	@o1 bit,@o2a bit,@o2b bit,@o2c bit,@o3a bit,@o3b bit,@o3c bit, --7
	@s1a bit,@s1b bit,@s1c bit,@s2 bit, --4
	@t1 bit,@t2 bit,@t3 bit,@t4 bit, --4
	@w1a bit,@w1b bit,@w1c bit,@w1d bit,@w2 bit,@w4a bit,@w4b bit, --7
	@change_title bit, @change_description bit, @change_sponsoring_agency bit, @change_start_year bit, @change_location_information bit, --5
	@change_total_cost bit, @change_constant_dollar_year bit, @change_completion_year bit, @change_functional_class bit, --4
	@prepopulated bit, @new_project bit, @modify_from_unprogrammed_to_constrained bit, @modify_constrained_project_details bit,  @modify_complete bit, --5
	@planning_process nvarchar(1000) = null, @letters_of_concurrence nvarchar(1000) = null, @funds_description nvarchar(2000) = null, @funds_committed decimal = null,
	@application_id int = null
as 

BEGIN TRY
BEGIN TRAN

	-- INSERT INTO tblStageProject
	INSERT INTO tblStageProject (MTPID, Title, Agency, ProjDesc, TotProjCost,
		ContactName, ContactPhone, ContactEmail, EstCostYear,
		CompletionYear, MTPStatus, ProjectOn, ProjectFrom,
		ProjectTo, MilePostFrom, MilePostTo, CountyID, 
		FuncClassiD, StartYear,
		planning_process, letters_of_concurrence, funds_description, funds_committed,
		modify_complete,
		change_title, change_description, change_sponsoring_agency, change_start_year, change_location_information,
		change_total_cost, change_constant_dollar_year, change_completion_year, change_functional_class, 
		prepopulated, new_project, application_id, modify_from_unprogrammed_to_constrained, modify_constrained_project_details)
    VALUES (@MTPID, @Title, @Agency, @ProjDesc, @TotProjCost,
		@ContactName, @ContactPhone, @ContactEmail, @EstCostYear,
		@CompletionYear, @MTPStatus, @ProjectOn, @ProjectFrom,
		@ProjectTo, @MilePostFrom, @MilePostTo, @CountyID, 
		@FuncClassiD, @StartYear,
		@planning_process, @letters_of_concurrence, @funds_description, @funds_committed,
		@modify_complete,
		@change_title, @change_description, @change_sponsoring_agency, @change_start_year, @change_location_information,
		@change_total_cost, @change_constant_dollar_year, @change_completion_year, @change_functional_class,
		@prepopulated, @new_project, @application_id, @modify_from_unprogrammed_to_constrained, @modify_constrained_project_details)

	INSERT INTO tblStagePrioritization 
	  (MTPID, a1a, a1b,  a2a, a2b, a3, a4, 
	  c1a, c1b, c1c, c2a, c2b, c3, c4, c5, 
	  f1, f2, f3, f4a,  f4b, f5, f6, 
	  j1a, j1b, j2, j3, j4, 
	  m1, m2, m3, m3a, m3b, m4, m5, m6, m7, m7a, m7b,
	  o1, o2a, o2b, o2c, o3a, o3b, o3c, 
	  s1a, s1b, s1c, s2, 
	  t1, t2, t3, t4, 
	  w1a, w1b, w1c, w1d, w2, w4a, w4b )
	VALUES
	(
	  @mtpid, @a1a, @a1b, @a2a, @a2b, @a3, @a4,
	  @c1a, @c1b, @c1c, @c2a, @c2b, @c3, @c4, @c5,
	  @f1, @f2, @f3, @f4a, @f4b, @f5, @f6,
	  @j1a, @j1b, @j2, @j3, @j4,
	  @m1, @m2, @m3, @m3a, @m3b, @m4, @m5, @m6, @m7,@m7a, @m7b,
	  @o1, @o2a, @o2b, @o2c, @o3a, @o3b, @o3c,
	  @s1a, @s1b, @s1c, @s2,
	  @t1, @t2, @t3, @t4,
	  @w1a, @w1b, @w1c, @w1d, @w2, @w4a, @w4b
	)

	INSERT INTO tblStageProj_ImpType (MTPID, isPrimary, OldID)
	VALUES (@mtpid, 1, @PrimaryImpType)

COMMIT TRAN
END TRY

BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
        
      ROLLBACK TRANSACTION;

END CATCH
GO
GRANT EXECUTE ON  [dbo].[mtpsp_ImportToStaging] TO [db_spExecutor]
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- =============================================
-- Author:      Bryan Eddy
-- Create date: 8/14/2017
-- Description: Import data from NAACAB-SCH01 for PSS information
-- Version: 1
-- Update:	n/a
-- =============================================
*/

CREATE PROCEDURE [APS].[usp_getSetupData]
as
SET NOCOUNT ON;
BEGIN

 
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();

	BEGIN TRY
		BEGIN TRAN

		MERGE dbo.REC_Recipe Target
		USING ( SELECT * FROM [NAACAB-SCH01].PlanetTogether_Data_Test.Setup.vInterfaceRecipeManagementSystem CROSS APPLY dbo.REC_Project) AS Source
		ON Target.name = Source.SetupNumber
		WHEN NOT MATCHED BY TARGET THEN
		INSERT(ProjectUUID,ParentRecipeUUID,Name, State,[Group])
		VALUES(SOURCE.ProjectUUID, '',SetupNumber,'','');
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


	--Update attribute value data 
	BEGIN TRY
		BEGIN TRAN
			MERGE dbo.REC_RecipeValue Target
			USING(SELECT  J.ProjectUUID, machinename, p.name, k.AttributeValue,O.RecipeUUID, J.ProdItemUUID, p.ProdItemValueUUID, Setupnumber
					FROM [REC_ProdItem] J CROSS APPLY usf_splitstring(ItemPath,'\') G 
					INNER JOIN [NAACAB-SCH01].PlanetTogether_Data_Test.Setup.vInterfaceRecipeManagementSystem K ON K.MachineName = g.part
					INNER JOIN dbo.REC_ProdItemValue p ON p.Name = k.AttributeName AND CAST(p.Description AS INT) = k.attributeid AND p.ProdItemUUID = J.ProdItemUUID
					INNER JOIN dbo.REC_Recipe O ON O.name = SetupNumber
					--WHERE setupnumber = 'r881'
					) AS Source
			ON (Target.ProdItemUUID = Source.ProdItemUUID AND target.ProdItemValueUUID = source.ProdItemValueUUID AND target.RecipeUUID = Source.RecipeUUID)
			WHEN MATCHED THEN
			UPDATE SET target.Value = source.attributeValue
			WHEN NOT MATCHED BY TARGET THEN
				INSERT(RecipeUUID,ProdItemUUID,ProdItemValueUUID,Value)
				VALUES(Source.RecipeUUID,Source.ProdItemUUID, Source.ProdItemValueUUID, AttributeValue);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;

		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH

END


GO
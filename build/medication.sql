CREATE TABLE "Y24GROUP054"."MEDICATION" (
	"MEDICATION_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT "MDCTN_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"MEDICATION_NAME" VARCHAR2(50)
)
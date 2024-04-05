CREATE TABLE "Y24GROUP054"."CHILD_MEDICATION" (
	"RECORD_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT "RCORD_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"CHILD_ID" INTEGER NOT NULL,
	"MEDICATION_ID" INTEGER NOT NULL,
	"DOSAGE_MG" NUMBER(6, 2),
	"FREQUENCY" VARCHAR2(15),
	"DESCRIPTION" VARCHAR2(50)
);
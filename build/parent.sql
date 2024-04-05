CREATE TABLE "Y24GROUP054"."PARENT" (
	"PARENT_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT "PRNT_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"FIRST_NAME" VARCHAR2(20) CONSTRAINT "PRNT_FIRST_NAME_NN" NOT NULL ENABLE,
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "PRNT_LAST_NAME_NN" NOT NULL ENABLE,
	"PARENT_TYPE" INTEGER,
	"EMAIL" VARCHAR2(25) CONSTRAINT "PRNT_EMAIL_NN" NOT NULL ENABLE,
	"CONTACT_NUMBER" VARCHAR2(20),
	"ADDRESS" ADDR_OBJ
);
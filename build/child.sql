CREATE TABLE "Y24GROUP054"."CHILD" (
	"CHILD_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT "CHLD_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"PARENT_ID" INTEGER NOT NULL,
	"WAITLIST_ID" INTEGER,
	"FIRST_NAME" VARCHAR2(20) CONSTRAINT "CHLD_FIRST_NAME_NN" NOT NULL ENABLE,
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "CHLD_LAST_NAME_NN" NOT NULL ENABLE,
	"EMERGENCY_CONTACT" CONTACT,
	"CCS_PERCENTAGE" NUMBER(4, 4),
	"DOB" DATE
);
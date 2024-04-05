CREATE TABLE "Y24GROUP054"."PARENT_TYPE" (
    "TYPE_ID" INTEGER CONSTRAINT "PTYPE_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "TYPE_NAME" VARCHAR2(14) NOT NULL,
    "PARENT_ID" INTEGER NOT NULL,
    "EMPLOYEE_ID" INTEGER,
    "ZID" VARCHAR2(8),
    "LEAVE_DATE" DATE
);
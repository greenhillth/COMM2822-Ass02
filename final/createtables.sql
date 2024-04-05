CREATE TABLE "Y24GROUP054"."ACTIVITY" (
    "ACTIVITY_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "ACVTY_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "NAME" VARCHAR2(50) NOT NULL,
    "DESCRIPTION" VARCHAR2(50)
);
CREATE TABLE "Y24GROUP054"."CHILD_ATTENDANCE" (
    "ROLL_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "C_ROLL_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "CHILD_ID" INTEGER NOT NULL,
    "CLASS_ID" INTEGER NOT NULL,
    "ARRIVAL" DATE NOT NULL,
    "DEPARTURE" DATE NOT NULL
);
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
CREATE TABLE "Y24GROUP054"."CLASS_ACTIVITY" (
    "CLASS_ID" INTEGER NOT NULL ENABLE PRIMARY KEY,
    "ACTIVITY_ID" INTEGER NOT NULL
);
CREATE TABLE "Y24GROUP054"."CLASS" (
    "CLASS_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "CLASS_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "ROOM_ID" INTEGER NOT NULL
);
CREATE TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE" (
    "ROLL_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "ROLL_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "EMPLOYEE_ID" INTEGER NOT NULL,
    "CLASS_ID" INTEGER NOT NULL,
    "ARRIVAL" DATE NOT NULL,
    "DEPARTURE" DATE NOT NULL
);
CREATE TABLE "Y24GROUP054"."EMPLOYEE_QUALIFICATION" (
    "EMPLOYEE_ID" INTEGER NOT NULL PRIMARY KEY,
    "QUALIFICATION_ID" INTEGER NOT NULL
);
CREATE TABLE "Y24GROUP054"."EMPLOYEE" (
	"EMPLOYEE_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT "EMP_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"FIRST_NAME" VARCHAR2(20) CONSTRAINT "EMP_FIRST_NAME_NN" NOT NULL ENABLE,
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE,
	"EMAIL" VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE,
	"CONTACT_NUMBER" VARCHAR2(20),
	"HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE,
	"ADDRESS" ADDR_OBJ,
	"SALARY" NUMBER(8, 2) CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE
	--"JOB_ID" VARCHAR2 (10) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE,
);
CREATE TABLE "Y24GROUP054"."INVENTORY" (
    "INVENTORY_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "INVTRY_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "NAME" VARCHAR2(50) NOT NULL,
    "DESCRIPTION" VARCHAR2(50)
);
CREATE TABLE "Y24GROUP054"."MEDICATION" (
	"MEDICATION_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT "MDCTN_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"MEDICATION_NAME" VARCHAR2(50)
);
CREATE TABLE "Y24GROUP054"."PARENT_TYPE" (
    "TYPE_ID" INTEGER CONSTRAINT "PTYPE_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "TYPE_NAME" VARCHAR2(14) NOT NULL,
    "PARENT_ID" INTEGER NOT NULL,
    "EMPLOYEE_ID" INTEGER,
    "ZID" VARCHAR2(8),
    "LEAVE_DATE" DATE
);
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
CREATE TABLE "Y24GROUP054"."PAYMENT" (
    "PAYMENT_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "PMT_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "CHILD_ID" INTEGER NOT NULL,
    "AMOUNT" NUMBER(8, 2),
    "DATE_ISSUE" DATE,
    "DATE_DUE" DATE,
    "STATUS" NVARCHAR2 (25)
);
CREATE TABLE "Y24GROUP054"."QUALIFICATION" (
    "QUALIFICATION_ID" INTEGER CONSTRAINT "QLF_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "DESCRIPTION" VARCHAR2(100) CONSTRAINT "QLF_DESC_NN" NOT NULL ENABLE
);
CREATE TABLE "Y24GROUP054"."ROOM_INVENTORY" (
    "ROOM_ID" INTEGER NOT NULL ENABLE PRIMARY KEY,
    "INVENTORY_ID" INTEGER NOT NULL
);
CREATE TABLE "Y24GROUP054"."ROOM" (
    "ROOM_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "ROOM_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "NAME" VARCHAR2(25) NOT NULL,
    "LOCATION" VARCHAR2(50),
    "MAX_CAPACITY" NUMBER(3),
    "MIN_AGE" NUMBER(3),
    "MAX_AGE" NUMBER(3)
);
CREATE TABLE "Y24GROUP054"."WAITLIST" (
	"WAITLIST_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 1
	) CONSTRAINT "WLIST_ID_NN" NOT NULL ENABLE PRIMARY KEY,
	"DATE_ADDED" DATE
);

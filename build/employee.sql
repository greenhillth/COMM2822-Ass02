CREATE TABLE "Y24GROUP054"."EMPLOYEE" (
	"EMPLOYEE_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
		START WITH 101
	) CONSTRAINT EMP_ID_NN NOT NULL ENABLE,
	"FIRST_NAME" VARCHAR2(20) CONSTRAINT EMP_FIRST_NAME_NN NOT NULL ENABLE,
	"LAST_NAME" VARCHAR2(25) CONSTRAINT EMP_LAST_NAME_NN NOT NULL ENABLE,
	"EMAIL" VARCHAR2(25) CONSTRAINT EMP_EMAIL_NN NOT NULL ENABLE,
	"CONTACT_NUMBER" VARCHAR2(20),
	"HIRE_DATE" DATE CONSTRAINT EMP_HIRE_DATE_NN NOT NULL ENABLE,
	"ADDRESS" ADDR_OBJ,
	"SALARY" NUMBER(8, 2)
	--"JOB_ID" VARCHAR2 (10) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE,
);

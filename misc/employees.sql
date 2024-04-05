CREATE TABLE "Y24GROUP054"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE, 
	"PHONE_NUMBER" VARCHAR2(20), 
	"HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE, 
	"JOB_ID" VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE, 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0), 
	 CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE, 
	 CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS"  ENABLE, 
	 CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "Y24GROUP054"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE, 
	 CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "Y24GROUP054"."JOBS" ("JOB_ID") ENABLE, 
	 CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "Y24GROUP054"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS" ;
  CREATE UNIQUE INDEX "Y24GROUP054"."EMP_EMP_ID_PK" ON "Y24GROUP054"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS" ;
ALTER TABLE "Y24GROUP054"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX "Y24GROUP054"."EMP_EMP_ID_PK"  ENABLE;

   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the 
jobs table. A not null column.';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater 
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales 
department elgible for commission percentage';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in 
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id 
column of the departments table';
   COMMENT ON TABLE "Y24GROUP054"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments, 
jobs, job_history tables. Contains a self reference.';

  CREATE INDEX "Y24GROUP054"."EMP_DEPARTMENT_IX" ON "Y24GROUP054"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS" ;

  CREATE INDEX "Y24GROUP054"."EMP_JOB_IX" ON "Y24GROUP054"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS" ;

  CREATE INDEX "Y24GROUP054"."EMP_MANAGER_IX" ON "Y24GROUP054"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS" ;

  CREATE INDEX "Y24GROUP054"."EMP_NAME_IX" ON "Y24GROUP054"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GROUPS" ;
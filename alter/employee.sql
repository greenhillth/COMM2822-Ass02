-- Modify Employee table
ALTER TABLE "Y24GROUP054"."EMPLOYEE"
ADD (
    -- Data Validation
    CONSTRAINT VALIDATE_EMP_EMAIL CHECK (
        REGEXP_LIKE (
            "EMAIL",
            '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
        )
    ) ENABLE,
    CONSTRAINT EMP_SALARY_MIN CHECK (salary > 0) ENABLE
);
/
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."EMPLOYEE_ID" IS 'Primary key of employees table.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."FIRST_NAME" IS 'Employee first name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."LAST_NAME" IS 'Employee last name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."EMAIL" IS 'Employee email address';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."CONTACT_NUMBER" IS 'Employee phone number, contains area extenstions';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."HIRE_DATE" IS 'Start date of employment. A not null column.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."ADDRESS" IS 'Employee address. Stored as an ADDR_OBJ object.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."SALARY" IS 'Yearly salary of the employee. Must be greater than 0.';
COMMENT ON TABLE "Y24GROUP054"."EMPLOYEE" IS 'Employees table.';
--COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the jobs table. A not null column.';

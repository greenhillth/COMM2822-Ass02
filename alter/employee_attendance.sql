ALTER TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE"
ADD (
    -- primary keys
    CONSTRAINT E_ROLL_ID_PK PRIMARY KEY ("ROLL_ID") ENABLE,
    -- foreign keys
    CONSTRAINT ATNDCE_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT ATNDCE_CLASS_FK FOREIGN KEY ("CLASS_ID") references "CLASS" ("CLASS_ID"),
    -- data validation
    CONSTRAINT DEP_AFT_ARR CHECK ("DEPARTURE" > "ARRIVAL") ENABLE
);
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of employees class attendance.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."EMPLOYEE_ID" IS 'Foreign key to referenced Employee ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance. Must occur after arrival.';
COMMENT ON TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE" IS 'Register of all attendances of staff.';
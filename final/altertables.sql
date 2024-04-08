ALTER TABLE "Y24GROUP054"."ACTIVITY"
ADD (
    CONSTRAINT U_ACTIVITY UNIQUE ("NAME") ENABLE
);
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."ACTIVITY_ID" IS 'Primary key of Activity table.';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."NAME" IS 'Activity Name. Unique, not nullable';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."DESCRIPTION" IS 'Activity Description. Max size: 50 chars.';
COMMENT ON TABLE "Y24GROUP054"."ACTIVITY" IS 'Register of activities used by classes.';
ALTER TABLE "Y24GROUP054"."CHILD_ATTENDANCE"
ADD (
    CONSTRAINT ATTN_TIME_INTERVAL CHECK ("DEPARTURE" > "ARRIVAL") ENABLE
);
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of class attendance.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance. Must occur after arrival.';
COMMENT ON TABLE "Y24GROUP054"."CHILD_ATTENDANCE" IS 'Register of all attendances of enrolled children.';
ALTER TABLE "Y24GROUP054"."CHILD_MEDICATION"
ADD (
    CONSTRAINT CMED_MED_FK FOREIGN KEY ("MEDICATION_ID") references "MEDICATION" ("MEDICATION_ID"),
    CONSTRAINT CMED_CHILD_FK FOREIGN KEY ("CHILD_ID") references "CHILD" ("CHILD_ID")
);
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."RECORD_ID" IS 'Primary key of Medication table.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."MEDICATION_ID" IS 'Foreign key to referenced Medication ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."DOSAGE_MG" IS 'Medicine dosage (in milligrams).';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."FREQUENCY" IS 'Frequency of dosage (i.e hourly, twice a day etc.)';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."DESCRIPTION" IS 'Other information about medication administration';
COMMENT ON TABLE "Y24GROUP054"."CHILD_MEDICATION" IS 'Register of child medication information';
ALTER TABLE "Y24GROUP054"."CHILD"
ADD (
    -- Foreign Keys
    CONSTRAINT CHILD_PARENT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT CHILD_WLIST_FK FOREIGN KEY ("WAITLIST_ID") references "WAITLIST" ("WAITLIST_ID"),
    -- Data validation
    CONSTRAINT CCS_PCT_BOUNDS CHECK (
        "CCS_PERCENTAGE" >= 0
        AND "CCS_PERCENTAGE" <= 1
    ) ENABLE
);

COMMENT ON COLUMN "Y24GROUP054"."CHILD"."CHILD_ID" IS 'Primary key of Child table. Uniquely identifies enrolled children.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."PARENT_ID" IS 'Foreign key to referenced Parent ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."WAITLIST_ID" IS 'Foreign key to referenced Waitlist ID. Nullable as child may not be on waitlist.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."FIRST_NAME" IS 'First name of child. Max size: 20 chars.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."LAST_NAME" IS 'Last name of child. Max size: 25 chars.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."EMERGENCY_CONTACT" IS 'Information about emergency contact. Stored as a Contact object.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."CCS_PERCENTAGE" IS 'Decimal number between 0-1 representing percentage CCS subsidy. Precision: 4 decimal places.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."DOB" IS 'Date of birth of child. Stored as a datetime object with the time set to 12:00am.';
COMMENT ON TABLE "Y24GROUP054"."CHILD" IS 'Register of enrolled/waitlisted children.';
ALTER TABLE "Y24GROUP054"."CLASS_ACTIVITY"
ADD (
    CONSTRAINT CACT_CLASS_FK FOREIGN KEY ("CLASS_ID") references "CLASS" ("CLASS_ID"),
    CONSTRAINT CACT_ACT_FK FOREIGN KEY ("ACTIVITY_ID") references "ACTIVITY" ("ACTIVITY_ID")
);
ALTER TABLE "Y24GROUP054"."CLASS"
ADD (
    CONSTRAINT CLASS_ROOM_FK FOREIGN KEY ("ROOM_ID") references "ROOM" ("ROOM_ID")
);
COMMENT ON COLUMN "Y24GROUP054"."CLASS"."CLASS_ID" IS 'Primary key of class table. Uniquely identifies a class.';
COMMENT ON COLUMN "Y24GROUP054"."CLASS"."ROOM_ID" IS 'Foreign key referencing room class is occurring in. Not nullable';
COMMENT ON TABLE "Y24GROUP054"."CLASS" IS 'Table containing information about class instances.';
ALTER TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE"
ADD (
    -- foreign keys
    CONSTRAINT ATNDCE_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT ATNDCE_CLASS_FK FOREIGN KEY ("CLASS_ID") references "CLASS" ("CLASS_ID"),
    -- data validation
    CONSTRAINT DEP_AFT_ARR CHECK ("DEPARTURE" > "ARRIVAL")
);
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of employees class attendance.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."EMPLOYEE_ID" IS 'Foreign key to referenced Employee ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance. Must occur after arrival.';
COMMENT ON TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE" IS 'Register of all attendances of staff.';
ALTER TABLE "Y24GROUP054"."EMPLOYEE_QUALIFICATION"
ADD (
    CONSTRAINT QUAL_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT QUAL_QID_FK FOREIGN KEY ("QUALIFICATION_ID") references "QUALIFICATION" ("QUALIFICATION_ID")
);
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_QUALIFICATION"."EMPLOYEE_ID" IS 'Reference to employee holding qualification. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_QUALIFICATION"."QUALIFICATION_ID" IS 'Reference to qualification in question. Not nullable.';
ALTER TABLE "Y24GROUP054"."EMPLOYEE"
-- Constraints
ADD (
    -- Data Validation
    CONSTRAINT VALIDATE_EMP_EMAIL CHECK (
        REGEXP_LIKE (
            "EMAIL",
            '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
        )
    ),
    CONSTRAINT EMP_SALARY_MIN CHECK (salary > 0)
);
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
ALTER TABLE "Y24GROUP054"."INVENTORY"
ADD (
    --null
);
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."INVENTORY_ID" IS 'Primary key of inventory table. Represents an individual item.';
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."NAME" IS 'Name of item. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."DESCRIPTION" IS 'Short description of item.';
COMMENT ON TABLE "Y24GROUP054"."INVENTORY" IS 'Record of all items at centre.';
ALTER TABLE "Y24GROUP054"."MEDICATION"
ADD (
    --null
);
ALTER TABLE "Y24GROUP054"."PARENT_TYPE"
ADD (
    -- Foreign Keys
    CONSTRAINT PTYPE_PRNT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT PTYPE_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    --Data Validation
    CONSTRAINT VALID_TYPES CHECK (
        ("TYPE_ID", "TYPE_NAME") IN (
            SELECT
                1 AS "TYPE_ID",
                'EMPLOYEE' AS "TYPE_NAME"
            FROM
                DUAL
            UNION ALL
            SELECT
                2 AS "TYPE_ID",
                'UNSW_PHD' AS "TYPE_NAME"
            FROM
                DUAL
            UNION ALL
            SELECT
                3 AS "TYPE_ID",
                'UNSW_STAFF' AS "TYPE_NAME"
            FROM
                DUAL
            UNION ALL
            SELECT
                4 AS "TYPE_ID",
                'UNSW_PREVIOUS' AS "TYPE_NAME"
            FROM
                DUAL
        )
    )
);
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."RECORD_ID" IS 'Identifier record for given parent. Primary key.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW).';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_NAME" IS 'Holds text representation of parent type. Type and number must match.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."PARENT_ID" IS 'ID of affiliated parent';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."EMPLOYEE_ID" IS 'Employee ID of parent, in the case parent is of type 1 (employee).';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."ZID" IS 'zID of parent. Nullable in the case parent is not affiliated with UNSW.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."LEAVE_DATE" IS 'Leave date of parent. Nullable in the case parent is not Ex-UNSW.';
COMMENT ON TABLE "Y24GROUP054"."PARENT_TYPE" IS 'Contains records of parent_type and affiliated data.';
ALTER TABLE "Y24GROUP054"."PARENT"
ADD (
    -- Data validation
    CONSTRAINT VALIDATE_PRNT_EMAIL CHECK (
        REGEXP_LIKE (
            "EMAIL",
            '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
        )
    ) ENABLE
);
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."PARENT_ID" IS 'Primary key of parent table.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."FIRST_NAME" IS 'Parent first name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."LAST_NAME" IS 'Parent last name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."TYPE" IS 'Type of parent. Nullable in the case parent member of public.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."EMAIL" IS 'Parent email address';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."CONTACT_NUMBER" IS 'Parent phone number, contains area extenstions';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."ADDRESS" IS 'Parent address. Stored as an ADDR_OBJ object.';
COMMENT ON TABLE "Y24GROUP054"."PARENT" IS 'Parents table.';
ALTER TABLE "Y24GROUP054"."PAYMENT"
ADD (
    -- Foreign keys
    CONSTRAINT PMT_CHILD_FK FOREIGN KEY ("CHILD_ID") references "CHILD" ("CHILD_ID")
    -- Data validation
);
ALTER TABLE "Y24GROUP054"."QUALIFICATION"
ADD (
    CONSTRAINT U_QLFCN UNIQUE ("DESCRIPTION") ENABLE
);
ALTER TABLE "Y24GROUP054"."ROOM_INVENTORY"
ADD (
    --null
);
ALTER TABLE "Y24GROUP054"."ROOM"
ADD (
    --null
);
ALTER TABLE "Y24GROUP054"."WAITLIST"
ADD (
    --null
);

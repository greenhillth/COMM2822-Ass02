ALTER TABLE "Y24GROUP054"."ACTIVITY"


COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."ACTIVITY_ID" IS 'Primary key of Activity table.';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."NAME" IS 'Activity Name. Not nullable';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."DESCRIPTION" IS 'Activity Description. Max size: 50 chars.';
COMMENT ON TABLE "Y24GROUP054"."ACTIVITY" IS 'Register of activities used by classes.';
ALTER TABLE "Y24GROUP054"."CHILD_ATTENDANCE"


COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of class attendance.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance';
COMMENT ON TABLE "Y24GROUP054"."CHILD_ATTENDANCE" IS 'Register of all attendances of enrolled children.';
ALTER TABLE "Y24GROUP054"."CHILD_MEDICATION"
ADD (
    CONSTRAINT CMED_MED_FK foreign key ("MEDICATION_ID") references "MEDICATION" ("MEDICATION_ID"),
    CONSTRAINT CMED_CHILD_FK foreign key ("CHILD_ID") references "CHILD" ("CHILD_ID")
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
    CONSTRAINT CHILD_PARENT_FK foreign key ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT CHILD_WLIST_FK foreign key ("WAITLIST_ID") references "WAITLIST" ("WAITLIST_ID")
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
    CONSTRAINT CACT_CLASS_FK foreign key ("CLASS_ID") references "CLASS" ("CLASS_ID"),
    CONSTRAINT CACT_ACT_FK foreign key ("ACTIVITY_ID") references "ACTIVITY" ("ACTIVITY_ID")
);
ALTER TABLE "Y24GROUP054"."CLASS"
ADD (
    constraint CLASS_ROOM_FK foreign key ("ROOM_ID") references "ROOM" ("ROOM_ID")
);
ALTER TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE"
ADD (
    -- foreign keys
    CONSTRAINT ATNDCE_EMP_FK foreign key ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT ATNDCE_CLASS_FK foreign key ("CLASS_ID") references "CLASS" ("CLASS_ID"),

    -- data validation
    CONSTRAINT DEP_AFT_ARR CHECK("DEPARTURE" > "ARRIVAL") ENABLE
);
ALTER TABLE "Y24GROUP054"."EMPLOYEE_QUALIFICATION"
ADD (
    CONSTRAINT QUAL_EMP_FK foreign key ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT QUAL_QID_FK foreign key ("QUALIFICATION_ID") references "QUALIFICATION" ("QUALIFICATION_ID")
);
ALTER TABLE "Y24GROUP054"."EMPLOYEE"
-- Constraints
--CONSTRAINT
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
ALTER TABLE "Y24GROUP054"."PARENT_TYPE"
ADD (
    constraint PTYPE_PRNT_FK foreign key ("PARENT_ID") references "PARENT" ("PARENT_ID")
);

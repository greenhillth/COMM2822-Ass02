--header
-- Modify Activity table
ALTER TABLE "Y24GROUP054"."ACTIVITY"
ADD (
    CONSTRAINT U_ACTIVITY UNIQUE ("NAME") ENABLE
);
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."ACTIVITY_ID" IS 'Primary key of Activity table.';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."NAME" IS 'Activity Name. Unique, not nullable';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."DESCRIPTION" IS 'Activity Description. Max size: 50 chars.';
COMMENT ON TABLE "Y24GROUP054"."ACTIVITY" IS 'Register of activities used by classes.';
-- Modify Child_attendance table
ALTER TABLE "Y24GROUP054"."CHILD_ATTENDANCE"
ADD (
    CONSTRAINT ATTN_TIME_INTERVAL CHECK ("DEPARTURE" > "ARRIVAL") ENABLE
);
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of class attendance.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance. Must occur after arrival.';
COMMENT ON TABLE "Y24GROUP054"."CHILD_ATTENDANCE" IS 'Register of all attendances of enrolled children.';
-- Modify Child_medication table
ALTER TABLE "Y24GROUP054"."CHILD_MEDICATION"
ADD (
    CONSTRAINT CMED_MED_FK FOREIGN KEY ("MEDICATION_ID") references "MEDICATION" ("MEDICATION_ID"),
    CONSTRAINT CMED_CHILD_FK FOREIGN KEY ("CHILD_ID") references "CHILD" ("CHILD_ID")
);
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."RECORD_ID" IS 'Primary key of Medication table.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."MEDICATION_ID" IS 'Foreign key to referenced Medication ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."DOSAGE_MG" IS 'Medicine dosage (in milligrams).';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."FREQUENCY" IS 'Frequency of dosage (i.e hourly, twice a day etc.)';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."DESCRIPTION" IS 'Other information about medication administration';
COMMENT ON TABLE "Y24GROUP054"."CHILD_MEDICATION" IS 'Register of child medication information';
-- Modify Child table
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
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."CHILD_ID" IS 'Primary key of Child table. Uniquely identifies enrolled children.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."PARENT_ID" IS 'Foreign key to referenced Parent ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."WAITLIST_ID" IS 'Foreign key to referenced Waitlist ID. Nullable as child may not be on waitlist.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."FIRST_NAME" IS 'First name of child. Max size: 20 chars.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."LAST_NAME" IS 'Last name of child. Max size: 25 chars.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."EMERGENCY_CONTACT" IS 'Information about emergency contact. Stored as a Contact object.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."CCS_PERCENTAGE" IS 'Decimal number between 0-1 representing percentage CCS subsidy. Precision: 4 decimal places.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."DOB" IS 'Date of birth of child. Stored as a datetime object with the time set to 12:00am.';
COMMENT ON TABLE "Y24GROUP054"."CHILD" IS 'Register of enrolled/waitlisted children.';
-- Modify Class_activity table
ALTER TABLE "Y24GROUP054"."CLASS_ACTIVITY"
ADD (
    CONSTRAINT CACT_CLASS_FK FOREIGN KEY ("CLASS_ID") references "CLASS" ("CLASS_ID"),
    CONSTRAINT CACT_ACT_FK FOREIGN KEY ("ACTIVITY_ID") references "ACTIVITY" ("ACTIVITY_ID")
);
/
-- Modify Class table
ALTER TABLE "Y24GROUP054"."CLASS"
ADD (
    CONSTRAINT CLASS_ROOM_FK FOREIGN KEY ("ROOM_ID") references "ROOM" ("ROOM_ID")
);
/
COMMENT ON COLUMN "Y24GROUP054"."CLASS"."CLASS_ID" IS 'Primary key of class table. Uniquely identifies a class.';
COMMENT ON COLUMN "Y24GROUP054"."CLASS"."ROOM_ID" IS 'Foreign key referencing room class is occurring in. Not nullable';
COMMENT ON TABLE "Y24GROUP054"."CLASS" IS 'Table containing information about class instances.';
-- Modify Employee_attendance table
ALTER TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE"
ADD (
    -- foreign keys
    CONSTRAINT ATNDCE_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT ATNDCE_CLASS_FK FOREIGN KEY ("CLASS_ID") references "CLASS" ("CLASS_ID"),
    -- data validation
    CONSTRAINT DEP_AFT_ARR CHECK ("DEPARTURE" > "ARRIVAL") ENABLE
);
/
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of employees class attendance.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."EMPLOYEE_ID" IS 'Foreign key to referenced Employee ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance. Must occur after arrival.';
COMMENT ON TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE" IS 'Register of all attendances of staff.';
-- Modify Employee_qualification table
ALTER TABLE "Y24GROUP054"."EMPLOYEE_QUALIFICATION"
ADD (
    CONSTRAINT QUAL_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT QUAL_QID_FK FOREIGN KEY ("QUALIFICATION_ID") references "QUALIFICATION" ("QUALIFICATION_ID")
);
/
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_QUALIFICATION"."EMPLOYEE_ID" IS 'Reference to employee holding qualification. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_QUALIFICATION"."QUALIFICATION_ID" IS 'Reference to qualification in question. Not nullable.';
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
-- Modify Inventory table
ALTER TABLE "Y24GROUP054"."INVENTORY"
ADD (
    --null
);
/
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."INVENTORY_ID" IS 'Primary key of inventory table. Represents an individual item.';
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."NAME" IS 'Name of item. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."DESCRIPTION" IS 'Short description of item.';
COMMENT ON TABLE "Y24GROUP054"."INVENTORY" IS 'Record of all items at centre.';
-- Modify Medication table
ALTER TABLE "Y24GROUP054"."MEDICATION"
ADD (
    --null
);
/
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
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."RECORD_ID" IS 'Identifier record for given parent. Primary key.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW).';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_NAME" IS 'Holds text representation of parent type. Type and number must match.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."PARENT_ID" IS 'ID of affiliated parent';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."EMPLOYEE_ID" IS 'Employee ID of parent, in the case parent is of type 1 (employee).';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."ZID" IS 'zID of parent. Nullable in the case parent is not affiliated with UNSW.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."LEAVE_DATE" IS 'Leave date of parent. Nullable in the case parent is not Ex-UNSW.';
COMMENT ON TABLE "Y24GROUP054"."PARENT_TYPE" IS 'Contains records of parent_type and affiliated data.';
-- Modify Parent table
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
/
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."PARENT_ID" IS 'Primary key of parent table.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."FIRST_NAME" IS 'Parent first name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."LAST_NAME" IS 'Parent last name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."TYPE" IS 'Type of parent. Nullable in the case parent member of public.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."EMAIL" IS 'Parent email address';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."CONTACT_NUMBER" IS 'Parent phone number, contains area extenstions';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."ADDRESS" IS 'Parent address. Stored as an ADDR_OBJ object.';
COMMENT ON TABLE "Y24GROUP054"."PARENT" IS 'Parents table.';
-- Modify Payment Table
ALTER TABLE "Y24GROUP054"."PAYMENT"
ADD (
    -- Foreign keys
    CONSTRAINT PMT_CHILD_FK FOREIGN KEY ("CHILD_ID") references "CHILD" ("CHILD_ID")
    -- Data validation
);
/
-- Modify Qualification Table
ALTER TABLE "Y24GROUP054"."QUALIFICATION"
ADD (
    CONSTRAINT U_QLFCN UNIQUE ("DESCRIPTION") ENABLE
);
/
-- Modify Room_inventory table
ALTER TABLE "Y24GROUP054"."ROOM_INVENTORY"
ADD (
    --null
);
/
-- Modify room table
ALTER TABLE "Y24GROUP054"."ROOM"
ADD (
    --null
);
/
-- Modify Waitlist table
ALTER TABLE "Y24GROUP054"."WAITLIST"
ADD (
    --null
);
/
CREATE
OR REPLACE PROCEDURE addChild (
    full_name VARCHAR2,
    parent_name VARCHAR2,
    c_dob DATE,
    e_contact CONTACT,
    wlist_id INTEGER,
    ccs_pctge NUMBER
) AS
    name_first VARCHAR2(25);
    name_last VARCHAR2(25);
    prnt_id INTEGER;
BEGIN
    -- Parse full name string to first and last names
    name_first := SUBSTR(full_name, 1, INSTR(full_name,' ')-1);
    name_last := SUBSTR(full_name, INSTR(full_name,' ')+1);


    -- Get parent ID from name
    SELECT "PARENT_ID" INTO prnt_id
    FROM "PARENT"
    WHERE ("FIRST_NAME" || ' ' || "LAST_NAME") = parent_name;
    
    -- Insert into database
    INSERT INTO
    "CHILD"(PARENT_ID, FIRST_NAME, LAST_NAME, DOB, EMERGENCY_CONTACT, WAITLIST_ID, CCS_PERCENTAGE)
    VALUES
        (prnt_id, name_first, name_last, c_dob, e_contact, wlist_id, ccs_pctge);
    COMMIT;
    -- Handle exceptions
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Parent ID not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END addChild;
/

-- Implementation examples
/*
BEGIN
    addChild('Melody Pond', 'Mackenzie Wilson', '09-DEC-2022',
        CONTACT('Steve', 'Jobs',  '0400 325 397',
        ADDR_OBJ(18, 'Nobbs Lane', 'Surry Hills', 'NSW', 2310), 
        'Lincoln46@hotmail.com'), NULL, 0);
END;
/
*/
CREATE
OR REPLACE PROCEDURE addClass (
    roomName VARCHAR2,
    class_sessions SESSIONS
) AS
    r_id INTEGER;
BEGIN
    -- get class ID from name
    SELECT "ROOM_ID" INTO r_id
    FROM "ROOM"
    WHERE "NAME" = roomName;

    FOR i IN 1..class_sessions.COUNT LOOP
        BEGIN
            INSERT INTO "CLASS"(CLASS_NAME, ROOM_ID)
            VALUES (class_sessions(i), r_id);
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END LOOP;
    COMMIT;

END;
/
-- Implementation Examples
/*
BEGIN
    addClass('TassieDevil1', SESSIONS('M7A', 'M9A', 'M12P', 'T7A', 'T9A', 'T12P', 'T3P', 'W9A', 'W12P', 'W3P'));
END;
/
*/
CREATE
OR REPLACE PROCEDURE addEmployee (
    full_name VARCHAR2,
    date_hire DATE, 
    emp_addr ADDR_OBJ,
    emp_email VARCHAR2, 
    ph_num VARCHAR2
) AS
    name_first VARCHAR2(25);
    name_last VARCHAR2(25);
    emp_id INTEGER;
BEGIN
    -- Parse full name string to first and last names
    name_first := SUBSTR(full_name, 1, INSTR(full_name,' ')-1);
    name_last := SUBSTR(full_name, INSTR(full_name,' ')+1);

    -- Check if employee with that name already exists
    SELECT "EMPLOYEE_ID" INTO emp_id
    FROM "EMPLOYEE"
    WHERE "FIRST_NAME" = name_first AND
     "LAST_NAME" = name_last;
    DBMS_OUTPUT.PUT_LINE('Employee already exists in database');
    
    -- Insert into database otherwise (ID generated by default value seq)
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO
        "EMPLOYEE"(FIRST_NAME, LAST_NAME, HIRE_DATE, ADDRESS, EMAIL, CONTACT_NUMBER)
        VALUES
            (name_first, name_last, date_hire, emp_addr, emp_email, ph_num);
        COMMIT;

    -- Handle other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END addEmployee;
/

-- Implementation Examples
/*
BEGIN
    addEmployee('James Stevens', '11-AUG-2020', ADDR_OBJ(21, 'Chalmers Lane', 'Devonport', 'TAS', 7310), 'Savannah20@gmail.com', '+61 488 151 232');
    addEmployee('John Apple', '01-DEC-2023', ADDR_OBJ(9, 'Meadow Street', 'Devonport', 'TAS', 7310), 'Madeline97@yahoo.com', '06 0039 5419');
END;
/
*/
CREATE
OR REPLACE PROCEDURE addParent (
    full_name VARCHAR2,
    prnt_addr ADDR_OBJ,
    prnt_email VARCHAR2,
    ph_num VARCHAR2,
    prnt_type VARCHAR2
) AS
    name_first VARCHAR2(25);
    name_last VARCHAR2(25);
    prnt_id INTEGER;
    prnt_type_id NUMBER(1);
BEGIN
    -- Parse full name string to first and last names
    name_first := SUBSTR(full_name, 1, INSTR(full_name,' ')-1);
    name_last := SUBSTR(full_name, INSTR(full_name,' ')+1);

    -- Derive parent type from string
    IF prnt_type = 'EMPLOYEE' THEN
      prnt_type_id := 1;
    ELSIF prnt_type = 'UNSW PHD' THEN
      prnt_type_id := 2;
    ELSIF prnt_type = 'UNSW STAFF' THEN
      prnt_type_id := 3;
    ELSIF prnt_type = 'UNSW PREV' THEN
      prnt_type_id := 4;
    ELSE
      prnt_type_id := NULL;
    END IF;

    -- Check if parent with that name already exists
    SELECT "PARENT_ID" INTO prnt_id
    FROM "PARENT"
    WHERE "FIRST_NAME" = name_first AND
     "LAST_NAME" = name_last;
    DBMS_OUTPUT.PUT_LINE('Parent already exists in database');
    
    -- Insert into database otherwise
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO
        "PARENT"(FIRST_NAME, LAST_NAME, ADDRESS, EMAIL, CONTACT_NUMBER, TYPE)
        VALUES
            (name_first, name_last, prnt_addr, prnt_email, ph_num, prnt_type_id);
        COMMIT;

    -- Handle other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END addParent;
/

-- Implementation Examples
/*
BEGIN
    addParent('Joe Mama', ADDR_OBJ(18, 'Nobbs Lane', 'Surry Hills', 'NSW', 2310), 'Lincoln46@hotmail.com', '0400 325 397', 'none');
END;
/
*/
CREATE
OR REPLACE PROCEDURE addRoom (
    room_name VARCHAR2,
    room_location VARCHAR2,
    room_capacity NUMBER,
    age_min NUMBER,
    age_max NUMBER
) AS
    r_id INTEGER;
BEGIN
    -- Check if room with that name already exists
    SELECT "ROOM_ID" INTO r_id
    FROM "ROOM"
    WHERE "NAME" = room_name;
    DBMS_OUTPUT.PUT_LINE('Room already exists in database');
    
    -- Insert into database otherwise
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO
        "ROOM"(NAME, LOCATION, MAX_CAPACITY, MIN_AGE, MAX_AGE)
        VALUES
            (room_name, room_location, room_capacity, age_min, age_max);
        COMMIT;

    -- Handle other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END addRoom;
/

-- Implementation Examples
/*
BEGIN
    addRoom('Koala1', 'North Wing', 10, 0, 1
    addRoom('TassieDevil2', 'South Wing', 10, 2, 3);
    addRoom('Wallaby3', 'West Wing', 10, 3, 4);
    addRoom('Kangaroo3', 'East Wing', 10, 5, 8);
END;
/
*/
CREATE OR REPLACE PROCEDURE addEmployeeQualification(emp_id IN INTEGER, qual_id IN INTEGER) AS
    insertion_err EXCEPTION;
BEGIN
    INSERT INTO
        EMPLOYEE_QUALIFICATION (EMPLOYEE_ID, DESCRIPTION)
    VALUES
        (emp_id, qual_id);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END InsertEmpQual;
/
CREATE
OR REPLACE PROCEDURE generateAttendance (
    classID INTEGER,
    staffArray STAFF_NAMES,
    childArray CHILD_NAMES,
    classStart VARCHAR2,
    classEnd VARCHAR2
) AS
    class_id INTEGER;
    startTime DATE;
    endTime DATE;
BEGIN
    -- Parse date strings to date obj
    startTime := to_date(classStart, 'DD-MM-YYYY HH:MI PM');
    endTime := to_date(classEnd, 'DD-MM-YYYY HH:MI PM');

    -- create entry in child attendance for attending children
    FOR i IN 1..childArray.COUNT LOOP
        DECLARE
            i_child_id INTEGER;
        BEGIN
            -- Look up the primary key (person_id) for the name
            SELECT CHILD_ID INTO i_child_id
            FROM CHILD
            WHERE (first_name || ' ' || last_name) = childArray(i);

            -- Insert into the attendance table
            INSERT INTO "CHILD_ATTENDANCE" (CHILD_ID, CLASS_ID, ARRIVAL, DEPARTURE) 
            VALUES (i_child_id, classID, startTime, endTime);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Child ' || childArray(i) || ' not found.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Child Attendance added successfully.');

    -- create entry in staff attendance for attending staff
    FOR i IN 1..staffArray.COUNT LOOP
        DECLARE
            i_staff_id INTEGER;
        BEGIN
            -- Look up the primary key (person_id) for the name
            SELECT EMPLOYEE_ID INTO i_staff_id
            FROM EMPLOYEE
            WHERE (first_name || ' ' || last_name) = staffArray(i);

            -- Insert into the attendance table
            INSERT INTO "EMPLOYEE_ATTENDANCE" (EMPLOYEE_ID, CLASS_ID, ARRIVAL, DEPARTURE) 
            VALUES (i_staff_id, classID, startTime, endTime);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Child ' || staffArray(i) || ' not found.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Staff Attendance added successfully.');


END generateAttendance;
/
-- Implementation Examples

BEGIN
    generateAttendance(1, STAFF_NAMES('John Apple'), CHILD_NAMES('Joe Vanderburg', 'Holly Prior', 'Tom Greenhill'), '01-01-2024 1:02 PM', '01-01-2024 3:01 PM');
END;
/
CREATE OR REPLACE PROCEDURE InsertQual(qualification_desc IN VARCHAR2) AS
    non_unique EXCEPTION;
BEGIN
    INSERT INTO
        QUALIFICATION (DESCRIPTION)
    VALUES
        (qualification_desc);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END InsertQual;
/
CREATE OR REPLACE VIEW child_details AS
SELECT
    c.CHILD_ID AS "Child ID",
    c.FIRST_NAME AS "Name (First)",
    c.LAST_NAME AS "Name (Last)",
    c.PARENT_ID AS "Parent ID",
    p.FIRST_NAME || ' ' || p.LAST_NAME AS "Parent Name",
    c.DOB,
    disp_contact (c.EMERGENCY_CONTACT) AS "Emergency Contact"
FROM
    CHILD c
    INNER JOIN PARENT p ON c.PARENT_ID = p.PARENT_ID
ORDER BY
    CHILD_ID;
/
CREATE OR REPLACE VIEW parent_details AS
SELECT
    p.PARENT_ID AS "Parent ID",
    p.FIRST_NAME AS "Name (First)",
    p.LAST_NAME AS "Name (Last)",
    (SELECT COUNT(*) FROM CHILD c WHERE c.PARENT_ID = p.PARENT_ID) AS "Number of enrolled children",
    disp_addr(p.ADDRESS) AS "Address"
FROM
    PARENT p
ORDER BY
    PARENT_ID;
/

CREATE OR REPLACE VIEW database_details AS
SELECT table_name AS "Table",
       TO_NUMBER(
           EXTRACTVALUE(
               XMLTYPE(
                   DBMS_XMLGEN.GETXML(
                       'SELECT COUNT(*) AS count FROM ' || table_name
                   )
               ),
               '/ROWSET/ROW/COUNT'
           )
       ) AS "Number of rows"
FROM user_tables
ORDER BY "Number of rows";
/
--footer

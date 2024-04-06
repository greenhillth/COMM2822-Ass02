CREATE
OR REPLACE PROCEDURE generateAttendance (
    classID INTEGER,
    staffArray STAFF_NAMES,
    childArray CHILD_NAMES,
    classStart VARCHAR2,
    classEnd VARCHAR2
) AS
    startTime DATE;
    endTime DATE;
BEGIN
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
BEGIN
    generateAttendance(0, STAFF_NAMES('John Apple'), CHILD_NAMES('Joe Vanderburg', 'Holly Prior', 'Tom Greenhill'), '01-01-2024 1:02 PM', '01-01-2024 3:01 PM');
END;
/
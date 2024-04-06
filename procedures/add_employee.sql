CREATE OR REPLACE PROCEDURE addEmployee(full_name IN VARCHAR2, date_hire IN DATE, emp_addr IN ADDR_OBJ, emp_email IN VARCHAR2, ph_num IN VARCHAR2
) AS
 name_first VARCHAR2(25);
 name_last VARCHAR2(25);
 emp_id INTEGER;
BEGIN
    name_first := SUBSTR(full_name, 1, INSTR(full_name,' ')-1);
    name_last := SUBSTR(full_name, INSTR(full_name,' ')+1);

    SELECT "EMPLOYEE_ID" INTO emp_id
    FROM "EMPLOYEE"
    WHERE "FIRST_NAME" = name_first AND
     "LAST_NAME" = name_last;

    DBMS_OUTPUT.PUT_LINE('Employee already exists in database');
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO
        "EMPLOYEE"(FIRST_NAME, LAST_NAME, HIRE_DATE, ADDRESS, EMAIL, CONTACT_NUMBER)
        VALUES
            (name_first, name_last, date_hire, emp_addr, emp_email, ph_num);
        COMMIT;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END addEmployee;
/
BEGIN
    addEmployee('James Stevens', '11-AUG-2020', ADDR_OBJ(21, 'Chalmers Lane', 'Devonport', 'TAS', 7310), 'Savannah20@gmail.com', '+61 488 151 232');
END;
/
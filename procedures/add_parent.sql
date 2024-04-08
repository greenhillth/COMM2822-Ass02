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
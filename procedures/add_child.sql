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
BEGIN
    addChild('Melody Pond', 'Mackenzie Wilson', '09-DEC-2022',
        CONTACT('Steve', 'Jobs',  '0400 325 397',
        ADDR_OBJ(18, 'Nobbs Lane', 'Surry Hills', 'NSW', 2310), 
        'Lincoln46@hotmail.com'), NULL, 0);
END;
/
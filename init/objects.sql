CREATE
OR REPLACE TYPE ADDR_OBJ AS OBJECT (
    num NUMBER(4, 0),
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(3),
    postcode NUMBER(4, 0)
);
/
CREATE FUNCTION disp_addr(address ADDR_OBJ)
RETURN VARCHAR2
AS
BEGIN
    RETURN 
    address.num || ' ' || address.street ||  ', ' || 
    address.city || ' ' || address.state || ' ' || address.postcode;
END;
/
CREATE
OR REPLACE TYPE CONTACT AS OBJECT (
    name_first VARCHAR2(25),
    name_last VARCHAR2(25),
    phone_number VARCHAR2(25),
    address ADDR_OBJ,
    email VARCHAR2(50)
);
/
CREATE FUNCTION disp_contact(ctact CONTACT)
RETURN VARCHAR2
AS
BEGIN
    RETURN 
    ctact.name_first || ' ' || ctact.name_last ||  ', ' || 
    disp_addr(ctact.address);
END;
/
CREATE
OR REPLACE TYPE STAFF_NAMES AS TABLE OF VARCHAR(50);
/
CREATE
OR REPLACE TYPE CHILD_NAMES AS TABLE OF VARCHAR(50);
/
CREATE
OR REPLACE TYPE SESSIONS AS TABLE OF VARCHAR(5);
/

/*
TODO - denormalise qualification entities as overlap unlikely 

CREATE OR REPLACE TYPE QUALIFICATION AS OBJECT (
institution VARCHAR2(25),
date_attained VARCHAR2(25),
qualification_type VARCHAR2(25),
);
CREATE OR REPLACE TYPE QUALIFICATIONS AS TABLE OF QUALIFICATION;

*/
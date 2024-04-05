CREATE
OR REPLACE TYPE ADDR_OBJ AS OBJECT (
    num NUMBER(4, 0),
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(3),
    postcode NUMBER(4, 0)
);
CREATE
OR REPLACE TYPE CONTACT AS OBJECT (
    name_first VARCHAR2(25),
    name_last VARCHAR2(25),
    phone_number VARCHAR2(25),
    address ADDR_OBJ,
    email VARCHAR2(20)
);
/*
TODO - denormalise qualification entities as overlap unlikely 

CREATE OR REPLACE TYPE QUALIFICATION AS OBJECT (
institution VARCHAR2(25),
date_attained VARCHAR2(25),
qualification_type VARCHAR2(25),
);
CREATE OR REPLACE TYPE QUALIFICATIONS AS TABLE OF QUALIFICATION;

*/
-- ID Generator Sequence - Uses a global ID value so no two id's are the same across tables.
CREATE SEQUENCE "Z5309693"."ID_SEQ" MINVALUE 1 MAXVALUE 2147483647 INCREMENT BY 1
START WITH 101 NOCACHE NOORDER NOCYCLE NOKEEP NOSCALE GLOBAL;
CREATE OR REPLACE TRIGGER parent_type_constraints
BEFORE INSERT ON PARENT_TYPE
FOR EACH ROW
DECLARE
    ptype VARCHAR2(14);
BEGIN
    SELECT "TYPE_NAME" INTO ptype FROM "Y24GROUP054"."PARENT_TYPE";

    -- dynamically allocate constraints depending on employee_type
    IF ptype LIKE 'EMPLOYEE' THEN
      EXECUTE IMMEDIATE 'ALTER TABLE PARENT_TYPE ADD CONSTRAINT my_column_numeric_check CHECK (my_column IS NUMERIC)';
    ELSIF ptype LIKE 'UNSW_PHD' THEN
      bonus := 500;
    ELSIF ptype LIKE 'UNSW_PREVIOUS' THEN
      bonus := 500;
    ELSIF ptype LIKE 'UNSW_STAFF' THEN
      bonus := 100;
    END IF;



END;

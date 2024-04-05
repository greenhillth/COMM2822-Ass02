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
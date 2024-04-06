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

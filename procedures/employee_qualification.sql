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

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

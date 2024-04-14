CREATE OR REPLACE VIEW child_details AS
SELECT
    c.CHILD_ID AS "Child ID",
    c.FIRST_NAME AS "Name (First)",
    c.SURNAME AS "Name (Last)",
    c.PARENT_ID AS "Parent ID",
    p.FIRST_NAME || ' ' || p.SURNAME AS "Parent Name",
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
    p.SURNAME AS "Name (Last)",
    (SELECT COUNT(*) FROM CHILD c WHERE c.PARENT_ID = p.PARENT_ID) AS "Number of enrolled children",
    disp_addr(p.ADDRESS) AS "Address"
FROM
    PARENT p
ORDER BY
    PARENT_ID;
/

CREATE OR REPLACE VIEW database_details AS
SELECT table_name AS "Table",
       TO_NUMBER(
           EXTRACTVALUE(
               XMLTYPE(
                   DBMS_XMLGEN.GETXML(
                       'SELECT COUNT(*) AS count FROM ' || table_name
                   )
               ),
               '/ROWSET/ROW/COUNT'
           )
       ) AS "Number of rows"
FROM user_tables
ORDER BY "Number of rows";
/
CREATE
OR REPLACE TYPE ADDR_OBJ AS OBJECT (
    num NUMBER(4, 0),
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(3),
    postcode NUMBER(4, 0)
);
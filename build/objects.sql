CREATE OR REPLACE TYPE ADDR_OBJ AS OBJECT (
    num NUMBER(4, 0),
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(3),
    postcode NUMBER(4, 0)
);

CREATE OR REPLACE TYPE CONTACT AS OBJECT (
    name_first VARCHAR2(25),
    name_last VARCHAR2(25),
    phone_number VARCHAR2(25),
    address ADDR_OBJ,
    email VARCHAR2(20)
);
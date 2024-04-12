-- Modify Parent table
ALTER TABLE "Y24GROUP054"."PARENT"
ADD (
    CONSTRAINT PRNT_PTYPE_FK FOREIGN KEY ("TYPE") references "PARENT_TYPE" ("TYPE_ID"),
    -- Data validation
    CONSTRAINT VALIDATE_PRNT_EMAIL CHECK (
        REGEXP_LIKE (
            "EMAIL",
            '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
        )
    ) ENABLE
);
/
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."PARENT_ID" IS 'Primary key of parent table.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."FIRST_NAME" IS 'Parent first name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."LAST_NAME" IS 'Parent last name. Non-null values only.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."TYPE" IS 'Type of parent. References PARENT_TYPE table.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."EMAIL" IS 'Parent email address';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."CONTACT_NUMBER" IS 'Parent phone number, contains area extenstions';
COMMENT ON COLUMN "Y24GROUP054"."PARENT"."ADDRESS" IS 'Parent address. Stored as an ADDR_OBJ object.';
COMMENT ON TABLE "Y24GROUP054"."PARENT" IS 'Parents table.';

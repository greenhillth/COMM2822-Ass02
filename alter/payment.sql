ALTER TABLE "Y24GROUP054"."PAYMENT"
ADD (
    -- Primary Key
    CONSTRAINT PMT_ID_PK PRIMARY KEY ("PAYMENT_ID") ENABLE,
    -- Foreign keys
    CONSTRAINT PMT_CHILD_FK FOREIGN KEY ("CHILD_ID") references "CHILD" ("CHILD_ID")
    -- Data validation
);

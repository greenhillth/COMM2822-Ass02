ALTER TABLE "Y24GROUP054"."PAYMENT"
ADD (
    -- Foreign keys
    CONSTRAINT PMT_CHILD_FK FOREIGN KEY ("CHILD_ID") references "CHILD" ("CHILD_ID")
    -- Data validation
);

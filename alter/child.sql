-- Modify Child table
ALTER TABLE "Y24GROUP054"."CHILD"
ADD (
    -- Foreign Keys
    CONSTRAINT CHILD_PARENT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT CHILD_WLIST_FK FOREIGN KEY ("WAITLIST_ID") references "WAITLIST" ("WAITLIST_ID"),
    -- Data validation
    CONSTRAINT CCS_PCT_BOUNDS CHECK (
        "CCS_PERCENTAGE" >= 0
        AND "CCS_PERCENTAGE" <= 1
    ) ENABLE
);
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."CHILD_ID" IS 'Primary key of Child table. Uniquely identifies enrolled children.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."PARENT_ID" IS 'Foreign key to referenced Parent ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."WAITLIST_ID" IS 'Foreign key to referenced Waitlist ID. Nullable as child may not be on waitlist.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."FIRST_NAME" IS 'First name of child. Max size: 20 chars.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."SURNAME" IS 'Last name of child. Max size: 25 chars.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."EMERGENCY_CONTACT" IS 'Information about emergency contact. Stored as a Contact object.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."CCS_PERCENTAGE" IS 'Decimal number between 0-1 representing percentage CCS subsidy. Precision: 4 decimal places.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD"."DOB" IS 'Date of birth of child. Stored as a datetime object with the time set to 12:00am.';
COMMENT ON TABLE "Y24GROUP054"."CHILD" IS 'Register of enrolled/waitlisted children.';

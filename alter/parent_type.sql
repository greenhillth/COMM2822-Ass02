ALTER TABLE "Y24GROUP054"."SDN_EMPLOYEE_PARENT"
ADD (
    -- Foreign Keys
    CONSTRAINT PTYPE_EMP_PRNT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT PTYPE_EMP_PRT_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID")
);

ALTER TABLE "Y24GROUP054"."UNSW_PHD_PARENT"
ADD (
    -- Foreign Keys
    CONSTRAINT PTYPE_PHD_PRNT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT CHECK_ZID_VALID_PHD CHECK (REGEXP_LIKE(id, '^z\d{7}$'))
);

ALTER TABLE "Y24GROUP054"."UNSW_STAFF_PARENT"
ADD (
    -- Foreign Keys
    CONSTRAINT PTYPE_STAFF_PRNT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT CHECK_ZID_VALID_STAFF CHECK (REGEXP_LIKE(id, '^z\d{7}$'))
);

ALTER TABLE "Y24GROUP054"."PREVIOUS_UNSW_PARENT"
ADD (
    -- Foreign Keys
    CONSTRAINT PTYPE_PREV_PRNT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID")
);
/

-- Comments
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW). Primary Key.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_NAME" IS 'Holds text representation of parent type.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."BASE_DAILY_RATE" IS 'Daily rate of specified type. Number between 0-9999.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."WAITLIST_PRIORITY_LEVEL" IS 'Priority level each type granted when joining waitlist. Number between 1 (highest) to 5 (lowest).';

COMMENT ON COLUMN "Y24GROUP054"."SDN_EMPLOYEE_PARENT"."RECORD_ID" IS 'Identifier record for given parent. Primary key and unique across all parent types.';
COMMENT ON COLUMN "Y24GROUP054"."SDN_EMPLOYEE_PARENT"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW). Links to PARENT_TYPE table.';
COMMENT ON COLUMN "Y24GROUP054"."SDN_EMPLOYEE_PARENT"."PARENT_ID" IS 'ID of affiliated parent. Foreign key.';
COMMENT ON COLUMN "Y24GROUP054"."SDN_EMPLOYEE_PARENT"."EMPLOYEE_ID" IS 'Employee ID of affiliated parent. Foreign key.';

COMMENT ON COLUMN "Y24GROUP054"."UNSW_PHD_PARENT"."RECORD_ID" IS 'Identifier record for given parent. Primary key and unique across all parent types.';
COMMENT ON COLUMN "Y24GROUP054"."UNSW_PHD_PARENT"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW). Links to PARENT_TYPE table.';
COMMENT ON COLUMN "Y24GROUP054"."UNSW_PHD_PARENT"."PARENT_ID" IS 'ID of affiliated parent. Foreign key.';
COMMENT ON COLUMN "Y24GROUP054"."UNSW_PHD_PARENT"."Z_ID" IS 'zID of affiliated parent. Must be in valid zID format.';

COMMENT ON COLUMN "Y24GROUP054"."UNSW_STAFF_PARENT"."RECORD_ID" IS 'Identifier record for given parent. Primary key and unique across all parent types.';
COMMENT ON COLUMN "Y24GROUP054"."UNSW_STAFF_PARENT"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW). Links to PARENT_TYPE table.';
COMMENT ON COLUMN "Y24GROUP054"."UNSW_STAFF_PARENT"."PARENT_ID" IS 'ID of affiliated parent. Foreign key.';
COMMENT ON COLUMN "Y24GROUP054"."UNSW_STAFF_PARENT"."Z_ID" IS 'zID of affiliated parent. Must be in valid zID format.';

COMMENT ON COLUMN "Y24GROUP054"."PREVIOUS_UNSW_PARENT"."RECORD_ID" IS 'Identifier record for given parent. Primary key and unique across all parent types.';
COMMENT ON COLUMN "Y24GROUP054"."PREVIOUS_UNSW_PARENT"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW). Links to PARENT_TYPE table.';
COMMENT ON COLUMN "Y24GROUP054"."PREVIOUS_UNSW_PARENT"."PARENT_ID" IS 'ID of affiliated parent. Foreign key.';
COMMENT ON COLUMN "Y24GROUP054"."PREVIOUS_UNSW_PARENT"."Z_ID" IS 'zID of affiliated parent. Optional.';
COMMENT ON COLUMN "Y24GROUP054"."PREVIOUS_UNSW_PARENT"."LEAVE_DATE" IS 'UNSW leave date of affiliated parent. Not null.';

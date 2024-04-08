ALTER TABLE "Y24GROUP054"."PARENT_TYPE"
ADD (
    -- Foreign Keys
    CONSTRAINT PTYPE_PRNT_FK FOREIGN KEY ("PARENT_ID") references "PARENT" ("PARENT_ID"),
    CONSTRAINT PTYPE_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    --Data Validation
    CONSTRAINT VALID_TYPES CHECK (
        ("TYPE_ID", "TYPE_NAME") IN (
            SELECT
                1 AS "TYPE_ID",
                'EMPLOYEE' AS "TYPE_NAME"
            FROM
                DUAL
            UNION ALL
            SELECT
                2 AS "TYPE_ID",
                'UNSW_PHD' AS "TYPE_NAME"
            FROM
                DUAL
            UNION ALL
            SELECT
                3 AS "TYPE_ID",
                'UNSW_STAFF' AS "TYPE_NAME"
            FROM
                DUAL
            UNION ALL
            SELECT
                4 AS "TYPE_ID",
                'UNSW_PREVIOUS' AS "TYPE_NAME"
            FROM
                DUAL
        )
    )
);
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."RECORD_ID" IS 'Identifier record for given parent. Primary key.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_ID" IS 'Identifier of parent type. Holds a value of either 1 (Employee), 2 (PHD), 3 (UNSW Staff) or 4 (Ex-UNSW).';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."TYPE_NAME" IS 'Holds text representation of parent type. Type and number must match.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."PARENT_ID" IS 'ID of affiliated parent';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."EMPLOYEE_ID" IS 'Employee ID of parent, in the case parent is of type 1 (employee).';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."ZID" IS 'zID of parent. Nullable in the case parent is not affiliated with UNSW.';
COMMENT ON COLUMN "Y24GROUP054"."PARENT_TYPE"."LEAVE_DATE" IS 'Leave date of parent. Nullable in the case parent is not Ex-UNSW.';
COMMENT ON TABLE "Y24GROUP054"."PARENT_TYPE" IS 'Contains records of parent_type and affiliated data.';

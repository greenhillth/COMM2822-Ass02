-- Modify Activity table
ALTER TABLE "Y24GROUP054"."ACTIVITY"
ADD (
    CONSTRAINT U_ACTIVITY UNIQUE ("NAME") ENABLE
);
/
-- Comments
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."ACTIVITY_ID" IS 'Primary key of Activity table.';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."NAME" IS 'Activity Name. Unique, not nullable';
COMMENT ON COLUMN "Y24GROUP054"."ACTIVITY"."DESCRIPTION" IS 'Activity Description. Max size: 50 chars.';
COMMENT ON TABLE "Y24GROUP054"."ACTIVITY" IS 'Register of activities used by classes.';

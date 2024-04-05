ALTER TABLE "Y24GROUP054"."CHILD_ATTENDANCE"


COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ROLL_ID" IS 'Primary key of Attendance table. Used to uniquely identify an instance of class attendance';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."CLASS_ID" IS 'Foreign key to referenced Class ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."ARRIVAL" IS 'Datetime object that records beginning of attendance';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_ATTENDANCE"."DEPARTURE" IS 'Datetime object that records end of attendance';
COMMENT ON TABLE "Y24GROUP054"."CHILD_ATTENDANCE" IS 'Register of all attendances of enrolled children.';

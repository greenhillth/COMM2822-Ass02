ALTER TABLE "Y24GROUP054"."CHILD_MEDICATION"
ADD (
    CONSTRAINT CMED_MED_FK foreign key ("MEDICATION_ID") references "MEDICATION" ("MEDICATION_ID"),
    CONSTRAINT CMED_CHILD_FK foreign key ("CHILD_ID") references "CHILD" ("CHILD_ID")
);

COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."RECORD_ID" IS 'Primary key of Medication table.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."CHILD_ID" IS 'Foreign key to referenced Child ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."MEDICATION_ID" IS 'Foreign key to referenced Medication ID. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."DOSAGE_MG" IS 'Medicine dosage (in milligrams).';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."FREQUENCY" IS 'Frequency of dosage (i.e hourly, twice a day etc.)';
COMMENT ON COLUMN "Y24GROUP054"."CHILD_MEDICATION"."DESCRIPTION" IS 'Other information about medication administration';
COMMENT ON TABLE "Y24GROUP054"."CHILD_MEDICATION" IS 'Register of child medication information';


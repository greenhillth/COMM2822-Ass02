ALTER TABLE "Y24GROUP054"."EMPLOYEE_QUALIFICATION"
ADD (
    CONSTRAINT QUAL_EMP_FK FOREIGN KEY ("EMPLOYEE_ID") references "EMPLOYEE" ("EMPLOYEE_ID"),
    CONSTRAINT QUAL_QID_FK FOREIGN KEY ("QUALIFICATION_ID") references "QUALIFICATION" ("QUALIFICATION_ID")
);
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_QUALIFICATION"."EMPLOYEE_ID" IS 'Reference to employee holding qualification. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."EMPLOYEE_QUALIFICATION"."QUALIFICATION_ID" IS 'Reference to qualification in question. Not nullable.';

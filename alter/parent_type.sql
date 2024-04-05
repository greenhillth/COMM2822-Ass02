ALTER TABLE "Y24GROUP054"."PARENT_TYPE"
ADD (
    constraint PTYPE_PRNT_FK foreign key ("PARENT_ID") references "PARENT" ("PARENT_ID")
);
CREATE TABLE
    "Y24GROUP054"."EMPLOYEES" (
        "COUNTRY_ID" CHAR(2) CONSTRAINT "COUNTRY_ID_NN" NOT NULL enable,
        "COUNTRY_NAME" varchar2 (40),
        "REGION_ID" number,
        CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY key ("COUNTRY_ID") enable,
        CONSTRAINT "COUNTR_REG_FK" FOREIGN key ("REGION_ID") REFERENCES "Y24GROUP054"."REGIONS" ("REGION_ID") enable
    ) segment creation immediate organization index nocompress pctfree 10 initrans 2 maxtrans 255 logging storage (
        initial 65536 next 1048576 minextents 1 maxextents 2147483645 pctincrease 0 freelists 1 freelist groups 1 buffer_pool DEFAULT flash_cache DEFAULT cell_flash_cache DEFAULT
    ) tablespace "GROUPS" pctthreshold 50;

comment ON COLUMN "Y24GROUP054"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of EMPLOYEES table.';

comment ON COLUMN "Y24GROUP054"."EMPLOYEES"."COUNTRY_NAME" IS 'Country name';

comment ON COLUMN "Y24GROUP054"."EMPLOYEES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';

comment ON TABLE "Y24GROUP054"."EMPLOYEES" IS 'country table. Contains 25 rows. References with locations table.';
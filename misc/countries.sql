create table "Y24GROUP054"."EMPLOYEES" (
	"COUNTRY_ID"   char(2)
		constraint "COUNTRY_ID_NN" not null enable,
	"COUNTRY_NAME" varchar2(40),
	"REGION_ID"    number,
	constraint "COUNTRY_C_ID_PK" primary key ( "COUNTRY_ID" ) enable,
	constraint "COUNTR_REG_FK" foreign key ( "REGION_ID" )
		references "Y24GROUP054"."REGIONS" ( "REGION_ID" )
	enable
)
segment creation immediate organization index
nocompress pctfree 10 initrans 2 maxtrans 255 logging
	storage ( initial 65536 next 1048576 minextents 1 maxextents 2147483645 pctincrease 0 freelists 1 freelist groups 1 buffer_pool
	default flash_cache default cell_flash_cache default )
tablespace "GROUPS" pctthreshold 50;

comment on column "Y24GROUP054"."EMPLOYEES"."EMPLOYEE_ID" is
	'Primary key of EMPLOYEES table.';
comment on column "Y24GROUP054"."EMPLOYEES"."COUNTRY_NAME" is
	'Country name';
comment on column "Y24GROUP054"."EMPLOYEES"."REGION_ID" is
	'Region ID for the country. Foreign key to region_id column in the departments table.';
comment on table "Y24GROUP054"."EMPLOYEES" is
	'country table. Contains 25 rows. References with locations table.';
ALTER TABLE "Y24GROUP054"."CLASS"
ADD (
    CONSTRAINT CLASS_ROOM_FK FOREIGN KEY ("ROOM_ID") references "ROOM" ("ROOM_ID")
);
COMMENT ON COLUMN "Y24GROUP054"."CLASS"."CLASS_ID" IS 'Primary key of class table. Uniquely identifies a class.';
COMMENT ON COLUMN "Y24GROUP054"."CLASS"."ROOM_ID" IS 'Foreign key referencing room class is occurring in. Not nullable';
COMMENT ON TABLE "Y24GROUP054"."CLASS" IS 'Table containing information about class instances.';

ALTER TABLE "Y24GROUP054"."CLASS"
ADD (
    constraint CLASS_ROOM_FK foreign key ("ROOM_ID") references "ROOM" ("ROOM_ID")
);
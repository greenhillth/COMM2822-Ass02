CREATE TABLE "Y24GROUP054"."CLASS" (
    "CLASS_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "CLASS_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "ROOM_ID" INTEGER NOT NULL
);
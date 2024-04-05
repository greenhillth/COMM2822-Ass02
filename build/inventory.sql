CREATE TABLE "Y24GROUP054"."INVENTORY" (
    "INVENTORY_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "INVTRY_ID_NN" NOT NULL ENABLE PRIMARY KEY,
    "NAME" VARCHAR2(50) NOT NULL,
    "DESCRIPTION" VARCHAR2(50)
)
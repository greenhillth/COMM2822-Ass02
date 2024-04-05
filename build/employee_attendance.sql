CREATE TABLE "Y24GROUP054"."EMPLOYEE_ATTENDANCE" (
    "ROLL_ID" INTEGER GENERATED BY DEFAULT AS IDENTITY (
        START WITH 1
    ) CONSTRAINT "ROLL_ID_NN" NOT NULL ENABLE,
    "EMPLOYEE_ID" INTEGER NOT NULL,
    "CLASS_ID" INTEGER NOT NULL,
    "ARRIVAL" DATE,
    "DEPARTURE" DATE
);
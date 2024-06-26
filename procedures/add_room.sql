CREATE
OR REPLACE PROCEDURE addRoom (
    room_name VARCHAR2,
    room_location VARCHAR2,
    room_capacity NUMBER,
    age_min NUMBER,
    age_max NUMBER
) AS
    r_id INTEGER;
BEGIN
    -- Check if room with that name already exists
    SELECT "ROOM_ID" INTO r_id
    FROM "ROOM"
    WHERE "NAME" = room_name;
    DBMS_OUTPUT.PUT_LINE('Room already exists in database');
    
    -- Insert into database otherwise
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO
        "ROOM"(NAME, LOCATION, MAX_CAPACITY, MIN_AGE, MAX_AGE)
        VALUES
            (room_name, room_location, room_capacity, age_min, age_max);
        COMMIT;

    -- Handle other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END addRoom;
/

-- Implementation Examples
/*
BEGIN
    addRoom('Koala1', 'North Wing', 10, 0, 1
    addRoom('TassieDevil2', 'South Wing', 10, 2, 3);
    addRoom('Wallaby3', 'West Wing', 10, 3, 4);
    addRoom('Kangaroo3', 'East Wing', 10, 5, 8);
END;
/
*/
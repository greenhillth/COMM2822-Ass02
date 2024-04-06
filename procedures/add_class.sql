CREATE
OR REPLACE PROCEDURE addClass (
    roomName VARCHAR2,
    class_sessions SESSIONS
) AS
    r_id INTEGER;
BEGIN
    -- get class ID from name
    SELECT "ROOM_ID" INTO r_id
    FROM "ROOM"
    WHERE "NAME" = roomName;

    FOR i IN 1..class_sessions.COUNT LOOP
        BEGIN
            INSERT INTO "CLASS"(CLASS_NAME, ROOM_ID)
            VALUES (class_sessions(i), r_id);
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END LOOP;
    COMMIT;

END;
/
BEGIN
    addClass('TassieDevil1', SESSIONS('M7A', 'M9A', 'M12P', 'T7A', 'T9A', 'T12P', 'T3P', 'W9A', 'W12P', 'W3P'));
END;
/
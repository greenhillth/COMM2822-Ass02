/*
Final insert script. ORDER:
(Important to )

1. Employee
2. Parent
3. Waitlist
4. Child
5. Room
6. Class
7. Child Attendance
8. Employee Attendance
9. Inventory
10. Room Inventory
11. Activity
12. Class Activity
13. Medication
14. Child Medication
15. Qualification
16. Employee Qualification
17. Parent type
18. Payment


add-employee: (name, hire date, address, email, contact no)

add-qualification: (name, qualification)  

add-parent: (name, address, email, contact no, parent type)

add-child

*/

-- clear tables
BEGIN
    DELETE FROM ACTIVITY;
    DELETE FROM CHILD;
    DELETE FROM CHILD_ATTENDANCE;
    DELETE FROM CHILD_MEDICATION;
    DELETE FROM CLASS;
    DELETE FROM CLASS_ACTIVITY;
    DELETE FROM EMPLOYEE;
    DELETE FROM EMPLOYEE_ATTENDANCE;
    DELETE FROM EMPLOYEE_QUALIFICATION;
    DELETE FROM INVENTORY;
    DELETE FROM MEDICATION;
    DELETE FROM PARENT;
    DELETE FROM PARENT_TYPE;
    DELETE FROM PAYMENT;
    DELETE FROM QUALIFICATION;
    DELETE FROM ROOM;
    DELETE FROM ROOM_INVENTORY;
    DELETE FROM WAITLIST;
END;
/

-- Populate employees table
BEGIN
    addEmployee('Tom Greenhill', '11-AUG-2020',
        ADDR_OBJ(21, 'Chalmers Lane', 'Devonport', 'TAS', 7310),
        'Savannah20@gmail.com', '+61 488 151 232');
    addEmployee('John Apple', '01-DEC-2023', 
        ADDR_OBJ(9, 'Meadow Street', 'St Helens', 'TAS', 7310),
        'Madeline97@yahoo.com', '06 0039 5419');
    addEmployee('Whitney Koch', '30-May-2023',
        ADDR_OBJ(282, 'Russel Station St', 'North Emma', 'NSW', 2085),
        'Abigail10@gmail.com', '+61 465 075 681');
    addEmployee('James Lowe', '07-Dec-2023',
        ADDR_OBJ(170, 'Phoenix Mall', 'Loveland', 'NSW', 2647),
        'JaydenHettinger@hotmail.com', '05 7682 4803');
    addEmployee('Bobby Kessler', '20-Dec-2023',
        ADDR_OBJ(448, 'Jackson Circuit', 'Coral Gables', 'NSW', 2089),
        'Claudia79@hotmail.com', '01 0447 9267');
    addEmployee('Julian Patel', '27-Jan-2024',
        ADDR_OBJ(615, 'Jonathan Parkway', 'Conroyberg', 'NSW', 2148),
        'Angus_Beatty@gmail.com', '0460 768 687');
    addEmployee('Ronald Garden', '25-Aug-2023',
        ADDR_OBJ(753, 'Chelsea Avenue', 'Port Callum', 'NSW', 2137),
        'Chloe_B_84@hotmail.com', '0429 836 761');
    addEmployee('Julius Fahey', '20-Dec-2023',
        ADDR_OBJ(695, 'Tahlia Road', 'Cartwrightburgh', 'NSW', 2577),
        'Lara22@gmail.com', '+61 1 6446 7399');
    addEmployee('Sabrina Hall', '12-Sep-2023',
        ADDR_OBJ(456, 'George Pass', 'Lake Summer', 'NSW', 2310),
        'Sebastian.Garden@hotmail.com', '04 0585 7877');
    addEmployee('Lillian Richards', '17-May-2023',
        ADDR_OBJ(101, 'Natalie View Rd', 'New Gabriel', 'NSW', 2941),
        'Tahlia_A71@hotmail.com', '+61 3 6301 8876');
    addEmployee('Ernest Monahan', '05-Jul-2023',
        ADDR_OBJ(882, 'Bartell Loop', 'Cameronview', 'NSW', 2415),
        'Joel84@gmail.com', '0407 889 841');
    addEmployee('Lindsey Boyer', '10-Mar-2024',
        ADDR_OBJ(89, 'Tremblay Drive', 'Claudiaview', 'NSW', 2268),
        'Nate_Ernser46@hotmail.com', '+61 2 2254 3856');
    addEmployee('Amanda Price', '27-Nov-2023',
        ADDR_OBJ(30, 'Nader Lane', 'East Jake', 'NSW', 2780),
        'Willow.Jenkins@yahoo.com', '0402 867 367');
    addEmployee('Judith Garden', '21-May-2023',
        ADDR_OBJ(93, 'Murray Plaza', 'Santa Fe', 'NSW', 2837),
        'Ashton25@hotmail.com', '06 8139 6620');
    addEmployee('Leonard Paterson', '16-Aug-2023',
        ADDR_OBJ(75, 'Schultz Run', 'North Georgia', 'NSW', 2588),
        'Jasper.Towne@gmail.com', '09 2993 5809');
    addEmployee('Dennis Schroeder', '14-Feb-2024',
        ADDR_OBJ(82, 'Moss Summit', 'Port Benjamin', 'NSW', 2427),
        'Aidan_Wood69@yahoo.com', '04 3991 6000');
    addEmployee('Damon Hartmann', '17-Jan-2024',
        ADDR_OBJ(81, 'Alice Pass', 'Homestead', 'NSW', 2943),
        'Max71@yahoo.com', '0445 385 384');
    addEmployee('Lynda Ross', '10-Jul-2023',
        ADDR_OBJ(88, 'Smith Street', 'Toledo', 'NSW', 2675),
        'Hunter6@hotmail.com', '+61 479 568 325');
    addEmployee('Bryan Stokes', '27-May-2023',
        ADDR_OBJ(68, 'Morrison Pass', 'Maddisonport', 'NSW', 2345),
        'Gabriel_Monahan20@hotmail.com', '+61 487 828 639');
    addEmployee('Randall Hand', '22-Nov-2023',
        ADDR_OBJ(11, 'Carroll Ridge', 'New Justinton', 'NSW', 2528),
        'AddisonSchroed@gmail.com', '0414 984 623');
    addEmployee('Steve Schultz', '10-Jan-2024',
        ADDR_OBJ(13, 'Nolan Estate Dr', 'Isabellatown', 'NSW', 2693),
        'Abby.Mann@yahoo.com', '+61 3 6858 0437');
    addEmployee('Vicky Morrison', '14-Dec-2023',
        ADDR_OBJ(45, 'Cartwright Run', 'Hesselshire', 'NSW', 2453),
        'Claire.Bailey@gmail.com', '0433 238 630');
    addEmployee('Lee Bogan', '24-Nov-2023',
        ADDR_OBJ(21, 'Lincoln Station St', 'Altamonte Springs', 'NSW', 2338),
        'Elijah.West@gmail.com', '+61 7 9684 5626');
END;
/

-- Populate Parents table
BEGIN
    addParent('Mackenzie Wilson', ADDR_OBJ(42, 'Jacobi Crest', 'South Audreymouth', 'NSW', 3478), 'Nate.Martin81@hotmail.com', '+61 428 900 455', 'none');
    addParent('Jacob Little', ADDR_OBJ(62, 'Amber Estate Dr', 'North Stephanieport', 'NSW', 3395), 'Owen28@yahoo.com', '+61 9 1321 2033', 'none');
    addParent('Leah Scott', ADDR_OBJ(93, 'Swift Pass', 'Lake Beau', 'NSW', 3500), 'Mia66@yahoo.com', '+61 9 0384 7659', 'none');
    addParent('Hayden Ross', ADDR_OBJ(39, 'Zara Square', 'North Aiden', 'NSW', 3113), 'Ali99@yahoo.com', '+61 0 2751 7705', 'none');
    addParent('Mackenzie Morrison', ADDR_OBJ(83, 'Aidan Loop', 'East Alexbury', 'NSW', 3133), 'Kayla.Langworth51@hotmail.com', '+61 433 882 626', 'none');
    addParent('Connor Waters', ADDR_OBJ(83, 'Khan Summit', 'East Rosemouth', 'NSW', 3882), 'Sebastian_Nguyen@yahoo.com', '+61 3 7231 3585', 'none');
    addParent('Thomas Hettinger', ADDR_OBJ(21, 'Kris Track', 'Albany', 'NSW', 3048), 'Taylor_Kreiger0@hotmail.com', '0495 193 714', 'none');
    addParent('Edward Ritchie', ADDR_OBJ(63, 'Jayden Parkway', 'Hugoborough', 'NSW', 3611), 'Sophia94@yahoo.com', '+61 5 6856 2353', 'none');
    addParent('Marcus Johnson', ADDR_OBJ(45, 'Bruen Station St', 'Lake Jordan', 'NSW', 3892), 'Samantha.Nguyen82@yahoo.com', '+61 7 9945 6219', 'none');
    addParent('Abbey Rees', ADDR_OBJ(03, 'Amelie Road', 'Port Angusfurt', 'NSW', 3038), 'Grace73@hotmail.com', '0424 768 349', 'none');
    addParent('Benjamin Farrell', ADDR_OBJ(56, 'Daugherty Grove', 'Morganmouth', 'NSW', 3017), 'Jackson_Abbott47@hotmail.com', '+61 456 158 817', 'none');
    addParent('Amelie Daniel', ADDR_OBJ(12, 'Kreiger Track', 'East Xavier', 'NSW', 3864), 'Willow_Ebert66@yahoo.com', '0438 257 164', 'none');
    addParent('Hamish Hughes', ADDR_OBJ(98, 'Richards Drive', 'Cameronfurt', 'NSW', 3172), 'Amelia_Moore@yahoo.com', '02 8226 3386', 'none');
    addParent('Nicholas Richards', ADDR_OBJ(03, 'Nader Manor', 'Abbytown', 'NSW', 3761), 'Benjamin_Hackett47@hotmail.com', '00 2276 5758', 'none');
    addParent('Emily Reynolds', ADDR_OBJ(68, 'Beier Loop', 'Boulder', 'NSW', 3384), 'Skye.Johns47@yahoo.com', '0413 521 521', 'none');
    addParent('Leah Daugherty', ADDR_OBJ(85, 'Ava Parade', 'Great Falls', 'NSW', 3405), 'Hayley.Berge24@gmail.com', '+61 5 2747 9369', 'none');
    addParent('Aiden Rees', ADDR_OBJ(83, 'Evie Summit', 'Lewisburgh', 'NSW', 3607), 'Ava.Hartmann@hotmail.com', '+61 9 9917 2018', 'none');
    addParent('Victoria Greenholt', ADDR_OBJ(29, 'James Estate Dr', 'Port Bellamouth', 'NSW', 3122), 'Harrison_Jones7@hotmail.com', '+61 444 032 178', 'none');
    addParent('Jasmine Russel', ADDR_OBJ(02, 'Eve Ridge', 'Lake Nicholas', 'NSW', 3500), 'Finn60@hotmail.com', '+61 0 8375 8548', 'none');
    addParent('Kiara Nguyen', ADDR_OBJ(47, 'Imogen Ridge', 'South Sarahhaven', 'NSW', 3495), 'Sebastian.Schmidt@gmail.com', '+61 6 4531 6229', 'none');
    addParent('Joshua Schneider', ADDR_OBJ(62, 'Isabel Trail', 'Quigleystad', 'NSW', 3416), 'Isabelle.Jacobs77@yahoo.com', '0434 247 982', 'none');
    addParent('Lola Jacobson', ADDR_OBJ(26, 'Ethan View Rd', 'St. Louis', 'NSW', 3147), 'Isla19@gmail.com', '+61 494 405 537', 'none');
    addParent('Savannah King', ADDR_OBJ(76, 'Thompson Grove', 'Dearborn Heights', 'NSW', 3610), 'Lola_Green3@gmail.com', '+61 436 946 959', 'none');
    addParent('Hamish Miller', ADDR_OBJ(66, 'Nicholas Ridge', 'Charliton', 'NSW', 3171), 'Sophie.Durgan42@gmail.com', '+61 5 4905 7683', 'none');
    addParent('Ethan Lee', ADDR_OBJ(98, 'Samantha Circuit', 'Bridgeport', 'NSW', 3864), 'Matilda12@yahoo.com', '+61 458 966 639', 'none');
    addParent('Leo Johnston', ADDR_OBJ(93, 'Lillian Avenue', 'Waltham', 'NSW', 3841), 'Hayden.Johns@gmail.com', '+61 456 951 166', 'none');
    addParent('Mia Swift', ADDR_OBJ(92, 'Hamish Meadow', 'South Elizabeth', 'NSW', 3032), 'Emily.Hessel38@hotmail.com', '+61 413 524 793', 'none');
    addParent('Hannah Nader', ADDR_OBJ(49, 'Layla Pass', 'Lake Leahchester', 'NSW', 3215), 'Thomas_Oneill57@hotmail.com', '+61 436 458 365', 'none');
    addParent('Christopher Jenkins', ADDR_OBJ(79, 'Jade Parkway', 'St. Charles', 'NSW', 3020), 'Willow_Boyer@hotmail.com', '+61 423 017 442', 'none');
END;
/


-- Populate 


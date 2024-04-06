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
    addEmployee('Tom Greenhill', '11-AUG-2020', ADDR_OBJ(21, 'Chalmers Lane', 'Devonport', 'TAS', 7310), 'Savannah20@gmail.com', '+61 488 151 232');
    addEmployee('John Apple', '01-DEC-2023',  ADDR_OBJ(9, 'Meadow Street', 'St Helens', 'TAS', 7310), 'Madeline97@yahoo.com', '06 0039 5419');
    addEmployee('Whitney Koch', '30-May-2023', ADDR_OBJ(282, 'Russel Station St', 'North Emma', 'NSW', 2085), 'Abigail10@gmail.com', '+61 465 075 681');
    addEmployee('James Lowe', '07-Dec-2023', ADDR_OBJ(170, 'Phoenix Mall', 'Loveland', 'NSW', 2647), 'JaydenHettinger@hotmail.com', '05 7682 4803');
    addEmployee('Bobby Kessler', '20-Dec-2023', ADDR_OBJ(448, 'Jackson Circuit', 'Coral Gables', 'NSW', 2089), 'Claudia79@hotmail.com', '01 0447 9267');
    addEmployee('Julian Patel', '27-Jan-2024', ADDR_OBJ(615, 'Jonathan Parkway', 'Conroyberg', 'NSW', 2148), 'Angus_Beatty@gmail.com', '0460 768 687');
    addEmployee('Ronald Garden', '25-Aug-2023', ADDR_OBJ(753, 'Chelsea Avenue', 'Port Callum', 'NSW', 2137), 'Chloe_B_84@hotmail.com', '0429 836 761');
    addEmployee('Julius Fahey', '20-Dec-2023', ADDR_OBJ(695, 'Tahlia Road', 'Cartwrightburgh', 'NSW', 2577), 'Lara22@gmail.com', '+61 1 6446 7399');
    addEmployee('Sabrina Hall', '12-Sep-2023', ADDR_OBJ(456, 'George Pass', 'Lake Summer', 'NSW', 2310), 'Sebastian.Garden@hotmail.com', '04 0585 7877');
    addEmployee('Lillian Richards', '17-May-2023', ADDR_OBJ(101, 'Natalie View Rd', 'New Gabriel', 'NSW', 2941), 'Tahlia_A71@hotmail.com', '+61 3 6301 8876');
    addEmployee('Ernest Monahan', '05-Jul-2023', ADDR_OBJ(882, 'Bartell Loop', 'Cameronview', 'NSW', 2415), 'Joel84@gmail.com', '0407 889 841');
    addEmployee('Lindsey Boyer', '10-Mar-2024', ADDR_OBJ(89, 'Tremblay Drive', 'Claudiaview', 'NSW', 2268), 'Nate_Ernser46@hotmail.com', '+61 2 2254 3856');
    addEmployee('Amanda Price', '27-Nov-2023', ADDR_OBJ(30, 'Nader Lane', 'East Jake', 'NSW', 2780), 'Willow.Jenkins@yahoo.com', '0402 867 367');
    addEmployee('Judith Garden', '21-May-2023', ADDR_OBJ(93, 'Murray Plaza', 'Santa Fe', 'NSW', 2837), 'Ashton25@hotmail.com', '06 8139 6620');
    addEmployee('Leonard Paterson', '16-Aug-2023', ADDR_OBJ(75, 'Schultz Run', 'North Georgia', 'NSW', 2588), 'Jasper.Towne@gmail.com', '09 2993 5809');
    addEmployee('Dennis Schroeder', '14-Feb-2024', ADDR_OBJ(82, 'Moss Summit', 'Port Benjamin', 'NSW', 2427), 'Aidan_Wood69@yahoo.com', '04 3991 6000');
    addEmployee('Damon Hartmann', '17-Jan-2024', ADDR_OBJ(81, 'Alice Pass', 'Homestead', 'NSW', 2943), 'Max71@yahoo.com', '0445 385 384');
    addEmployee('Lynda Ross', '10-Jul-2023', ADDR_OBJ(88, 'Smith Street', 'Toledo', 'NSW', 2675), 'Hunter6@hotmail.com', '+61 479 568 325');
    addEmployee('Bryan Stokes', '27-May-2023', ADDR_OBJ(68, 'Morrison Pass', 'Maddisonport', 'NSW', 2345), 'Gabriel_Monahan20@hotmail.com', '+61 487 828 639');
    addEmployee('Randall Hand', '22-Nov-2023', ADDR_OBJ(11, 'Carroll Ridge', 'New Justinton', 'NSW', 2528), 'AddisonSchroed@gmail.com', '0414 984 623');
    addEmployee('Steve Schultz', '10-Jan-2024', ADDR_OBJ(13, 'Nolan Estate Dr', 'Isabellatown', 'NSW', 2693), 'Abby.Mann@yahoo.com', '+61 3 6858 0437');
    addEmployee('Vicky Morrison', '14-Dec-2023', ADDR_OBJ(45, 'Cartwright Run', 'Hesselshire', 'NSW', 2453), 'Claire.Bailey@gmail.com', '0433 238 630');
    addEmployee('Lee Bogan', '24-Nov-2023', ADDR_OBJ(21, 'Lincoln Station St', 'Altamonte Springs', 'NSW', 2338), 'Elijah.West@gmail.com', '+61 7 9684 5626');
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

-- Populate Waitlist Table
BEGIN
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('18-Apr-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('09-May-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('01-Jun-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('02-Jun-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('08-Jun-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('16-Jun-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('21-Jun-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('12-Jul-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('05-Aug-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('18-Oct-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('27-Oct-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('06-Dec-2023');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('09-Jan-2024');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('14-Jan-2024');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('28-Jan-2024');
    INSERT INTO Y24GROUP054.WAITLIST("DATE_ADDED") VALUES ('29-Feb-2024');
END;
/
-- Populate Medication Table
BEGIN
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Enanazole');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Interfemara');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Fibrinone');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Amcinidine');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Asparacerol');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Trilinam');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Afixane Alkepentin');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Alpralestid Somaluble');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Quixitinoin Abaretane');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Ethacaine Tesbucil');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Adapazide');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Reflinatal');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Pentarotec');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Somalamide');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Olapiride');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Tetazoxane');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Naveltora Trazonitol');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Clarabine Methogestrel');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Prepogine Vigafinil');
    INSERT INTO Y24GROUP054.MEDICATION("MEDICATION_NAME") VALUES ('Lioparin Bioroban');
END;

-- Populate Child Table
-- declare sample table of emergency contacts
CREATE OR REPLACE TYPE CONTACT_TABLE AS TABLE OF CONTACT;
/
DECLARE
    e_contact CONTACT_TABLE;
BEGIN
    e_contact := CONTACT_TABLE(
        CONTACT('Lucy', 'Oconnell', '0440 391 115', ADDR_OBJ(29, 'Leo Circle', 'Port Skye', 'NSW', 2131), 'Henry_Flatley18@hotmail.com'),
        CONTACT('Sienna', 'Kemmer', '+61 7 3340 1312', ADDR_OBJ(21, 'Lilly Road', 'South Madisonbury', 'NSW', 2720), 'Ruby67@yahoo.com'),
        CONTACT('Isla', 'Gutmann', '+61 403 529 129', ADDR_OBJ(54, 'Rose Boulevard', 'North Imogen', 'NSW', 2156), 'Imogen.Barton@hotmail.com'),
        CONTACT('Eliza', 'Alexander', '+61 9 9895 0394', ADDR_OBJ(63, 'Hill Parade', 'Sophiemouth', 'NSW', 2389), 'Connor.Emard@hotmail.com'),
        CONTACT('Jordan', 'Doherty', '00 2041 2945', ADDR_OBJ(23, 'Huel Drive', 'West Amy', 'NSW', 2245), 'Charli_Hickle@hotmail.com'),
        CONTACT('Madeline', 'Hahn', '+61 5 6410 1430', ADDR_OBJ(8, 'Boyle Lane', 'Beavercreek', 'NSW', 2938), 'Mackenzie_Dare49@gmail.com'),
        CONTACT('Violet', 'Klein', '+61 9 3017 1551', ADDR_OBJ(35, 'Andrew Plaza', 'New Sam', 'NSW', 2824), 'John.Schultz@gmail.com'),
        CONTACT('Gemma', 'Hermann', '0429 292 141', ADDR_OBJ(91, 'Mills Way', 'Pawtucket', 'NSW', 2432), 'Marcus_Corwin@yahoo.com'),
        CONTACT('Alexandra', 'Rose', '0446 308 085', ADDR_OBJ(67, 'Braun Hill', 'North Johnland', 'NSW', 2920), 'Phoenix.Feil@yahoo.com'),
        CONTACT('Abby', 'Sanford', '0436 021 099', ADDR_OBJ(19, 'Alexander Drive', 'Ivyburgh', 'NSW', 2337), 'Elijah_Hahn@gmail.com'),
        CONTACT('Charli', 'Doyle', '+61 4 3562 7611', ADDR_OBJ(21, 'Mia Run', 'Hamishchester', 'NSW', 2211), 'Amelie_Hermiston52@gmail.com'),
        CONTACT('Toby', 'Jerde', '0453 796 853', ADDR_OBJ(81, 'Nader View Rd', 'Springfield', 'NSW', 2532), 'Maya.Wilderman@gmail.com'),
        CONTACT('Hugo', 'Hartmann', '0419 480 876', ADDR_OBJ(26, 'Dooley Pass', 'Lake Alexanderbury', 'NSW', 2196), 'Adam.Schneider50@yahoo.com'),
        CONTACT('Cody', 'Douglas', '+61 8 9389 2075', ADDR_OBJ(60, 'Noah Pass', 'North Sophie', 'NSW', 2675), 'James51@gmail.com'),
        CONTACT('Phoenix', 'Smith', '+61 414 111 032', ADDR_OBJ(30, 'Nathan Way', 'North Miami Beach', 'NSW', 2689), 'Isabella60@hotmail.com'),
        CONTACT('Anna', 'Kessler', '+61 1 1739 4015', ADDR_OBJ(14, 'Leannon Lane', 'Crookston', 'NSW', 2701), 'Oliver.Kovacek@yahoo.com')
    );

-- Add children
    addChild('Dylan Mclaughlin', 'Victoria Greenholt', '25-Mar-2019', e_contact(3), 1, 0);
    addChild('Jonathan Shields', 'Abbey Rees', '09-Aug-2017', e_contact(5), 2, 0.263);
    addChild('Nate Durgan', 'Joshua Schneider', '31-Jan-2018', e_contact(2), 3, 0.429);
    addChild('Chloe Kohler', 'Nicholas Richards', '11-Jul-2022', e_contact(8), NULL, 0);
    addChild('Mackenzie Dietrich', 'Jacob Little', '02-Sep-2022', e_contact(4), NULL, 0);
    addChild('Hugo Haley', 'Leah Scott', '20-Oct-2022', e_contact(10), NULL, 0);
    addChild('Abby Abbott', 'Hayden Ross', '07-Sep-2018', e_contact(9), NULL, 0);
    addChild('Oscar Bartell', 'Mackenzie Morrison', '26-Jan-2023', e_contact(1), NULL, 0);
    addChild('Jackson Ferry', 'Abbey Rees', '30-Nov-2018', e_contact(5), NULL, 0);
    addChild('Jasper Wood', 'Connor Waters', '19-Nov-2021', e_contact(10), NULL, 0);
    addChild('Madison Heaney', 'Abbey Rees', '08-Apr-2023', e_contact(5), NULL, 0);
    addChild('Sarah Davies', 'Abbey Rees', '13-Oct-2021', e_contact(5), NULL, 0);
    addChild('Annabelle Walker', 'Thomas Hettinger', '25-Oct-2017', e_contact(7), NULL, 0);
    addChild('Ivy Martin', 'Edward Ritchie', '02-Mar-2022', e_contact(4), NULL, 0.085);
    addChild('Alyssa Murray', 'Victoria Greenholt', '18-Jun-2018', e_contact(3), NULL, 0);
    addChild('Emily Feil', 'Nicholas Richards', '15-Dec-2024', e_contact(8), NULL, 0);
    addChild('Caitlin Stark', 'Marcus Johnson', '06-Aug-2018', e_contact(11), NULL, 0.16);
    addChild('Stella Kovacek', 'Abbey Rees', '18-Dec-2018', e_contact(15), NULL, 0);
    addChild('Michael Schultz', 'Benjamin Farrell', '27-Apr-2023', e_contact(15), NULL, 0.441);
    addChild('Molly Emmerich', 'Amelie Daniel', '22-Nov-2021', e_contact(15), NULL, 0);
    addChild('Anna Dickens', 'Hamish Hughes', '10-May-2021', e_contact(13), NULL, 0.26);
    addChild('Andrew Roberts', 'Nicholas Richards', '04-May-2022', e_contact(7), 6, 0);
    addChild('Madison Kovacek', 'Victoria Greenholt', '23-Jan-2019', e_contact(3), 4, 0.541);
    addChild('Heidi Sanford', 'Joshua Schneider', '03-Oct-2023', e_contact(2), 5, 0);
    addChild('Benjamin Erdman', 'Joshua Schneider', '15-May-2018', e_contact(2), 6, 0);
    addChild('Phoebe Harber', 'Emily Reynolds', '12-Aug-2017', e_contact(4), 7, 0);
    addChild('Kai Bayer', 'Leah Daugherty', '08-Jan-2022', e_contact(4), 8, 0.538);
    addChild('Isla Smyth', 'Abbey Rees', '26-Aug-2022', e_contact(5), 9, 0.89);
    addChild('Luke Jenkins', 'Aiden Rees', '26-Apr-2020', e_contact(16), 10, 0.363);
    addChild('Zachary Thompson', 'Leo Johnston', '22-Mar-2019', e_contact(14), 11, 0.208);
    addChild('Andrew Sanford', 'Mia Swift', '02-Sep-2021', e_contact(12), 12, 0.021);
    addChild('Max Morissette', 'Hannah Nader', '11-Dec-2018', e_contact(12), 13, 0.243);
    addChild('Chase Rutherford', 'Christopher Jenkins', '07-May-2020', e_contact(10), 14, 0.207);
    addChild('Nate Kovacek', 'Thomas Hettinger', '17-Sep-2019', e_contact(10), 15, 0.288);
END;
/

-- Populate Child_Medication table
BEGIN
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (8, 12, 868.67, 'twice daily','allergies');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (7, 14, 798.29, 'hourly','growth supplement');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (3, 11, 943.5, 'every two hours','headaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (9, 18, 452.62, 'daily','bellyaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (7, 13, 215.88, 'every two hours','headaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (7, 16, 935.61, 'hourly','growth supplement');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (4, 11, 197.19, 'every thirty minutes','every thirty minutes');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (9, 11, 48.05, 'twice daily','allergies');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (1, 17, 524.67, 'every two hours','HGH');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (6, 17, 663.89, 'twice daily','allergies');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (12, 1, 326.08, 'twice daily','allergies');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (12, 2, 224.97, 'hourly','growth supplement');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (16, 3, 241.68, 'every two hours','headaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (14, 7, 367.15, 'daily','bellyaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (17, 4, 20.02, 'every two hours','headaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (14, 1, 370.2, 'hourly','growth supplement');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (17, 7, 196.37, 'every thirty minutes','every thirty minutes');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (14, 9, 954.33, 'twice daily','allergies');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (19, 7, 656.51, 'every two hours','headaches');
    INSERT INTO Y24GROUP054.CHILD_MEDICATION("CHILD_ID", "MEDICATION_ID", "DOSAGE_MG", "FREQUENCY", "DESCRIPTION") VALUES (11, 7, 923.53, 'twice daily','allergies');
END;
/
-- Populate Room table
BEGIN
    -- young kids
    addRoom('Koala1', 'North Wing', 10, 0, 1);
    addRoom('Koala2', 'North Wing', 10, 0, 1);
    addRoom('Koala3', 'North Wing', 13, 0, 1);
    addRoom('Koala4', 'North Wing', 13, 0, 1);
    -- young toddlers
    addRoom('TassieDevil1', 'South Wing', 10, 2, 3);
    addRoom('TassieDevil2', 'South Wing', 10, 2, 3);
    addRoom('TassieDevil3', 'South Wing', 13, 2, 3);
    addRoom('TassieDevil4', 'South Wing', 13, 2, 3);
    -- old toddlers
    addRoom('Wallaby1', 'West Wing', 6, 3, 4);
    addRoom('Wallaby2', 'West Wing', 8, 3, 4);
    addRoom('Wallaby3', 'West Wing', 10, 3, 4);
    addRoom('Wallaby4', 'West Wing', 4, 3, 4);
    --oldest
    addRoom('Kangaroo1', 'East Wing', 15, 5, 8);
    addRoom('Kangaroo2', 'East Wing', 12, 5, 8);
    addRoom('Kangaroo3', 'East Wing', 10, 5, 8);
END;
/

-- Populate Class table
BEGIN
    
    addClass('Koala1', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('Koala2', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    addClass('Koala3', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('Koala4', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));

    addClass('TassieDevil1', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('TassieDevil2', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    addClass('TassieDevil3', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('TassieDevil4', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    
    addClass('Wallaby1', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('Wallaby2', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    addClass('Wallaby3', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('Wallaby4', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    
    addClass('Kangaroo1', SESSIONS('M7A','M12P','Tu7A','Tu12P','W7A','W12P','Th7A','Th12P','F7A','F12P'));
    addClass('Kangaroo2', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    addClass('Kangaroo3', SESSIONS('M9A','M1P','Tu9A','Tu1P','W9A','W1P','Th9A','Th1P','F9A','F1P'));
    
    END;
/

-- Generate attendances
BEGIN
    generateAttendance(9, STAFF_NAMES('Tom Greenhill'), CHILD_NAMES('Jackson Ferry', 'Dylan Mclaughlin', 'Jonathan Shields'), '28-12-2023 09:35 AM', '28-12-2023 11:35 AM');
    generateAttendance(19, STAFF_NAMES('John Apple'), CHILD_NAMES('Jasper Wood', 'Nate Durgan', 'Chloe Kohler'), '08-02-2024 01:22 PM', '08-02-2024 05:22 PM');
    generateAttendance(7, STAFF_NAMES('Whitney Koch'), CHILD_NAMES('Madison Heaney', 'Mackenzie Dietrich', 'Hugo Haley'), '05-03-2024 01:05 PM', '05-03-2024 05:05 PM');
    generateAttendance(2, STAFF_NAMES('James Lowe'), CHILD_NAMES('Sarah Davies', 'Abby Abbott', 'Oscar Bartell'), '27-03-2024 02:09 PM', '27-03-2024 06:09 PM');
    generateAttendance(21, STAFF_NAMES('Bobby Kessler'), CHILD_NAMES('Annabelle Walker', 'Jackson Ferry', 'Jasper Wood'), '06-09-2023 10:13 AM', '06-09-2023 4:13 PM');
    generateAttendance(6, STAFF_NAMES('Julian Patel','Steve Schultz'), CHILD_NAMES('Ivy Martin', 'Madison Heaney', 'Sarah Davies'), '18-09-2023 12:47 PM', '18-09-2023 5:47 PM');
    generateAttendance(16, STAFF_NAMES('Ronald Garden'), CHILD_NAMES('Alyssa Murray', 'Annabelle Walker', 'Ivy Martin'), '05-05-2023 10:07 AM', '05-05-2023 3:07 PM');
    generateAttendance(12, STAFF_NAMES('Julius Fahey','Vicky Morrison', 'Lee Bogan'), CHILD_NAMES('Emily Feil', 'Alyssa Murray', 'Ivy Martin'), '25-06-2023 02:30 PM', '25-06-2023 05:30 PM');
    generateAttendance(17, STAFF_NAMES('Sabrina Hall'), CHILD_NAMES('Caitlin Stark', 'Annabelle Walker', 'Stella Kovacek'), '04-06-2023 07:26 AM', '04-06-2023 11:26 AM');
    generateAttendance(8, STAFF_NAMES('Lillian Richards','Lee Bogan'), CHILD_NAMES('Stella Kovacek', 'Michael Schultz', 'Molly Emmerich'), '13-05-2023 03:00 PM', '13-05-2023 06:00 PM');
    generateAttendance(4, STAFF_NAMES('Ernest Monahan'), CHILD_NAMES('Michael Schultz', 'Anna Dickens', 'Andrew Roberts'), '22-05-2023 10:03 AM', '22-05-2023 2:03 PM');
    generateAttendance(11, STAFF_NAMES('Lindsey Boyer'), CHILD_NAMES('Molly Emmerich', 'Madison Kovacek', 'Heidi Sanford'), '02-01-2024 01:49 PM', '02-01-2024 04:49 PM');
END;
/
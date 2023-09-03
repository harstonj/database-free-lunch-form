--
-- Dumping data for table `application`
--

INSERT INTO application (application_id, household_id, signed_date, denied_reason, school_official, notice_date, lea_code, app_code) VALUES
(1, 11, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(2, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(3, 13, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL);

(5, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(6, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(7, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(8, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(9, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(10, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL),
(11, 12, '2022-05-13', NULL, 'Curly Sue', '2022-05-21', NULL, NULL);
--
-- Dumping data for table `income`
--

INSERT INTO income (income_id, income_type_code, income_interval_code) VALUES
(001, 'WORK', 'BW'),
(002, 'PACSA', '2M'),
(003, 'PRSSI', '1M');

--
-- Dumping data for table `student_income`
--

INSERT INTO student_income (income_id, student_id) VALUES
(001, 1),
(002, 2),
(003, 3);

--
-- Dumping data for table `household_income`
--

INSERT INTO household_income (income_id, household_id) VALUES
(001, 11),
(002, 12),
(003, 13);

--
-- Dumping data for table `othermember_income`
--

INSERT INTO othermember_income (othermember_id, income_id) VALUES
(1, 001),
(2, 002),
(3, 003);

--
-- Dumping data for table `household`
--

INSERT INTO household (household_id, othermember_id, student_id, primary_ssn, address_code, prior_benefits,
						is_homeless, is_migrant, ethnicity_code, race_code, assistance_id) VALUES
(11, 1, 1, 123456789, 1, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(12, 2, 2, 987654321, 2, 1, 0, 0, 'LAT_HIS', NULL, 1),
(13, 3, 3, 456789012, 3, 0, 0, 0, 'NOT_LH', 'ASN', NULL),

(15, 4, 11, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(14, 4, 4, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(16, 4, 6, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(17, 4, 7, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(18, 4, 8, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(19, 4, 9, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL),
(20, 4, 10, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL,
(21, 4, 11, 456789011, 3, 0, 0, 0, 'NOT_LH', 'WHT', NULL);

--
-- Dumping data for table `other_member`
--

INSERT INTO other_member (othermember_id, member_name, is_foster) VALUES
(1, 'Billy Bob', 0),
(2, 'Tom Thumb', 0),
(3, 'Daisy Flower', 0),

(4, 'Doctor Who', 0);

--
-- Dumping data for table `student`
--

INSERT INTO student (student_id, student_lastname, student_firstname, student_mi, is_foster, birth_date, school, grade_code) VALUES
(1, 'Sue', 'Curly', NULL, 0, '2000-04-20', 'Shoreline High School', 2),
(2, 'Sue', 'Curly', NULL, 0, '1999-05-23', 'Shoreline High School', 3),
(3, 'Sue', 'Curly', NULL, 0, '2000-12-31', 'Shoreline High School', 1)


(5, 'Holmes', 'Sherlock', NULL, 0, '2007-10-04', 'Gateway Middle School', 8),
(6, 'Potter', 'Harry', 'J', 1, '1980-07-31', 'Hogwarts', 6),
(7, 'Spellman', 'Amy', 'L', 0, '2007-11-30', 'Skyview Middle School', 8),
(8, 'Smith', 'Tara', 'M', 0, '2011-05-05', 'Silver Firs Elementary', 5),
(9, 'Sosa', 'Amanda', 'N', 1, '2012-09-06', 'Silver Firs Elementary', 4),
(10, 'White', 'Sam', 'M', 0, '2014-11-09', 'Helen Keller Elementry', 2),
(11, 'Tyler', 'Rose', 'BW', 0, '2005-10-20', 'Northcreek High School', 10);


--
-- Dumping data for table `address`
--

INSERT INTO address (address_id, street_address, city, state_code, postalcode) VALUES
(1, '2246 Honey Anchor Link', 'Mudtown', 'MO', '64707-2567'),
(2, '2054 Thunder Ledge', 'Mermaid Run', 'IL', '61093-2962'),
(3, '1206 Middle Bluff Row', 'Cornstalk', 'TX', '79508-3900');


--
-- Dumping data for table `income_type`
--

INSERT INTO income_type (income_type_code) VALUES
('WORK'),
('PACSA'),
('PRSSI');

--
-- Dumping data for table 'income_interval'
--

INSERT INTO income_interval (income_interval_code) VALUES
('BW'),
('2M'),
('1M');

--
-- Dumping data for table 'household_contact'
--

INSERT INTO household_contact(othermember_id, household_id, phone_no, email, contact_signed_date) VALUES
(1, 11, 4255508970, 'curlysue@gmail.com', '2022-05-21'),
(2, 12, 4256749000, 'suecurly@gmail.com', '2022-05-20'),
(3, 13, 3601508333, 'curlys@yahoo.com', '2022-05-18');

--
-- Dumping data for table 'assistance_programs'
--

INSERT INTO assistance_programs(assistance_id, basic_food, tanf, fdipr, case_no) VALUES
(1, 0, 0, 0, '1001'),
(2, 1, 0, 1, '1200'),
(3, 0, 0, 0, '1002');

--
-- Dumping data for table `state`
--

INSERT INTO `state` (state_code) VALUES
('AK'),
('AL'),
('AR'),
('AS'),
('AZ'),
('CA'),
('CO'),
('CT'),
('DC'),
('DE'),
('FL'),
('GA'),
('GU'),
('HI'),
('IA'),
('ID'),
('IL'),
('IN'),
('KS'),
('KY'),
('LA'),
('MA'),
('MD'),
('ME'),
('MI'),
('MN'),
('MO'),
('MS'),
('MT'),
('NC'),
('ND'),
('NE'),
('NH'),
('NJ'),
('NM'),
('NV'),
('NY'),
('OH'),
('OK'),
('OR'),
('PA'),
('PR'),
('RI'),
('SC'),
('SD'),
('TN'),
('TX'),
('UT'),
('VA'),
('VI'),
('VT'),
('WA'),
('WI'),
('WV'),
('WY');

--
-- Dumping data for table `ethnicity`
--

INSERT INTO ethnicity (ethnicity_code) VALUES
('NOT_LH'),
('LAT_HIS');

INSERT INTO race (raceCode) VALUES
('WHT'),
('ASN'),
('BLK'),
('HAW'),
('IND');

INSERT INTO grade(grade_code) VALUES
(0),
(1),
(2),
(3),
(4),
(5),

(6),
(7),
(8),
(9),
(10),
(11),
(12);

INSERT INTO lea_approval(lea_code) VALUES
('ASST'),
('INC');

INSERT INTO app_approval(app_code) VALUES
('FREE'),
('REDUCED');
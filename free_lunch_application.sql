--
-- Database: free_lunch_application
--

CREATE DATABASE IF NOT EXISTS free_lunch_application;
USE free_lunch_application;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS application (
	application_id INT NOT NULL,
	household_id INT NOT NULL,
	signed_date DATE,
	denied_reason VARCHAR(50),
	school_official VARCHAR(50) NOT NULL,
	notice_date DATE,
	lea_code INT,
	app_code INT,
	PRIMARY KEY (application_id),
	FOREIGN KEY (household_id) REFERENCES household(household_id),
	FOREIGN KEY (lea_code) REFERENCES lea_approval(lea_code),
	FOREIGN KEY (app_code) REFERENCES app_approval(app_code)
) ENGINE=InnoDB;
	

	
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE IF NOT EXISTS income (
	income_id INT NOT NULL,
	income_type_code VARCHAR(10) NOT NULL,
	income_interval_code VARCHAR(2) NOT NULL,
	PRIMARY KEY (income_id),
	FOREIGN KEY (income_type_code) REFERENCES income_type(income_type_code),
	FOREIGN KEY (income_interval_code) REFERENCES income_interval(income_interval_code)
) ENGINE=InnoDB;
	

	
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Table structure for table `student_income`
--

CREATE TABLE IF NOT EXISTS student_income (
	income_id INT NOT NULL,
	student_id INT NOT NULL,
	PRIMARY KEY (income_id, student_id),
	FOREIGN KEY (income_id) REFERENCES income(income_id),
	FOREIGN KEY (student_id) REFERENCES student(student_id)
) ENGINE=InnoDB;
	

	
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Table structure for table `household_income`
--

CREATE TABLE IF NOT EXISTS household_income (
	income_id INT NOT NULL,
	household_id INT NOT NULL,
	PRIMARY KEY (income_id, household_id),
	FOREIGN KEY (income_id) REFERENCES income(income_id),
	FOREIGN KEY (household_id) REFERENCES household(household_id)
) ENGINE=InnoDB;
	

	
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Table structure for table `othermember_income`
--

CREATE TABLE IF NOT EXISTS othermember_income (
	othermember_id INT NOT NULL,
	income_id INT NOT NULL,
	PRIMARY KEY (othermember_id, income_id),
	FOREIGN KEY (othermember_id) REFERENCES other_member(othermember_id),
	FOREIGN KEY (income_id) REFERENCES income(income_id)
) ENGINE=InnoDB;
	

	
-- --------------------------------------------------------
--
-- Table structure for table `household`
--

CREATE TABLE IF NOT EXISTS household (
	household_id INT NOT NULL,
	othermember_id INT NOT NULL,
	student_id INT NOT NULL,
	primary_ssn INT NOT NULL UNIQUE,
	address_code INT,
	prior_benefits BOOL,
	is_homeless BOOL,
	is_migrant BOOL,
	ethnicity_code VARCHAR(10),
	race_code VARCHAR(10),
	assistance_id INT,
	PRIMARY KEY (household_id),
	FOREIGN KEY (othermember_id) REFERENCES other_member(othermember_id),
	FOREIGN KEY (student_id) REFERENCES student(student_id),
	FOREIGN KEY (ethnicity_code) REFERENCES ethnicity(ethnicity_code),
	FOREIGN KEY (race_code) REFERENCES race(race_code),
	FOREIGN KEY (assistance_id) REFERENCES assistance_programs(assistance_id)
) ENGINE=InnoDB;



-- --------------------------------------------------------

--
-- Table structure for table `other_member`
--

CREATE TABLE IF NOT EXISTS other_member (
	othermember_id INT NOT NULL,
	member_name VARCHAR(50) NOT NULL,
	is_foster BOOL,
	PRIMARY KEY (othermember_id)
) ENGINE=InnoDB;



-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS student (
	student_id INT NOT NULL,
	student_lastname VARCHAR(50) NOT NULL,
	student_firstname VARCHAR(50) NOT NULL,
	student_mi VARCHAR(5),
	is_foster BOOL,
	birth_date DATE NOT NULL,
	school VARCHAR(50) NOT NULL,
	grade_code INT NOT NULL,
	PRIMARY KEY (student_id),
	FOREIGN KEY (grade_code) REFERENCES grade(grade_code)
) ENGINE=InnoDB;



-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS address (
	address_id INT NOT NULL,
	street_address VARCHAR(50),
	city VARCHAR(50),
	state_code VARCHAR(2),
	postalcode VARCHAR(10),
	PRIMARY KEY (address_id),
	FOREIGN KEY (state_code) REFERENCES `state`(state_code)
) ENGINE=InnoDB;



-- --------------------------------------------------------
--
-- Table structure for table 'income_type'
--

CREATE TABLE IF NOT EXISTS income_type (
	income_type_code VARCHAR(10) NOT NULL,
	PRIMARY KEY (income_type_code)
) ENGINE=InnoDB;


-- ----------------------------------------------------------

-- -------------------------------------------------------
-- Table structure for table 'income_interval'
--

CREATE TABLE IF NOT EXISTS income_interval (
	income_interval_code VARCHAR(2) NOT NULL,
	PRIMARY KEY (income_interval_code)
) ENGINE=InnoDB;



-- -------------------------------------------------------
-- Table structure for table 'household_contact'
--

CREATE TABLE IF NOT EXISTS household_contact (
	othermember_id INT NOT NULL,
	household_id INT NOT NULL,
	phone_no INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	contact_signed_date DATE,
	PRIMARY KEY (othermember_id, household_id),
	FOREIGN KEY (othermember_id) REFERENCES other_member(othermember_id),
	FOREIGN KEY (household_id) REFERENCES household(household_id)
) ENGINE=InnoDB;



-- -------------------------------------------------------
-- Table structure for table 'assistance_programs'
--

CREATE TABLE IF NOT EXISTS assistance_programs(
	assistance_id INT NOT NULL,
	basic_food BOOL,
	tanf BOOL,
	fdipr BOOL,
	case_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (assistance_id)
) ENGINE=InnoDB;



-- -------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `state_code` varchar(2) NOT NULL
) ENGINE=InnoDB;



-- --------------------------------------------------------

--
-- Table structure for table `LEAapproval`
--

CREATE TABLE IF NOT EXISTS lea_approval (
  lea_code VARCHAR(10) NOT NULL PRIMARY KEY
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `appCode`
--

CREATE TABLE IF NOT EXISTS app_approval (
  app_code VARCHAR(10) NOT NULL PRIMARY KEY
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ethnicity`
--

CREATE TABLE IF NOT EXISTS ethnicity (
  ethnicity_code varchar(10) NOT NULL PRIMARY KEY
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE IF NOT EXISTS race (
  race_code varchar(3) NOT NULL
) ENGINE=InnoDB;



-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS grade (
  grade_code INT NOT NULL PRIMARY KEY
) ENGINE=InnoDB;

-- --------------------------------------------------------

CREATE INDEX idx_studentname
ON student (student_firstname, student_lastname);

CREATE INDEX idx_student_birthdate
ON student (birth_date);

CREATE INDEX idx_student_school
ON student (school);

CREATE INDEX idx_household_ssn
ON household (primary_ssn);

CREATE INDEX idx_contact_phone
ON household_contact (phone_no);

CREATE INDEX idx_contact_email
ON household_contact (email);

CREATE INDEX idx_othermember_name
ON other_member (member_name);

CREATE INDEX idx_assistance_caseno
ON assistance_programs (case_no);

CREATE INDEX idx_app_school_official
ON application (school_official);

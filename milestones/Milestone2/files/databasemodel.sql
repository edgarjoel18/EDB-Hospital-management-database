-- MySQL Script generated by MySQL Workbench
-- Thu Jul 22 07:28:34 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS HospitalManagementDB;
CREATE DATABASE HospitalManagementDB;
USE HospitalManagementDB;
-- -----------------------------------------------------
-- Table `Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account` ;

CREATE TABLE IF NOT EXISTS `Account` (
  `account_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` INT NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hospital` ;

CREATE TABLE IF NOT EXISTS `Hospital` (
  `hospital_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `account` INT NULL,
  `department` INT NULL,
  `president_name` VARCHAR(255) NOT NULL,
  `address` INT NULL,
  PRIMARY KEY (`hospital_id`),
  INDEX `FK_HOSPITAL_ACCOUNT_idx` (`account` ASC) VISIBLE,
  INDEX `FK_HOSPITAL_ADDRESS_idx` (`address` ASC) VISIBLE,
  CONSTRAINT `FK_HOSPITAL_ACCOUNT`
    FOREIGN KEY (`account`)
    REFERENCES `Account` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_HOSPITAL_ADDRESS`
    FOREIGN KEY (`address`)
    REFERENCES `Address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Profile` ;

CREATE TABLE IF NOT EXISTS `Profile` (
  `profile_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`profile_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HealthInsurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HealthInsurance` ;

CREATE TABLE IF NOT EXISTS `HealthInsurance` (
  `health_insurance_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`health_insurance_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SeniorityLevel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SeniorityLevel` ;

CREATE TABLE IF NOT EXISTS `SeniorityLevel` (
  `seniority_level_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seniority_level_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` VARCHAR(30) NOT NULL,
  `employee_profile` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `health_insurance` INT NOT NULL,
  `seniority_level` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `FK_EMPLOYEE_HEALTHINSURANCE_idx` (`health_insurance` ASC) VISIBLE,
  INDEX `FK_EMPLOYEE_SENIORITYLEVEL_idx` (`seniority_level` ASC) VISIBLE,
  INDEX `FK_EMPLOYEE_EMPLOYEEPROFILE_idx` (`employee_profile` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEE_EMPLOYEEPROFILE`
    FOREIGN KEY (`employee_profile`)
    REFERENCES `Profile` (`profile_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEE_HEALTHINSURANCE`
    FOREIGN KEY (`health_insurance`)
    REFERENCES `HealthInsurance` (`health_insurance_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEE_SENIORITYLEVEL`
    FOREIGN KEY (`seniority_level`)
    REFERENCES `SeniorityLevel` (`seniority_level_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalRecord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalRecord` ;

CREATE TABLE IF NOT EXISTS `MedicalRecord` (
  `medical_record_id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`medical_record_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient` ;

CREATE TABLE IF NOT EXISTS `Patient` (
  `patient_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `patient_profile` INT NOT NULL,
  `health_insurance` INT NOT NULL,
  `medical_record` INT NOT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `FK_PATIENT_HEALTHINSURANCE_idx` (`health_insurance` ASC) VISIBLE,
  INDEX `FK_PATIENT_MEDICALRECORD_idx` (`medical_record` ASC) VISIBLE,
  INDEX `FK_PATIENT_PROFILE_idx` (`patient_profile` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENT_PROFILE`
    FOREIGN KEY (`patient_profile`)
    REFERENCES `Profile` (`profile_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENT_HEALTHINSURANCE`
    FOREIGN KEY (`health_insurance`)
    REFERENCES `HealthInsurance` (`health_insurance_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENT_MEDICALRECORD`
    FOREIGN KEY (`medical_record`)
    REFERENCES `MedicalRecord` (`medical_record_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HosptialAndPatients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HosptialAndPatients` ;

CREATE TABLE IF NOT EXISTS `HosptialAndPatients` (
  `hospital_and_patient_id` INT NOT NULL AUTO_INCREMENT,
  `hospital` INT NOT NULL,
  `patient` INT NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`hospital_and_patient_id`),
  INDEX `FK_HOSPITAL_idx` (`hospital` ASC) VISIBLE,
  INDEX `FK_PATIENT_idx` (`patient` ASC) VISIBLE,
  CONSTRAINT `FK_HOSPITAL`
    FOREIGN KEY (`hospital`)
    REFERENCES `Hospital` (`hospital_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PhoneNumber`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PhoneNumber` ;

CREATE TABLE IF NOT EXISTS `PhoneNumber` (
  `phone_number_id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  PRIMARY KEY (`phone_number_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientAndPhoneNumbers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PatientAndPhoneNumbers` ;

CREATE TABLE IF NOT EXISTS `PatientAndPhoneNumbers` (
  `patient_and_phone_numbers` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `phone_number` INT NOT NULL,
  PRIMARY KEY (`patient_and_phone_numbers`),
  INDEX `FK_PATIENTANDPHONENUMBERS_PATIENT_idx` (`patient` ASC) VISIBLE,
  INDEX `FK_PATIENTANDPHONENUMBERS_PHONENUMBER_idx` (`phone_number` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENTANDPHONENUMBERS_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENTANDPHONENUMBERS_PHONENUMBER`
    FOREIGN KEY (`phone_number`)
    REFERENCES `PhoneNumber` (`phone_number_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmergencyContact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmergencyContact` ;

CREATE TABLE IF NOT EXISTS `EmergencyContact` (
  `emergency_contact_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`emergency_contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmergencyContactAndPatient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmergencyContactAndPatient` ;

CREATE TABLE IF NOT EXISTS `EmergencyContactAndPatient` (
  `emergency_contact_and_patient_id` INT NOT NULL AUTO_INCREMENT,
  `emergency_contact` INT NOT NULL,
  `patient` INT NOT NULL,
  PRIMARY KEY (`emergency_contact_and_patient_id`),
  INDEX `FK_EMERGENCYCONTACT_PATIENT_idx` (`patient` ASC) VISIBLE,
  INDEX `FK_EMERGENCYCONTACT_EMERGENCYCONTACT_idx` (`emergency_contact` ASC) VISIBLE,
  CONSTRAINT `FK_EMERGENCYCONTACT_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMERGENCYCONTACT_EMERGENCYCONTACT`
    FOREIGN KEY (`emergency_contact`)
    REFERENCES `EmergencyContact` (`emergency_contact_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalAndEmployees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HospitalAndEmployees` ;

CREATE TABLE IF NOT EXISTS `HospitalAndEmployees` (
  `hospital_and_employees` INT NOT NULL AUTO_INCREMENT,
  `hospital` INT NOT NULL,
  `employee` INT NOT NULL,
  PRIMARY KEY (`hospital_and_employees`),
  INDEX `FK_HOSPITALANDEMPLOYEES_EMPLOYEES_idx` (`employee` ASC) VISIBLE,
  INDEX `FK_HOSPITALANDEMPLOYEES_HOSPITAL_idx` (`hospital` ASC) VISIBLE,
  CONSTRAINT `FK_HOSPITALANDEMPLOYEES_EMPLOYEES`
    FOREIGN KEY (`employee`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_HOSPITALANDEMPLOYEES_HOSPITAL`
    FOREIGN KEY (`hospital`)
    REFERENCES `Hospital` (`hospital_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeeAndAddresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeeAndAddresses` ;

CREATE TABLE IF NOT EXISTS `EmployeeAndAddresses` (
  `employee_and_addresses_id` INT NOT NULL AUTO_INCREMENT,
  `employee` INT NOT NULL,
  `address` INT NULL,
  PRIMARY KEY (`employee_and_addresses_id`),
  INDEX `FK_EMPLOYEEANDADDRESSES_EMPLOYEE_idx` (`employee` ASC) VISIBLE,
  INDEX `FK_EMPLOYEEANDADDRESSES_ADDRESS_idx` (`address` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEEANDADDRESSES_EMPLOYEE`
    FOREIGN KEY (`employee`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEEANDADDRESSES_ADDRESS`
    FOREIGN KEY (`address`)
    REFERENCES `Address` (`address_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientAndAddresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PatientAndAddresses` ;

CREATE TABLE IF NOT EXISTS `PatientAndAddresses` (
  `patient_and_addresses_id` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `address` INT NOT NULL,
  PRIMARY KEY (`patient_and_addresses_id`),
  INDEX `FK_PATIENTANDADDRESSES_PATIENT_idx` (`patient` ASC) VISIBLE,
  INDEX `FK_PATIENTANDADDRESSES_ADDRESS_idx` (`address` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENTANDADDRESSES_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENTANDADDRESSES_ADDRESS`
    FOREIGN KEY (`address`)
    REFERENCES `Address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Appointment` ;

CREATE TABLE IF NOT EXISTS `Appointment` (
  `appointment_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`appointment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AppointmentAndPatient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppointmentAndPatient` ;

CREATE TABLE IF NOT EXISTS `AppointmentAndPatient` (
  `appointment_and_patient_id` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `appointment` INT NOT NULL,
  PRIMARY KEY (`appointment_and_patient_id`),
  UNIQUE INDEX `appointment_UNIQUE` (`appointment` ASC) VISIBLE,
  INDEX `FK_APPOINTMENTANDPATIENT_PATIENT_idx` (`patient` ASC) VISIBLE,
  CONSTRAINT `FK_APPOINTMENTANDPATIENT_APPOINTMENT`
    FOREIGN KEY (`appointment`)
    REFERENCES `Appointment` (`appointment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_APPOINTMENTANDPATIENT_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

CREATE TABLE IF NOT EXISTS `Department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `hospital` INT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `FK_DEPARTMENT_HOSPITAL_idx` (`hospital` ASC) VISIBLE,
  CONSTRAINT `FK_DEPARTMENT_HOSPITAL`
    FOREIGN KEY (`hospital`)
    REFERENCES `Hospital` (`hospital_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DepartmentAndEmployees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DepartmentAndEmployees` ;

CREATE TABLE IF NOT EXISTS `DepartmentAndEmployees` (
  `department` INT NOT NULL,
  `employee` INT NOT NULL,
  INDEX `FK_DEPARTMENTANDEMPLOYEES_DEPARTMENT_idx` (`department` ASC) VISIBLE,
  INDEX `FK_DEPARTMENTANDEMPLOYEES_EMPLOYEE_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `FK_DEPARTMENTANDEMPLOYEES_DEPARTMENT`
    FOREIGN KEY (`department`)
    REFERENCES `Department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_DEPARTMENTANDEMPLOYEES_EMPLOYEE`
    FOREIGN KEY (`employee`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Doctor` ;

CREATE TABLE IF NOT EXISTS `Doctor` (
  `doctor_id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`doctor_id`, `employee_id`),
  INDEX `FK_DOCTOR_EMPLOYEE_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `FK_DOCTOR_EMPLOYEE`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nurse` ;

CREATE TABLE IF NOT EXISTS `Nurse` (
  `nurse_id` INT NOT NULL,
  `employee` INT NOT NULL,
  PRIMARY KEY (`nurse_id`, `employee`),
  INDEX `FK_NURSE_EMPLOYEE_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `FK_NURSE_EMPLOYEE`
    FOREIGN KEY (`employee`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Director` ;

CREATE TABLE IF NOT EXISTS `Director` (
  `director_id` INT NOT NULL,
  `employee` INT NOT NULL,
  PRIMARY KEY (`director_id`, `employee`),
  INDEX `FK_DIRECTOR_EMPLOYEE_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `FK_DIRECTOR_EMPLOYEE`
    FOREIGN KEY (`employee`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Procedure` ;

CREATE TABLE IF NOT EXISTS `Procedure` (
  `procedure_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(50) NOT NULL,
  `description` LONGTEXT NOT NULL,
  PRIMARY KEY (`procedure_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeesAndProcedures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeesAndProcedures` ;

CREATE TABLE IF NOT EXISTS `EmployeesAndProcedures` (
  `employee_and_procedure` INT NOT NULL,
  `procedure` INT NOT NULL,
  PRIMARY KEY (`employee_and_procedure`),
  INDEX `FK_EMPLOYEESANDPROCEDURES_PROCEDURE_idx` (`procedure` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEESANDPROCEDURES_EMPLOYEE`
    FOREIGN KEY (`employee_and_procedure`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEESANDPROCEDURES_PROCEDURE`
    FOREIGN KEY (`procedure`)
    REFERENCES `Procedure` (`procedure_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeesAndAppointments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeesAndAppointments` ;

CREATE TABLE IF NOT EXISTS `EmployeesAndAppointments` (
  `employees_and_appointments_id` INT NOT NULL,
  `appointment` INT NOT NULL,
  PRIMARY KEY (`employees_and_appointments_id`),
  INDEX `FK_EMPLOYEESANDAPPOINTMENTS_APPOINTMENT_idx` (`appointment` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEESANDAPPOINTMENTS_EMPLOYEE`
    FOREIGN KEY (`employees_and_appointments_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEESANDAPPOINTMENTS_APPOINTMENT`
    FOREIGN KEY (`appointment`)
    REFERENCES `Appointment` (`appointment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientAndEmployees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PatientAndEmployees` ;

CREATE TABLE IF NOT EXISTS `PatientAndEmployees` (
  `patient_and_employees` INT NOT NULL,
  `patient` INT NOT NULL,
  PRIMARY KEY (`patient_and_employees`),
  INDEX `FK_PATIENTANDEMPLOYEES_PATIENT_idx` (`patient` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENTANDEMPLOYEES_EMPLOYEES`
    FOREIGN KEY (`patient_and_employees`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENTANDEMPLOYEES_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AppointmentAndProcedures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppointmentAndProcedures` ;

CREATE TABLE IF NOT EXISTS `AppointmentAndProcedures` (
  `appointment` INT NOT NULL,
  `procedure` INT NOT NULL,
  INDEX `FK_APPOINTMENTANDPROCEDURES_APPOINTMENT_idx` (`appointment` ASC) VISIBLE,
  INDEX `FK_APPOINTMENTANDPROCEDURES_PROCEDURE_idx` (`procedure` ASC) VISIBLE,
  CONSTRAINT `FK_APPOINTMENTANDPROCEDURES_APPOINTMENT`
    FOREIGN KEY (`appointment`)
    REFERENCES `Appointment` (`appointment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_APPOINTMENTANDPROCEDURES_PROCEDURE`
    FOREIGN KEY (`procedure`)
    REFERENCES `Procedure` (`procedure_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientProfile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PatientProfile` ;

CREATE TABLE IF NOT EXISTS `PatientProfile` (
  `patient_profile_id` INT NOT NULL AUTO_INCREMENT,
  `Profile_profile_id` INT NOT NULL,
  PRIMARY KEY (`patient_profile_id`, `Profile_profile_id`),
  INDEX `fk_Patient Profile_Profile1_idx` (`Profile_profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient Profile_Profile1`
    FOREIGN KEY (`Profile_profile_id`)
    REFERENCES `Profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeeProfile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeeProfile` ;

CREATE TABLE IF NOT EXISTS `EmployeeProfile` (
  `employee_profile_id` INT NOT NULL AUTO_INCREMENT,
  `profile` INT NOT NULL,
  PRIMARY KEY (`employee_profile_id`, `profile`),
  INDEX `FK_EMPLOYEEPROFILE_PROFILE_idx` (`profile` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEEPROFILE_PROFILE`
    FOREIGN KEY (`profile`)
    REFERENCES `Profile` (`profile_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalAndInsurances`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HospitalAndInsurances` ;

CREATE TABLE IF NOT EXISTS `HospitalAndInsurances` (
  `hospital_and_insurances_id` INT NOT NULL AUTO_INCREMENT,
  `hospital` INT NOT NULL,
  `health_insurance` INT NULL,
  PRIMARY KEY (`hospital_and_insurances_id`),
  INDEX `FK_HOSPITALANDINSURANCES_HOSPITAL_idx` (`hospital` ASC) VISIBLE,
  INDEX `FK_HOSPITALANDINSURANCES_INSURANCE_idx` (`health_insurance` ASC) VISIBLE,
  CONSTRAINT `FK_HOSPITALANDINSURANCES_HOSPITAL`
    FOREIGN KEY (`hospital`)
    REFERENCES `Hospital` (`hospital_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_HOSPITALANDINSURANCES_INSURANCE`
    FOREIGN KEY (`health_insurance`)
    REFERENCES `HealthInsurance` (`health_insurance_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permission` ;

CREATE TABLE IF NOT EXISTS `Permission` (
  `premission_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`premission_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeesAndPermission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeesAndPermission` ;

CREATE TABLE IF NOT EXISTS `EmployeesAndPermission` (
  `employee_and_permission` INT NOT NULL AUTO_INCREMENT,
  `employee` INT NOT NULL,
  `permission` INT NOT NULL,
  PRIMARY KEY (`employee_and_permission`),
  INDEX `FK_EMPLOYEESANDPERMISSIONS_EMPLOYEE_idx` (`employee` ASC) VISIBLE,
  INDEX `FK_EMPLOYEESANDPERMISSIONS_PERMISSION_idx` (`permission` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEESANDPERMISSIONS_EMPLOYEE`
    FOREIGN KEY (`employee`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEESANDPERMISSIONS_PERMISSION`
    FOREIGN KEY (`permission`)
    REFERENCES `Permission` (`premission_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Room` ;

CREATE TABLE IF NOT EXISTS `Room` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `room_number` INT NOT NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AppointmentsAndRooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppointmentsAndRooms` ;

CREATE TABLE IF NOT EXISTS `AppointmentsAndRooms` (
  `appointment` INT NOT NULL,
  `room` INT NOT NULL,
  INDEX `FK_APPOINTMENTSANDROOMS_APPOINTMENT_idx` (`appointment` ASC) VISIBLE,
  INDEX `FK_APPOINTMENTANDROOMS_ROOM_idx` (`room` ASC) VISIBLE,
  PRIMARY KEY (`room`, `appointment`),
  CONSTRAINT `FK_APPOINTMENTSANDROOMS_APPOINTMENT`
    FOREIGN KEY (`appointment`)
    REFERENCES `Appointment` (`appointment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_APPOINTMENTANDROOMS_ROOM`
    FOREIGN KEY (`room`)
    REFERENCES `Room` (`room_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalPrescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalPrescription` ;

CREATE TABLE IF NOT EXISTS `MedicalPrescription` (
  `medical_prescription_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`medical_prescription_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PatientAndMedicalPrescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PatientAndMedicalPrescription` ;

CREATE TABLE IF NOT EXISTS `PatientAndMedicalPrescription` (
  `patient_and_medical_prescription_id` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `medical_prescription` INT NOT NULL,
  PRIMARY KEY (`patient_and_medical_prescription_id`),
  INDEX `FK_PATIENTANDMEDICALPRESCRIPTION_PATIENT_idx` (`medical_prescription` ASC) VISIBLE,
  INDEX `FK_PATIENTANDMEDICALPRESCRIPTION_PATIENT_idx1` (`patient` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENTANDMEDICALPRESCRIPTION_MEDICALPRESCRIPTION`
    FOREIGN KEY (`medical_prescription`)
    REFERENCES `MedicalPrescription` (`medical_prescription_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENTANDMEDICALPRESCRIPTION_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

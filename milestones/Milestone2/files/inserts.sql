USE HospitalManagementDB;
-- Script name: inserts.sql
-- Author: Edgar Catalan
-- Purpose: insert sample data to test the integrity of this database system


-- 1) Insert into the Hospital Table --

INSERT INTO Hospital(name, account, department, president_name, address) VALUES("Second Hospital", 2, NULL, "Lesly lastName", 3);
INSERT INTO Hospital(name, account, department, president_name, address) VALUES("Second Hospital", 2, NULL, "Lesly lastName", 2);

INSERT INTO Hospital(name, account, department, president_name, address) VALUES("First Choice Hospital", 1, NULL, "Steve Wilson", 1);



-- End of Inserting into Hospital --


-- 2) Inserting into Employee -- 


INSERT INTO EMPLOYEE (first_name, middle_name, last_name, date_of_birth, employee_profile, type, health_insurance, seniority_level) 
VALUES ("Jane", "Dory", "Jones", 10/10/1990, 1, "Physician", 1, 3);

 INSERT INTO EMPLOYEE (first_name, middle_name, last_name, date_of_birth, employee_profile, type, health_insurance, seniority_level) 
 VALUES ("Jack", "Dory", "Jones", 10/10/1990, 1, "Physician", 1, 3);

 INSERT INTO EMPLOYEE (first_name, middle_name, last_name, date_of_birth, employee_profile, type, health_insurance, seniority_level) 
 VALUES ("Jane", "Daisy", "Smith", "January 1, 1980", 3, "Physician", 2, 3);

INSERT INTO EMPLOYEE (first_name, middle_name, last_name, date_of_birth, employee_profile, type, health_insurance, seniority_level) 
VALUES ("Stephanie", "Racquel", "Steveson", "January 1, 1980", 4, "Nurse", 2, 3);

INSERT INTO EMPLOYEE (first_name, middle_name, last_name, date_of_birth, employee_profile, type, health_insurance, seniority_level) 
VALUES ("Stephanie", "Racquel", "Steveson", "January 1, 1975", 7, "Nurse", 2, 2);


-- End of Inserting Into Employee --

-- 3) Inserting into Nurse --

INSERT INTO Nurse (nurse_id, employee) VALUES (1,3);

-- End of Inserting into Nurse --



-- 4) Inserting into Doctor --

INSERT INTO DOCTOR (employee_id) VALUES (2);



-- End of Inserting into Doctor --

-- 5) Inserting into Director --

-- SELECT * FROM Director;


-- End of Insereting into Director --





-- 6) Inserting into an Address --

INSERT INTO Address(street_address, state, city, zip_code) VALUES("55 bestStreet", "CA", "Seattle", 94015);
INSERT INTO Address(street_address, state, city, zip_code) VALUES("100 secondHospitalStreet", "CA", "Fresno", 94015);
INSERT INTO Address(street_address, state, city, zip_code) VALUES("110 semployeeStreet", "CA", "Hayward", 94071);
INSERT INTO Address(street_address, state, city, zip_code) VALUES("150 employeeStreet2", "CA", "Hayward", 94071);
INSERT INTO Address(street_address, state, city, zip_code) VALUES("150 patientStreet1", "CA", "fremont", 94071);
-- SELECT * FROM Address;


-- 7) End of Inserting into an Address -- 
 

-- 8) Inserting into an EmployeeAndAddresses -- 

INSERT INTO EmployeeAndAddresses (employee, address) VALUES (1, 3), (3, 3);
INSERT INTO EmployeeAndAddresses (employee, address) VALUES (2, 4);


-- End of Inserting into an EmployeeAndAddresses --


-- 9) Account --

INSERT INTO Account(date) VALUES("2021-01-23 12:45:56");
INSERT INTO Account(date) VALUES("2021-01-23 12:45:56");
INSERT INTO Account(date) VALUES("2021-01-23 12:45:56");

-- End of Account --

-- 10) Department

INSERT INTO Department(name, hospital) VALUES ("Emergency", 1);
INSERT INTO Department(name, hospital) VALUES ("Cardiology", 1);
INSERT INTO Department(name, hospital) VALUES ("Pharmacy", 1);
INSERT INTO Department(name, hospital) VALUES ("Xrays", 1);

-- make sure to update the Hospital with the appropriate department

-- End of Department

-- 11) Insert into DepartmentAndEmployees --

-- error
-- INSERT INTO DepartmentAndEmployees (department, employee) VALUES (1, 1);
-- SELECT * FROM DepartmentAndEmployees;
-- 09:50:26	INSERT INTO DepartmentAndEmployees (department, employee) VALUES (1, 1)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`hospitalmanagementdb`.`departmentandemployees`, CONSTRAINT `FK_DEPARTMENTANDEMPLOYEES_DEPARTMENT` FOREIGN KEY (`department`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPD)	0.0085 sec


-- End of Insert into DepartmentAndEmployees --



-- 12) Insert INTO Seniority Level --

 
INSERT INTO SeniorityLevel (title, description) VALUES ("Pre-Med", "Permissions given to Pre-Med Employees");
INSERT INTO SeniorityLevel (title, description) VALUES ("Director", "Permissions given to Directors");
INSERT INTO SeniorityLevel (title, description) VALUES ("Physicians", "Permissions given to Physicians");
INSERT INTO SeniorityLevel (title, description) VALUES ("Supervisor", "Permissions for supervisors");




-- End of Seniority Level --

-- 13) Inserting into Health Insurance -- 

INSERT INTO HealthInsurance (type) VALUES("Kaiser Foundation");
INSERT INTO HealthInsurance (type) VALUES("Blue Cross");
INSERT INTO HealthInsurance (type) VALUES("Anthem");
INSERT INTO HealthInsurance (type) VALUES ("testInsurance");


-- End of Inserting into Health Insurance --


-- 14) Inserting into Profile -- 

INSERT INTO Profile (type) VALUES ("Employee Profile");
-- SELECT * FROM PatientProfile;

INSERT INTO EmployeeProfile(profile) VALUES (7);

INSERT INTO Profile(type) VALUES ("Patient Profile");
INSERT INTO PatientProfile (Profile_profile_id) VALUES (8);

-- SELECT * FROM EmployeeProfile;

-- End of Inserting into Profile --



-- 15) Inserting Into Permission --

INSERT INTO Permission (type) VALUES ("Director Permission");
INSERT INTO Permission (type) VALUES ("Physician Permission");
INSERT INTO Permission (type) VALUES ("Pre-Med Permission");
INSERT INTO Permission (type) VALUES ("Some permission");



-- End of Inserting Into Permission --


-- 16) Insert Into Medical Prescription -- 

INSERT INTO MedicalPrescription (type, date, description) VALUES ("Anti Depressant","2021-01-23 12:45:56","For patients with demantia");
INSERT INTO MedicalPrescription (type, date, description) VALUES ("Benzodiazepines","2021-01-7 12:45:56","For patients with insomnia");
INSERT INTO MedicalPrescription (type, date, description) VALUES ("Mood Stabalizers","2021-01-10 12:45:56","For patients with bipolar disorders");

INSERT INTO MedicalPrescription (type, date, description) VALUES ("No Medication","2021-01-10 12:45:56","For patients that don't require medication");
INSERT INTO MedicalPrescription (type, date, description) VALUES ("Pain killers","2021-01-10 12:45:56","Reduce pain");


-- End of Insert Into Medical Prescription -- 

-- 17) Inserting into Room --

INSERT INTO Room (room_number) VALUES (10);
INSERT INTO Room (room_number) VALUES (11);
INSERT INTO Room (room_number) VALUES (12);
INSERT INTO Room (room_number) VALUES (14);


-- End of Inserting into Room -- 

-- 18) Insert into Medical Record --

INSERT INTO MedicalRecord (description) VALUES ("belongs to patient_id=1");
INSERT INTO MedicalRecord (description) VALUES ("belongs to patient_id=2");
INSERT INTO MedicalRecord (description) VALUES ("belongs to patient_id=3");
-- INSERT INTO MedicalRecord (description) VALUES ("belongs to patient_id=4"); -- change patient_id=5
-- SELECT * FROM MedicalRecord;

-- End of Inserting into Medical Record --

-- 19) Inserting into Patient --


INSERT INTO Patient (first_name, middle_name, last_name, patient_profile, health_insurance, medical_record) VALUES ("Lisa", "Stephany", "Bates", 2, 1, 1);
INSERT INTO Patient (first_name, middle_name, last_name, patient_profile, health_insurance, medical_record) VALUES ("Patient2", "middleName", "patient2LastN", 5, 2, 2);
INSERT INTO Patient (first_name, middle_name, last_name, patient_profile, health_insurance, medical_record) VALUES ("Patient2", "middleName", "patient2LastN", 6, 2, 2);
INSERT INTO Patient (first_name, middle_name, last_name, patient_profile, health_insurance, medical_record) VALUES ("Patient4", "middleName", "patient4LastN", 8, 2, 2);


-- End of Inserting into Patient --

-- 20) Inserting into Procedures -- 

-- error
-- INSERT INTO Procedure (type, description) VALUES ("Physical", "This Procedure is a simple appointment that requires height, wiegth, blood pressure, and heart rate test");
-- 07:42:51	SELECT * FROM Procedures LIMIT 0, 1000	Error Code: 1146. Table 'hospitalmanagementdb.procedures' doesn't exist	0.0011 sec


-- End of Inserting into Procedures --


-- 21) Inserting into Emergency Contact --

INSERT INTO EmergencyContact (first_name, middle_name, last_name, relationship) VALUES ("Person1", "middleName", "lastName", "Female working from home");


-- End of Inserting into Emergency Contact --


-- 22) Inserting into EmergencyContactAndPatient --

-- error
-- INSERT INTO EmergencyContactAndPatient (emergency_contact, patient) VALUES (1,1);



-- End of Inserting into EmergencyContactAndPatient --


-- 23) Inserting into Appointment --

INSERT INTO Appointment (date, description) VALUES ("2021-01-23 12:45:56", "An appointment for a physical check up");
INSERT INTO Appointment (date, description) VALUES ("2021-02-23 12:45:56", "An appointment for throat infection"), ("2021-02-23 12:45:56", "An appointment for heavy breathing");



-- end of inserting into Appointment --


-- 24) Inserting into AppointmentAndPatient --

INSERT into AppointmentAndPatient (patient, appointment) VALUES (1, 1);


-- End of Inserting into AppointmentAndPatient --

-- 25) Inserting into AppointmentAndRooms --

INSERT INTO AppointmentsAndRooms (appointment, room) VALUES (1,1);


-- End of Inserting into AppointmentAndRooms --



-- 26) Insert into EmergencyContactAndPatient --

INSERT INTO EmergencyContactAndPatient (emergency_contact, patient) VALUES (1, 1);


-- End of Insert into EmergencyContactAndPatient --

-- 27) Insert into EmployeesAndAppointments --


-- SELECT * FROM EmployeesAndAppointments;

INSERT INTO EmployeesAndAppointments (employees_and_appointments_id, appointment) VALUES (1,1);


-- End of Insert into EmployeesAndAppointents --

-- 28) Inserting into EmployeesAndPermission --


INSERT INTO EmployeesAndPermission (employee, permission) VALUES (1,2);


-- End of Inserting into EmployeesAndPermission -- 

-- 29) Insert into EmployeeAndProcedures --
-- error

-- end of Insert into EmployeeAndProcedures --

-- 30) Insert into HospitalAndEmployees -- 

INSERT INTO HospitalAndEmployees (hospital, employee) VALUES (1,1);


-- End of Insert into HospitalAndEmployees -- 

-- 31) Insert into HospitalAndInsurances --


INSERT INTO HospitalAndInsurances (hospital, health_insurance) VALUES (1, 1), (1,2), (1,3);


-- End of Insert into HospitalAndInsurances --


-- 32) Insert into HospitalAndPatients --

-- update the date of this first one
INSERT INTO HosptialAndPatients (hospital, patient) VALUES (1,1);



-- End of Insert into HospitalAndPatients --

-- 33) PatientAndAddresses --

INSERT INTO PatientAndAddresses (patient, address) VALUES (1,5);
-- SELECT * FROM PatientAndAddresses;


-- End of PatientAndAddresses --


-- 34) PatientAndEmployees --

INSERT INTO PatientAndEmployees (patient_and_employees, patient) VALUE (1, 1), (3,1);
INSERT INTO PatientAndEmployees (patient_and_employees, patient) VALUES(4,1);


-- End of PatientAndEmployees --

-- 35) PatientAndMedicalPrescription --

INSERT INTO PatientAndMedicalPrescription (patient, medical_prescription) VALUES (1,4);


-- End of PatientAndMedicalPrescription --


-- 36) Phone Number --

INSERT INTO PhoneNumber (number) VALUES (7556754);
INSERT INTO PhoneNumber (number) VALUES (55343342), (66763537), (4345342);
-- SELECT * FROM PhoneNumber;


-- End of Phone Number --

-- 37) Insert into PatientAndPhoneNumbers --

INSERT INTO PatientAndPhoneNumbers (patient, phone_number) VALUES (1,1), (1,2), (1,3);


-- End of Insert into PatientAndPhoneNumbers --








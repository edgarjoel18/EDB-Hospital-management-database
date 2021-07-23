       -- Script name: tests.sql
       -- Author:      Edgar Catalan
       -- Purpose:     test the integrity of this database system
       
       -- the database used to insert the data into.
       USE HospitalManagementDB;
       SET SQL_SAFE_UPDATES = 0;
       
       -- 1. Testing Hospital
       UPDATE Hospital SET president_name = "Nancy Farrel" WHERE hospital_id = 3;
      -- Delete does not delete from Hospital table
	  -- DELETE FROM Hospital WHERE hosptial_id = 2;
       
       
       -- 2. Testing Employee
       UPDATE Employee SET first_name = "Drew" WHERE employee_id = 2;
       DELETE FROM Employee WHERE employee_id = 2;
       
       
       -- 3) Testing Address
       UPDATE Address SET zip_code = '94017' WHERE address_id = 4;
	   DELETE FROM Address WHERE address_id = 4;
		
	  -- 4) Testing Appointment
		 UPDATE Appointment SET description = "Heavy breathing and anxiety" WHERE appointment_id = 3;
         DELETE FROM Appointment WHERE appointment_id = 3;

	  -- 5) Testing Department 
			UPDATE Department SET name = "Radiology" WHERE department_id = 4;
            DELETE FROM Department WHERE department_id = 5;
            
	  -- 6) Testing HealthInsurance
			UPDATE HealthInsurance SET type = "testInsurance2" WHERE health_insurance_id = 4;
            DELETE FROM HealthInsurance WHERE health_insurance_id = 4;
            
	  -- 7) Testing Medical Prescription
			UPDATE MedicalPrescription SET description = "For patients to reduce pain" WHERE medical_prescription_id = 5;
			DELETE FROM MedicalPrescription WHERE medical_prescription_id = 5;
            
	  -- 8) Testing Medical Record 
		    UPDATE MedicalRecord SET description = "belongs to someone" WHERE medical_record_id = 4;
			DELETE FROM MedicalRecord WHERE medical_record_id = 4;
	  
      -- 9) Testing Patient 
			UPDATE Patient SET middle_name = "middleName4" WHERE patient_id = 4;
            DELETE FROM Patient WHERE patient_id = 4;
            
	  -- 10) Testing Permission
			UPDATE Permission SET type = "some permission again" WHERE premission_id = 4;
            DELETE FROM Permission WHERE premission_id = 4;
            
	  -- 11) Testing PhoneNumber
			UPDATE PhoneNumber SET number = 5 WHERE phone_number_id = 4;
            DELETE FROM PhoneNumber WHERE phone_number_id = 4;
            
	  -- 12) Testing Profile
             DELETE FROM PatientProfile WHERE patient_profile_id = 2;
             
      -- 13) Testing Room
			UPDATE Room SET room_number = 15 WHERE room_id = 4;
            DELETE FROM Room WHERE room_id = 4;
	 
      -- 14) Testing SeniorityLevel
			UPDATE SeniorityLevel SET description = "new supervisor description" WHERE seniority_level_id = 4;
			DELETE FROM SeniorityLevel WHERE seniority_level_id = 4;


		-- Triggers 
        



















       
    
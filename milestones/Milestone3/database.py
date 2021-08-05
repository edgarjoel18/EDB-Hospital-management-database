# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

# your code here
# mysql_cursor = pymysql.cursors.Cursor

# fix this really quick

# async def get_patients_with_most_prescriptions(db_conn):
#   curr = db_conn.cursor()
#   query = "SELECT "

async def problem1(db_conn):
  # tables: Patient, Medical Prescription 
  curr = db_conn.cursor()
  query = "SELECT MP.patient, MP.medical_prescription, P.first_name, P.last_name FROM PatientAndMedicalPrescription MP, Patient P WHERE P.patient_id = MP.patient GROUP BY MP.patient, MP.medical_prescription";
  curr.execute(query)
  results = curr.fetchall()
  temp = []
  for result in results:
    temp.append(result['first_name'] + ", " + result['last_name'] + ": " + str(result['medical_prescription']))
  return temp

async def problem2(db_conn):
  curr = db_conn.cursor()
  query = "SELECT E.first_name, E.middle_name, E.last_name FROM Employee E WHERE E.type='Nurse'"
  curr.execute(query)
  results = curr.fetchall()
  temp = []
  for result in results:
    temp.append(result)
  return temp



async def problem3(db_conn, string):
  # tables Doctors, EmployeesAndAddresses, Addresses
  string_split = string.split(" ")
  results = helper3(db_conn, int(string_split[5]))
  if len(results) > 0:
    return results
  return "No results found"


async def helper3(db_conn, zip_code):
  curr = db_conn.cursor()
  query = "SELECT Employee.name AS 'Name', Address.zip_code AS 'Zipcode' FROM Employee, Address, EmployeeAndAddresses WHERE Employee.employee_id=Employee.employee AND Address.address_id=EmployeeAndAddresses.address AND Address.zip_code = %i"
  curr.execute(query, (zip_code, ) )
  curr.commit()
  results = curr.fetchall()
  temp = []
  for result in results:
    temp2 = []
    temp2.append(result['Name'])
    temp2.append(result['Zipcode'])
    temp.append(temp2)
  return temp

async def problem4(db_conn):
  curr = db_conn.cursor()
  query = "SELECT a.date, a.description FROM Appointment a WHERE a.appointment_id=1"
  curr.execute(query)
  results = curr.fetchall()
  temp = []
  for result in results:
    temp.append(result)
  return temp



async def problem6(db_conn):
  curr = db_conn.cursor()
  query = "SELECT p.patient_profile_id FROM PatientProfile p, MedicalRecord mr WHERE p.patient_profile_id=1 AND mr.medical_record_id=1"
  curr.execute(query)
  results = curr.fetchall()
  temp = []
  for result in results:
    temp.append(result['patient_profile_id'])
  query2 = "SELECT p.first_name, p.last_name FROM Patient p WHERE p.patient_id = 2"
  curr.execute(query2)
  results2 = curr.fetchall()
  for result in results2:
    temp.append(result['first_name'])
    temp.append(result['last_name'])
  return temp

async def problem7(db_conn, string):
  curr = db_conn.cursor()
  string_split = string.split(" ")
  first_name = string_split[1]
  middle_name = string_split[2]
  last_name = string_split[3]
  query = "INSERT INTO Patient (first_name, middle_name, last_name, patient_profile, healthInsurance, medical_record) VALUES (%s, %s, %s, 9, 2, 4)"

  curr.execute(query, (first_name, middle_name, last_name) )
  curr.commit()
  results = curr.fetchall()
  temp = []
  for result in results:
    temp.append(result)
  return temp


async def problem8(db_conn):
  curr = db_conn.cursor()
  query = "SELECT ea.employee FROM EmployeeAndAddresses ea WHERE ea.address = 3"
  curr.execute(query)
  results = curr.fetchall()
  temp = []
  for result in results:
    temp.append(result['employee'])
  
  newquery = "SELECT e.first_name, e.last_name FROM Employee e WHERE e.employee_id=1 OR e.employee_id=3"
  curr.execute(newquery)
  results2 = curr.fetchall()
  newTemp = []
  for i in results2:
    newTemp.append(i['first_name'])
    newTemp.append(i['last_name'])

  return newTemp

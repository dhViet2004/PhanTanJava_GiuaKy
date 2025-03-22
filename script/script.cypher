CREATE CONSTRAINT department_id_unique IF NOT EXISTS
FOR (d:Department)
REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT doctor_id_unique IF NOT EXISTS
FOR (d:Doctor)
REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT patient_id_unique IF NOT EXISTS
FOR (p:Patient)
REQUIRE p.id IS UNIQUE;
SHOW INDEXES;

// Load Departments
LOAD CSV WITH HEADERS FROM 'file:///hospital/departments.csv' AS row
MERGE (d:Department {id: row.id})
SET d.name = row.name,
d.location = row.location;

// Load Doctors
LOAD CSV WITH HEADERS FROM 'file:///hospital/doctors.csv' AS row
WITH row WHERE row.ID IS NOT NULL
MERGE (d:Doctor {id: row.ID})
SET d.name = row.Name,
d.phone = row.Phone,
d.speciality = row.Speciality
WITH d, row
MATCH (dept:Department {id: row.DepartmentID})
MERGE (d)-[:BELONGS_TO]->(dept);

// Load Patients (Chuyển DateOfBirth thành kiểu DATE)
LOAD CSV WITH HEADERS FROM 'file:///hospital/patients.csv' AS row
MERGE (p:Patient {id: row.ID})
SET p.name = row.Name,
p.phone = row.Phone,
p.gender = row.Gender,
p.dateOfBirth = row.DateOfBirth,
p.address = row.Address;

LOAD CSV WITH HEADERS FROM 'file:///hospital/treatments.csv' AS row
MATCH (d:Doctor {id: row.DoctorID})
MATCH (p:Patient {id: row.PatientID})
MERGE (p)-[r:BE_TREATED]->(d)
SET r.startDate = row.StartDate,
r.endDate = row.EndDate,
r.diagnosis = row.Diagnosis;

MATCH (n)
DETACH DELETE n
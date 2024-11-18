FARMACY MANAGEMENT SYSTEM
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE Medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    manufacturer VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    date_prescribed DATE,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Pharmacies (
    pharmacy_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE Pharmacists (
    pharmacist_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    pharmacy_id INT,
    phone VARCHAR(15),
    email VARCHAR(50),
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
    medication_id INT,
    quantity INT,
    last_updated DATE,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_id INT,
    pharmacist_id INT,
    date_sold DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (pharmacist_id) REFERENCES Pharmacists(pharmacist_id)
);




-- Insert values into Patients table
INSERT INTO Patients (first_name, last_name, dob, address, phone, email) VALUES
('John', 'Doe', '1985-01-15', '123 Main St', '555-1234', 'johndoe@example.com'),
('Jane', 'Smith', '1990-05-22', '456 Elm St', '555-5678', 'janesmith@example.com');

-- Insert values into Doctors table
INSERT INTO Doctors (first_name, last_name, specialization, phone, email) VALUES
('Alice', 'Johnson', 'Cardiology', '555-8765', 'alicejohnson@example.com'),
('Bob', 'Brown', 'Neurology', '555-4321', 'bobbrown@example.com');

-- Insert values into Medications table
INSERT INTO Medications (name, description, manufacturer, price) VALUES
('Aspirin', 'Pain reliever and anti-inflammatory', 'Pharma Inc.', 5.99),
('Lipitor', 'Cholesterol-lowering medication', 'MedCo', 89.99);

-- Insert values into Prescriptions table
INSERT INTO Prescriptions (patient_id, doctor_id, date_prescribed, total_cost) VALUES
(1, 1, '2024-06-01', 50.00),
(2, 2, '2024-06-02', 80.00);

-- Insert values into Pharmacies table
INSERT INTO Pharmacies (name, location, phone, email) VALUES
('Health Pharmacy', '789 Oak St', '555-6789', 'healthpharmacy@example.com'),
('Care Pharmacy', '101 Pine St', '555-9876', 'carepharmacy@example.com');

-- Insert values into Pharmacists table
INSERT INTO Pharmacists (first_name, last_name, pharmacy_id, phone, email) VALUES
('Emily', 'White', 1, '555-1111', 'emilywhite@example.com'),
('Michael', 'Green', 2, '555-2222', 'michaelgreen@example.com');

-- Insert values into Inventory table
INSERT INTO Inventory (pharmacy_id, medication_id, quantity, last_updated) VALUES
(1, 1, 100, '2024-06-01'),
(2, 2, 50, '2024-06-01');

-- Insert values into Sales table
INSERT INTO Sales (prescription_id, pharmacist_id, date_sold, total_price) VALUES
(1, 1, '2024-06-03', 50.00),
(2, 2, '2024-06-04', 80.00);

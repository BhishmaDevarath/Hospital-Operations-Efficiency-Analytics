-- Database Set-Up
CREATE DATABASE HospitalOpsDB;
GO

USE HospitalOpsDB;
GO

-- Table Creation
CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY,
    HospitalName NVARCHAR(100),
    Region NVARCHAR(50),
    City NVARCHAR(50),
    NumBeds INT,
    AccreditationStatus NVARCHAR(50),
    OwnershipType NVARCHAR(50)
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
    DeptName NVARCHAR(100),
    Capacity INT,
    Specialty NVARCHAR(50)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID),
    Role NVARCHAR(50),
    ExperienceYears INT,
    Salary DECIMAL(18,2),
    Status NVARCHAR(20)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Gender NVARCHAR(10),
    Age INT,
    City NVARCHAR(50),
    InsuranceProvider NVARCHAR(50)
);

CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID),
    AdmissionDate DATE,
    DischargeDate DATE,
    LengthOfStay INT,
    AdmissionType NVARCHAR(50),
    Outcome NVARCHAR(50),
    ReadmissionFlag INT
);

CREATE TABLE Surgeries (
    SurgeryID INT PRIMARY KEY,
    AdmissionID INT FOREIGN KEY REFERENCES Admissions(AdmissionID),
    SurgeonID INT FOREIGN KEY REFERENCES Staff(StaffID),
    SurgeryType NVARCHAR(100),
    SurgeryDate DATE,
    DurationMinutes INT,
    Outcome NVARCHAR(50),
    ComplicationFlag INT
);

CREATE TABLE ResourceUtilizationSnapshots (
    SnapshotID INT PRIMARY KEY,
    HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID),
    SnapshotDate DATE,
    BedOccupancyRate DECIMAL(5,2),
    EquipmentUtilizationRate DECIMAL(5,2),
    StaffUtilizationRate DECIMAL(5,2),
    ERWaitTimeMinutes INT
);

CREATE TABLE Financials (
    RecordID INT PRIMARY KEY,
    HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID),
    MonthStart DATE,
    TotalCost DECIMAL(18,2),
    BilledAmount DECIMAL(18,2),
    InsuranceCoveragePct DECIMAL(5,2),
    ProfitMargin DECIMAL(5,2)
);
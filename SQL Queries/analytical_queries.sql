-- Basic Validation Queries
-- 1. Row count check
SELECT 
    (SELECT COUNT(*) FROM Hospitals) AS TotalHospitals,
    (SELECT COUNT(*) FROM Departments) AS TotalDepartments,
    (SELECT COUNT(*) FROM Staff) AS TotalStaff,
    (SELECT COUNT(*) FROM Patients) AS TotalPatients,
    (SELECT COUNT(*) FROM Admissions) AS TotalAdmissions,
    (SELECT COUNT(*) FROM Surgeries) AS TotalSurgeries,
    (SELECT COUNT(*) FROM ResourceUtilizationSnapshots) AS TotalSnapshots,
    (SELECT COUNT(*) FROM Financials) AS TotalFinancials;

-- 2. Foreign key consistency
SELECT COUNT(*) AS OrphanDeptHospitals
FROM Departments d LEFT JOIN Hospitals h ON d.HospitalID = h.HospitalID
WHERE h.HospitalID IS NULL;

SELECT COUNT(*) AS OrphanStaffDept
FROM Staff s LEFT JOIN Departments d ON s.DeptID = d.DeptID
WHERE d.DeptID IS NULL;

SELECT COUNT(*) AS OrphanAdmissionsPatients
FROM Admissions a LEFT JOIN Patients p ON a.PatientID = p.PatientID
WHERE p.PatientID IS NULL;

-- 3. Date logic check
SELECT TOP 10 *
FROM Admissions
WHERE DischargeDate < AdmissionDate;

-- 4. Range sanity check (Occupancy / Utilization rates)
SELECT 
    MIN(BedOccupancyRate) AS MinBedOcc, MAX(BedOccupancyRate) AS MaxBedOcc,
    MIN(EquipmentUtilizationRate) AS MinEquipUtil, MAX(EquipmentUtilizationRate) AS MaxEquipUtil
FROM ResourceUtilizationSnapshots;

-- Analytical EDA Queries
-- 1. Hospital overview
SELECT 
    Region, 
    COUNT(DISTINCT HospitalID) AS NumHospitals,
    SUM(NumBeds) AS TotalBeds,
    AVG(NumBeds) AS AvgBeds
FROM Hospitals
GROUP BY Region;

-- 2. Staff composition
SELECT 
    Role, 
    COUNT(*) AS NumStaff, 
    AVG(ExperienceYears) AS AvgExp, 
    AVG(Salary) AS AvgSalary
FROM Staff
GROUP BY Role;

-- 3. Patient demographics
SELECT 
    Gender, 
    COUNT(*) AS CountPatients, 
    AVG(Age) AS AvgAge
FROM Patients
GROUP BY Gender;

-- 4. Admissions by outcome
SELECT 
    Outcome, 
    COUNT(*) AS NumAdmissions,
    AVG(LengthOfStay) AS AvgLOS
FROM Admissions
GROUP BY Outcome;

-- 5. Readmission rate
SELECT 
    CAST(SUM(CASE WHEN ReadmissionFlag=1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS ReadmissionRatePct
FROM Admissions;

-- 6. Surgery efficiency
SELECT 
    Outcome, 
    COUNT(*) AS NumSurgeries,
    AVG(DurationMinutes) AS AvgDuration,
    CAST(SUM(CASE WHEN ComplicationFlag=1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS ComplicationRate
FROM Surgeries
GROUP BY Outcome;

-- 7. Resource utilization
SELECT 
    ROUND(AVG(BedOccupancyRate)*100,2) AS AvgBedOccupancyPct,
    ROUND(AVG(EquipmentUtilizationRate)*100,2) AS AvgEquipUtilPct,
    ROUND(AVG(StaffUtilizationRate)*100,2) AS AvgStaffUtilPct,
    ROUND(AVG(ERWaitTimeMinutes),1) AS AvgERWait
FROM ResourceUtilizationSnapshots;

-- 8. Financial performance
SELECT 
    AVG(InsuranceCoveragePct) AS AvgInsuranceCoverage,
    AVG(ProfitMargin) AS AvgProfitMargin
FROM Financials;
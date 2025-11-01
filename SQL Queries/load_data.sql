-- Bulk Insert in Tables
BULK INSERT Hospitals
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Hospitals.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT Departments
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Departments.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT Staff
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Staff.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT Patients
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Patients.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT Admissions
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Admissions.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT Surgeries
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Surgeries.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT ResourceUtilizationSnapshots
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\ResourceUtilizationSnapshots.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT Financials
FROM 'D:\Hospital Operations Efficiency & Utilization\DataSet\Financials.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
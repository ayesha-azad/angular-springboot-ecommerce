USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'angularspringbootecommerce')
BEGIN
    CREATE DATABASE angularspringbootecommerce;
    PRINT 'Database angularspringbootecommerce created successfully.';
END
ELSE
BEGIN
    PRINT 'Database angularspringbootecommerce already exists.';
END
GO
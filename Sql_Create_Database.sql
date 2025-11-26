-- Bảng Countries
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100),
    CountryCode VARCHAR(10)
);

-- Bảng Cities
CREATE TABLE Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(100),
    Zipcode VARCHAR(20),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

-- Bảng Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Bảng Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleInitial VARCHAR(5),
    LastName VARCHAR(50),
    BirthDate DATETIME,
    Gender CHAR(1),
    CityID INT,
    HireDate DATETIME,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

-- Bảng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(200),
    Price DECIMAL(10,4),
    CategoryID INT,
    Class VARCHAR(50),
    ModifyDate DATETIME,
    Resistant VARCHAR(50),
    IsAllergic VARCHAR(50),
    VitalityDays DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Bảng Customers (do file quá lớn nên chỉ định nghĩa cơ bản)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(200),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

-- Bảng Sales
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    SalesPersonID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(5,2),
    TotalPrice DECIMAL(12,2),
    SalesDate DATETIME,
    TransactionNumber VARCHAR(50),
    FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

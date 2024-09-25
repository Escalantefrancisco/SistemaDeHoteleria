CREATE DATABASE HotelManagement;
GO

USE HotelManagement;
GO


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    frequent_customer BIT DEFAULT 0
);


CREATE TABLE Room (
    room_id INT PRIMARY KEY IDENTITY,
    room_type VARCHAR(20),
    price_per_night DECIMAL(10, 2),
    max_adults INT,
    max_children INT,
    is_reserved BIT DEFAULT 0,
    is_in_use BIT DEFAULT 0
);


CREATE TABLE ConventionRoom (
    room_id INT PRIMARY KEY IDENTITY,
    name VARCHAR(50),
    capacity INT,
    is_reserved BIT DEFAULT 0
);


CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY IDENTITY,
    customer_id INT FOREIGN KEY REFERENCES Customer(customer_id),
    reservation_date DATETIME,
    check_in_date DATETIME,
    check_out_date DATETIME,
    total_cost DECIMAL(10, 2),
    status VARCHAR(20)
);


CREATE TABLE ReservationDetails (
    reservation_detail_id INT PRIMARY KEY IDENTITY,
    reservation_id INT FOREIGN KEY REFERENCES Reservation(reservation_id),
    room_id INT,
    price_per_night DECIMAL(10, 2),
    number_of_nights INT,
    total_cost DECIMAL(10, 2),
    CONSTRAINT FK_Room FOREIGN KEY (room_id) REFERENCES Room(room_id)
);
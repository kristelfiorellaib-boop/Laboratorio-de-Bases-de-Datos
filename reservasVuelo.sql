CREATE DATABASE reservasVuelo
use reservasVuelo

CREATE TABLE Aerolinea (
    Id_Aerolinea INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Siglas_Aero CHAR(3) NULL, 
    Pais VARCHAR(30) NOT NULL
);

CREATE TABLE Pasajero (
    Id_Pasajero INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Pasaporte VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NULL,
    Telefono VARCHAR(15) NULL
);

CREATE TABLE Vuelo (
    Id_Vuelo INT PRIMARY KEY,
    Origen VARCHAR(3) NOT NULL,
    Destino VARCHAR(3) NOT NULL,
    Fecha_Salida DATE NOT NULL,
    Hora_Salida TIME NOT NULL,
    Id_Aerolinea INT NOT NULL,
    FOREIGN KEY (Id_Aerolinea) REFERENCES Aerolinea(Id_Aerolinea)
);

CREATE TABLE Reserva (
    Id_Reserva INT PRIMARY KEY,
    Fecha_Reserva DATE NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    Id_Pasajero INT NOT NULL,
    Id_Vuelo INT NOT NULL,
    FOREIGN KEY (Id_Pasajero) REFERENCES Pasajero(Id_Pasajero),
    FOREIGN KEY (Id_Vuelo) REFERENCES Vuelo(Id_Vuelo)
);

CREATE TABLE Asiento (
    Id_Asiento INT PRIMARY KEY,
    Numero_Asiento VARCHAR(5) NOT NULL,
    Clase VARCHAR(20) NOT NULL,
    Id_Vuelo INT NOT NULL,
    Id_Reserva INT NULL,
    FOREIGN KEY (Id_Vuelo) REFERENCES Vuelo(Id_Vuelo),
    FOREIGN KEY (Id_Reserva) REFERENCES Reserva(Id_Reserva)
);

CREATE TABLE Pago (
    Id_Pago INT PRIMARY KEY,
    Monto DECIMAL(10, 2) NOT NULL,
    Metodo_Pago VARCHAR(20) NOT NULL,
    Fecha_Pago DATE NOT NULL,
    Id_Reserva INT NOT NULL,
    FOREIGN KEY (Id_Reserva) REFERENCES Reserva(Id_Reserva)
);
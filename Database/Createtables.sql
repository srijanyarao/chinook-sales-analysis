CREATE TABLE Artist (
    ArtistId INTEGER PRIMARY KEY,
    Name NVARCHAR(120)
);


CREATE TABLE Album (
    AlbumId INTEGER PRIMARY KEY,
    Title NVARCHAR(160),
    ArtistId INTEGER,
    FOREIGN KEY (ArtistId) REFERENCES Artist (ArtistId)
);

CREATE TABLE Track (
    TrackId INTEGER PRIMARY KEY,
    Name NVARCHAR(200),
    AlbumId INTEGER,
    MediaTypeId INTEGER,
    GenreId INTEGER,
    Composer NVARCHAR(220),
    Milliseconds INTEGER,
    Bytes INTEGER,
    UnitPrice NUMERIC,
    FOREIGN KEY (AlbumId) REFERENCES Album (AlbumId),
    FOREIGN KEY (MediaTypeId) REFERENCES MediaType (MediaTypeId),
    FOREIGN KEY (GenreId) REFERENCES Genre (GenreId)
);

CREATE TABLE MediaType (
    MediaTypeId INTEGER PRIMARY KEY,
    Name NVARCHAR(200)
);

CREATE TABLE Genre (
    GenreId INTEGER PRIMARY KEY,
    Name NVARCHAR(120)
);

CREATE TABLE Playlist (
    PlaylistId INTEGER PRIMARY KEY,
    Name NVARCHAR(120)
);

CREATE TABLE PlaylistTrack (
    PlaylistId INTEGER,
    TrackId INTEGER,
    PRIMARY KEY (PlaylistId, TrackId),
    FOREIGN KEY (PlaylistId) REFERENCES Playlist (PlaylistId),
    FOREIGN KEY (TrackId) REFERENCES Track (TrackId)
);

CREATE TABLE Employee (
    EmployeeId INTEGER PRIMARY KEY,
    LastName NVARCHAR(20),
    FirstName NVARCHAR(20),
    Title NVARCHAR(30),
    ReportsTo INTEGER,
    BirthDate DATETIME,
    HireDate DATETIME,
    Address NVARCHAR(70),
    City NVARCHAR(40),
    State NVARCHAR(40),
    Country NVARCHAR(40),
    PostalCode NVARCHAR(10),
    Phone NVARCHAR(24),
    Fax NVARCHAR(24),
    Email NVARCHAR(60),
    FOREIGN KEY (ReportsTo) REFERENCES Employee (EmployeeId)
);

CREATE TABLE Customer (
    CustomerId INTEGER PRIMARY KEY,
    FirstName NVARCHAR(40),
    LastName NVARCHAR(20),
    Company NVARCHAR(80),
    Address NVARCHAR(70),
    City NVARCHAR(40),
    State NVARCHAR(40),
    Country NVARCHAR(40),
    PostalCode NVARCHAR(10),
    Phone NVARCHAR(24),
    Fax NVARCHAR(24),
    Email NVARCHAR(60),
    SupportRepId INTEGER,
    FOREIGN KEY (SupportRepId) REFERENCES Employee (EmployeeId)
);

CREATE TABLE Invoice (
    InvoiceId INTEGER PRIMARY KEY,
    CustomerId INTEGER,
    InvoiceDate DATETIME,
    BillingAddress NVARCHAR(70),
    BillingCity NVARCHAR(40),
    BillingState NVARCHAR(40),
    BillingCountry NVARCHAR(40),
    BillingPostalCode NVARCHAR(10),
    Total NUMERIC,
    FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
);

CREATE TABLE InvoiceLine (
    InvoiceLineId INTEGER PRIMARY KEY,
    InvoiceId INTEGER,
    TrackId INTEGER,
    UnitPrice NUMERIC,
    Quantity INTEGER,
    FOREIGN KEY (InvoiceId) REFERENCES Invoice (InvoiceId),
    FOREIGN KEY (TrackId) REFERENCES Track (TrackId)
);
CREATE DATABASE db_library;
USE db_library;

-- Create Tables
CREATE TABLE LIBRARY_BRANCH(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOKS(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS(
	BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES(
	BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOK_LOANS(
	BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT NOT NULL FOREIGN KEY REFERENCES BORROWER(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE BORROWER(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

-- Populate Tables
INSERT INTO LIBRARY_BRANCH -- At Least 4
	(BranchName, Address)
	VALUES
	('Sharpstown', 'bAddress 1'),
	('Central', 'bAddress 2'),
	('Branch 3', 'bAddress 3'),
	('Branch 4', 'bAddress 4')
;
SELECT * FROM LIBRARY_BRANCH;

INSERT INTO PUBLISHER -- Should be 20
	(PublisherName, Address, Phone)
	VALUES
	('Publisher 1', 'pAddress 1', 'pPhone 1'),
	('Publisher 2', 'pAddress 2', 'pPhone 2'),
	('Publisher 3', 'pAddress 3', 'pPhone 3'),
	('Publisher 4', 'pAddress 4', 'pPhone 4'),
	('Publisher 5', 'pAddress 5', 'pPhone 5'),
	('Publisher 6', 'pAddress 6', 'pPhone 6'),
	('Publisher 7', 'pAddress 7', 'pPhone 7'),
	('Publisher 8', 'pAddress 8', 'pPhone 8'),
	('Publisher 9', 'pAddress 9', 'pPhone 9'),
	('Publisher 10', 'pAddress 10', 'pPhone 10'),
	('Publisher 11', 'pAddress 11', 'pPhone 11'),
	('Publisher 12', 'pAddress 12', 'pPhone 12'),
	('Publisher 13', 'pAddress 13', 'pPhone 13'),
	('Publisher 14', 'pAddress 14', 'pPhone 14'),
	('Publisher 15', 'pAddress 15', 'pPhone 15'),
	('Publisher 16', 'pAddress 16', 'pPhone 16'),
	('Publisher 17', 'pAddress 17', 'pPhone 17'),
	('Publisher 18', 'pAddress 18', 'pPhone 18'),
	('Publisher 19', 'pAddress 19', 'pPhone 19'),
	('Publisher 20', 'pAddress 20', 'pPhone 20')
;
SELECT * FROM PUBLISHER;

INSERT INTO BOOKS -- Should be 20
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Publisher 1'),
	('The Plague Race', 'Publisher 2'),
	('It', 'Publisher 3'),
	('The Shining', 'Publisher 4'),
	('Book Title 5', 'Publisher 5'),
	('Book Title 6', 'Publisher 6'),
	('Book Title 7', 'Publisher 7'),
	('Book Title 8', 'Publisher 8'),
	('Book Title 9', 'Publisher 9'),
	('Book Title 10', 'Publisher 10'),
	('Book Title 11', 'Publisher 11'),
	('Book Title 12', 'Publisher 12'),
	('Book Title 13', 'Publisher 13'),
	('Book Title 14', 'Publisher 14'),
	('Book Title 15', 'Publisher 15'),
	('Book Title 16', 'Publisher 16'),
	('Book Title 17', 'Publisher 17'),
	('Book Title 18', 'Publisher 18'),
	('Book Title 19', 'Publisher 19'),
	('Book Title 20', 'Publisher 20')
;
SELECT * FROM BOOKS;

INSERT INTO BOOK_AUTHORS -- Should be 18
	(BookID, AuthorName)
	VALUES
	(1, 'Edward Marriott'),
	(2, 'Edward Marriott'),
	(3, 'Stephen King'),
	(4, 'Stephen King'),
	(5, 'Author 3'),
	(6, 'Author 4'),
	(7, 'Author 5'),
	(8, 'Author 6'),
	(9, 'Author 7'),
	(10, 'Author 8'),
	(11, 'Author 9'),
	(12, 'Author 10'),
	(13, 'Author 11'),
	(14, 'Author 12'),
	(15, 'Author 13'),
	(16, 'Author 14'),
	(17, 'Author 15'),
	(18, 'Author 16'),
	(19, 'Author 17'),
	(20, 'Author 18')
;
SELECT * FROM BOOK_AUTHORS;


INSERT INTO BOOK_COPIES -- Should be 40
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1, 2),
	(2, 1, 2),
	(3, 1, 2),
	(4, 1, 2),
	(5, 1, 2),
	(6, 1, 2),
	(7, 1, 2),
	(8, 1, 2),
	(9, 1, 2),
	(10, 1, 2),
	(1, 2, 2),
	(2, 2, 2),
	(3, 2, 2),
	(4, 2, 2),
	(5, 2, 2),
	(6, 2, 2),
	(7, 2, 2),
	(8, 2, 2),
	(9, 2, 2),
	(10, 2, 2),
	(1, 3, 2),
	(2, 3, 2),
	(3, 3, 2),
	(4, 3, 2),
	(5, 3, 2),
	(6, 3, 2),
	(7, 3, 2),
	(8, 3, 2),
	(9, 3, 2),
	(10, 3, 2),
	(1, 4, 2),
	(2, 4, 2),
	(3, 4, 2),
	(4, 4, 2),
	(5, 4, 2),
	(6, 4, 2),
	(7, 4, 2),
	(8, 4, 2),
	(9, 4, 2),
	(10, 4, 2)
;
SELECT * FROM BOOK_COPIES;

INSERT INTO BOOK_LOANS -- 50
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 1, 1000, '01/01/2000', '01/01/2001'),
	(2, 2, 1001, '01/02/2000', '01/02/2001'),
	(3, 3, 1002, '01/03/2000', '01/03/2001'),
	(4, 4, 1003, '01/04/2000', '01/04/2001'),
	(5, 1, 1004, '01/05/2000', '01/05/2001'),
	(6, 2, 1005, '01/06/2000', '01/06/2001'),
	(7, 3, 1006, '01/07/2000', '01/07/2001'),
	(8, 4, 1007, '01/08/2000', '01/08/2001'),
	(9, 1, 1000, '01/09/2000', '01/09/2001'),
	(10, 2, 1001, '01/10/2000', '01/10/2001'),
	(1, 3, 1002, '01/11/2000', '01/11/2001'),
	(2, 4, 1003, '01/12/2000', '01/12/2001'),
	(3, 1, 1004, '01/13/2000', '01/13/2001'),
	(4, 2, 1005, '01/14/2000', '01/14/2001'),
	(5, 3, 1006, '01/15/2000', '01/15/2001'),
	(6, 4, 1007, '01/16/2000', '01/16/2001'),
	(7, 1, 1000, '01/17/2000', '01/17/2001'),
	(8, 2, 1001, '01/18/2000', '01/18/2001'),
	(9, 3, 1002, '01/19/2000', '01/19/2001'),
	(10, 4, 1003, '01/20/2000', '01/20/2001'),
	(1, 1, 1004, '01/21/2000', '01/21/2001'),
	(2, 2, 1005, '01/22/2000', '01/22/2001'),
	(3, 3, 1006, '01/23/2000', '01/23/2001'),
	(4, 4, 1007, '01/24/2000', '01/24/2001'),
	(5, 1, 1000, '01/25/2000', '01/25/2001'),
	(6, 2, 1001, '01/26/2000', '01/26/2001'),
	(7, 3, 1002, '01/27/2000', '01/27/2001'),
	(8, 4, 1003, '01/28/2000', '01/28/2001'),
	(9, 1, 1004, '01/29/2000', '01/29/2001'),
	(10, 2, 1005, '01/30/2000', '01/30/2001'),
	(1, 3, 1006, '01/31/2000', '01/31/2001'),
	(2, 4, 1007, '02/01/2000', '02/01/2001'),
	(3, 1, 1000, '02/02/2000', '02/02/2001'),
	(4, 2, 1001, '02/03/2000', '02/03/2001'),
	(5, 3, 1002, '02/04/2000', '02/04/2001'),
	(6, 4, 1003, '02/05/2000', '02/05/2001'),
	(7, 1, 1004, '02/06/2000', '02/06/2001'),
	(8, 2, 1005, '02/07/2000', '02/07/2001'),
	(9, 3, 1006, '02/08/2000', '02/08/2001'),
	(10, 4, 1007, '02/09/2000', '02/09/2001'),
	(1, 1, 1000, '02/10/2000', '02/10/2001'),
	(2, 2, 1001, '02/11/2000', '02/11/2001'),
	(3, 3, 1002, '02/12/2000', '02/12/2001'),
	(4, 4, 1003, '02/13/2000', '02/13/2001'),
	(5, 1, 1004, '02/14/2000', '02/14/2001'),
	(6, 2, 1005, '02/15/2000', '02/15/2001'),
	(7, 3, 1006, '02/16/2000', '02/16/2001'),
	(8, 4, 1007, '02/17/2000', '02/17/2001'),
	(9, 1, 1000, '02/18/2000', '02/18/2001'),
	(10, 2, 1001, '02/19/2000', '02/19/2001')
;
SELECT * FROM BOOK_LOANS;

INSERT INTO BORROWER -- 8
	(Name, Address, Phone)
	VALUES
	('Borrower 1', 'bAddress 1', 'bPhone 1'),
	('Borrower 2', 'bAddress 2', 'bPhone 2'),
	('Borrower 3', 'bAddress 3', 'bPhone 3'),
	('Borrower 4', 'bAddress 4', 'bPhone 4'),
	('Borrower 5', 'bAddress 5', 'bPhone 5'),
	('Borrower 6', 'bAddress 6', 'bPhone 6'),
	('Borrower 7', 'bAddress 7', 'bPhone 7'),
	('Borrower 8', 'bAddress 8', 'bPhone 8')
;
SELECT * FROM BORROWER;

-- Create Procedures

-- Procdeure 1
USE db_library;
GO

CREATE PROCEDURE BookCount @branch_id INT, @book_id INT
AS
	SELECT Number_Of_Copies FROM BOOK_COPIES WHERE BranchID = @branch_id AND BookID = @book_id;
GO

EXECUTE BookCount @branch_id = 1, @book_id = 1;

-- Procedure 2
USE db_library;
GO

CREATE PROCEDURE BookCountAll @book_id INT
AS
	SELECT Number_Of_Copies FROM BOOK_COPIES WHERE BookID = @book_id;
GO

EXECUTE BookCountAll @book_id = 1;

-- Procedure 3
USE db_library;
GO

CREATE PROCEDURE BooksOut @cust_id INT
AS
	SELECT BOOK_LOANS.DateOut, BORROWER.Name
	FROM BORROWER INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	WHERE BORROWER.CardNo = @cust_id
GO

EXECUTE BooksOut @cust_id = 1000;
SELECT * FROM BOOK_LOANS;

-- Procedure 4
USE db_library;
GO

CREATE PROCEDURE DueToday_Sharpstown @current_date DATE
AS
	SELECT LIBRARY_BRANCH.BranchID, BORROWER.Name, BORROWER.Address
	FROM LIBRARY_BRANCH INNER JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
	INNER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo
	WHERE BOOK_LOANS.DateDue = @current_date;
GO

-- Procedure 5
USE db_library;
GO

CREATE PROCEDURE BranchCheckoutNo
AS
	SELECT LIBRARY_BRANCH.BranchName, COUNT(BOOK_LOANS.BranchID)
	FROM LIBRARY_BRANCH, BOOK_LOANS
	WHERE BOOK_LOANS.BranchID = 1
	GROUP BY LIBRARY_BRANCH.BranchName;
GO

EXECUTE BranchCheckoutNo;

-- Procedure 6
USE db_library;
GO

CREATE PROCEDURE BigSpenderDetector
AS
	DECLARE @i INT = 1000;
	WHILE @i <= 1007
	BEGIN
		SELECT BORROWER.Name, BORROWER.Address, COUNT(BOOK_LOANS.CardNo)
		FROM BORROWER INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
		GROUP BY BOOK_LOANS.CardNo, BORROWER.Name, BORROWER.Address
		HAVING BOOK_LOANS.CardNo = @i;
		SET @i = @i + 1;
	END
GO

EXECUTE BigSpenderDetector;

-- Procedure 7
USE db_library;
GO

CREATE PROCEDURE StephKingSearchAtCentral
AS
	SELECT BOOKS.Title, BOOK_COPIES.Number_Of_Copies
	FROM BOOKS INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID
	INNER JOIN BOOK_AUTHORS ON BOOK_COPIES.BookID = BOOK_AUTHORS.BookID
	GROUP BY BOOK_AUTHORS.AuthorName, BOOKS.Title, BOOK_COPIES.Number_Of_Copies
	HAVING BOOK_AUTHORS.AuthorName = 'Stephen King'
GO

EXECUTE StephKingSearchAtCentral;
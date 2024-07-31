create database Bookstore;

CREATE table author (
Author_id int primary key ,
FirstName varchar(20),
LastName varchar(20)
);

CREATE table Books(
Book_id int primary key ,
Title varchar(20),
Genre varchar(20),
author_id int,
price decimal(5,2),
foreign key (author_id) references author(author_id)
);

CREATE table Sales(
sales_id int primary key ,
book_id int,
salesDate date,
quantity int,
foreign key (book_id) references books(book_id)
);

insert into author (author_id, firstname , lastname)
values
(1, 'anshu','yadav'),
(2, 'abhinav', 'pandey'),
(3, 'ayan' , 'imam');


insert into books (book_id, title , genre, author_id,price)
values
(1, '1984','dystopian',1,9.99),
(2, 'Animal Farm', 'Satire',1,7.99),
(3, 'Brave New World' , 'dystopian',2,8.99),
(4, 'Fahrenheit' , 'Science Fiction',3,6.99);

insert into sales (sales_id, book_id , salesDate, quantity)
values
(1, 1,'2024-07-01',5),
(2, 2, '2024-07-02',3),
(3, 3 , '2024-07-03',2),
(4, 4 , '2024-07-04',4);

-- Querying all authors
SELECT * FROM Authors;

-- Querying all books with their authors
SELECT Books.Title, Authors.FirstName, Authors.LastName, Books.Price
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- Querying sales information with book details
SELECT Sales.SaleID, Books.Title, Sales.SaleDate, Sales.Quantity
FROM Sales
JOIN Books ON Sales.BookID = Books.BookID;

-- Finding total sales for each book
SELECT Books.Title, SUM(Sales.Quantity) AS TotalSold
FROM Sales
JOIN Books ON Sales.BookID = Books.BookID
GROUP BY Books.Title;

-- Updating the price of '1984'
UPDATE Books
SET Price = 10.99
WHERE BookID = 1;

-- Deleting a sale record
DELETE FROM Sales
WHERE SaleID = 4;




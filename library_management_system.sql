-- Library Management System
-- Author: Mayur
-- Concepts: Joins, Subqueries, Window Functions, CASE, CRUD

-- create database
drop database if exists Smart_library;
create database Smart_library;
use Smart_library;

-- create tables
-- Author
create table authors(
	author_id int primary key auto_increment,
    name varchar(50),
    email varchar(100)
);

-- Books
create table books(
	book_id int primary key auto_increment,
    title varchar(100),
    author_id int,
    category varchar(50),
    isbn varchar(30),
    published_date date,
    price decimal(10,2),
    available_copies int,
    foreign key (author_id) references authors(author_id)
);

-- members
create table members(
	member_id int primary key auto_increment,
    name varchar(50),
    email varchar(100),
    phone_number varchar(20),
    membership_date date
);

-- Transactions
create table transactions(
	transaction_id int primary key auto_increment,
    member_id int,
    book_id int,
    borrow_date date,
    return_date date,
    fine_amount decimal(10,2),
    foreign key (member_id) references members(member_id),
    foreign key (book_id) references books(book_id)
);

-- insert records into table 
-- insert into Authors
insert into authors(name,email) values
('J. K. Rowling', 'jkrowling@gmail.com'),
('George Orwell', 'orwell@gmail.com'),
('Stephen King', 'stephenking@gmail.com'),
('Isaac Asimov', 'asimov@gmail.com'),
('Dan Brown', 'danbrown@gmail.com'),
('Agatha Christie', 'christie@gmail.com'),
('APJ Abdul Kalam', 'apj@gmail.com'),
('Chetan Bhagat', 'chetan@gmail.com'),
('Yuval Noah Harari', 'harari@gmail.com'),
('Albert Einstein', 'einstein@gmail.com');

-- insert into books
insert into books(title,author_id,category,isbn,published_date,price,available_copies) values
('Harry Potter', 1, 'Fantasy', 'ISBN001', '2000-07-01', 450, 5),
('1984', 2, 'Dystopian', 'ISBN002', '1949-06-08', 350, 3),
('Animal Farm', 2, 'Political Satire', 'ISBN003', '1945-08-17', 200, 4),
('IT', 3, 'Horror', 'ISBN004', '1986-09-15', 550, 2),
('Foundation', 4, 'Science Fiction', 'ISBN005', '1951-06-01', 300, 6),
('Angels & Demons', 5, 'Thriller', 'ISBN006', '2000-05-01', 400, 7),
('The Da Vinci Code', 5, 'Thriller', 'ISBN007', '2003-04-01', 500, 1),
('Murder on the Orient Express', 6, 'Mystery', 'ISBN008', '1934-01-01', 250, 8),
('Wings of Fire', 7, 'Autobiography', 'ISBN009', '1999-01-01', 300, 5),
('Half Girlfriend', 8, 'Romance', 'ISBN010', '2014-10-01', 200, 9),
('Sapiens', 9, 'History', 'ISBN011', '2011-06-04', 600, 3),
('Homo Deus', 9, 'History', 'ISBN012', '2015-10-06', 650, 4),
('Relativity', 10, 'Science', 'ISBN013', '1916-11-01', 700, 2),
('The Time Machine', 2, 'Science Fiction', 'ISBN014', '1895-05-07', 150, 6),
('Digital Fortress', 5, 'Tech Thriller', 'ISBN015', '1998-02-01', 350, 5),
('The Shining', 3, 'Horror', 'ISBN016', '1977-01-28', 500, 3),
('The Alchemist', 6, 'Philosophy', 'ISBN017', '1988-04-15', 300, 10),
('Brief Answers to Big Questions', 10, 'Science', 'ISBN018', '2018-10-16', 700, 4),
('Think Like a Monk', 9, 'Self-help', 'ISBN019', '2020-09-08', 400, 6),
('The Invisible Man', 2, 'Science Fiction', 'ISBN020', '1897-01-01', 180, 8);

-- insert into members
insert into members(name,email,phone_number,membership_date) values
('Amit Shah', 'amit@gmail.com', '9876543210', '2021-05-10'),
('Riya Patel', 'riya@gmail.com', '9988776655', '2022-01-15'),
('Vikas Soni', 'vikas@gmail.com', '9090909090', '2023-06-20'),
('Meera Joshi', 'meera@gmail.com', '7878787878', '2019-03-01'),
('Rohan Singh', 'rohan@gmail.com', '9898989898', '2020-11-17'),
('Priya Sharma', 'priya@gmail.com', '9123456780', '2024-01-10'),
('Devanshi Mehta', 'devanshi@gmail.com', '9345678901', '2022-08-22'),
('Harsh Kumar', 'harsh@gmail.com', '9000000001', '2021-12-05'),
('Nidhi Desai', 'nidhi@gmail.com', '9555577777', '2018-07-09'),
('Karan Trivedi', 'karan@gmail.com', '9666677777', '2023-09-13');

insert into members(name,email,phone_number,membership_date) values
('nareda modi', 'nareda@gmail.com', '9876548465', '2024-05-15');
-- insert into transactions
insert into transactions(member_id,book_id,borrow_date,return_date,fine_amount) values
(1, 1, '2024-01-10', '2024-01-20', 0),
(2, 3, '2024-02-15', '2024-02-28', 10),
(3, 5, '2024-03-01', NULL, 0),
(4, 8, '2024-01-05', '2024-01-25', 20),
(5, 2, '2024-04-01', NULL, 0),
(6, 6, '2024-02-10', '2024-02-15', 0),
(7, 7, '2024-03-22', NULL, 0),
(8, 10, '2024-01-11', '2024-01-30', 5),
(9, 12, '2024-02-01', '2024-02-20', 15),
(10, 15, '2024-03-12', NULL, 0),
(1, 4, '2024-02-05', '2024-02-22', 10),
(2, 11, '2024-03-16', NULL, 0),
(3, 14, '2024-01-25', '2024-02-05', 0),
(4, 18, '2024-03-10', NULL, 0),
(5, 20, '2024-02-18', '2024-03-01', 0);

insert into transactions(member_id,book_id,borrow_date,return_date,fine_amount) values
(1, 1, '2024-12-10', '2024-12-20', 0);

insert into transactions(member_id,book_id,borrow_date,return_date,fine_amount) values
(11, 1, '2025-12-9', null, 0);
-- tasks
--  1
-- 1.1 Insert new book
insert into books (title,author_id,category,isbn,published_date,price,available_copies) values
('New Science Book', 10, 'Science', 'ISBN999', '2023-01-01', 550, 5);

-- 1.2 Update book availability
-- book borrowed
update books 
set available_copies= available_copies-1 
where book_id=1;

-- book returned
update books 
set available_copies= available_copies+1 
where book_id=1;

-- 1.3 Delete inactive members
-- delete from members 
-- where member_id not in(;
delete from members 
where member_id not in(
select distinct member_id from transactions 
where borrow_date>=date_sub(current_date(),interval 1 year));

-- 1.4 Books available for borrowing
select * from books 
where available_copies>0;

-- 2
-- 2.1 Books published after 2015
select * from books 
where year(published_date)>2015;

-- 2.2 Top 5 expensive books
select * from books 
order by price desc 
limit 5;

-- 2.3 Members joined before 2022
select * 
from members 
where year(membership_date)<2022;

-- 3
-- 3.1 Science books under 500
select * 
from books 
where category 
like 'science%' and price<500;

-- 3.2 Books unavailable for borrowing
select * 
from books 
where available_copies=0;

-- 3.3 Members joined after 2020 OR borrowed >3
select m.name,membership_date,count(t.transaction_id) as borrow_count 
from members m 
join transactions t on m.member_id=t.member_id  
group by m.member_id 
having borrow_count>=3 or m.membership_date>'2020-01-01';

-- 4
-- 4.1 Sort books alphabetically
select * from books order by title asc;

-- 4.2 Books borrowed per member
select m.name,membership_date,count(t.transaction_id) as borrow_count from members m join transactions t on m.member_id=t.member_id group by t.member_id;

-- 4.3 Count books by category
select category,count(*) as totel_books from books group by category;

-- 5
-- 5.1 
select category,count(*) as totel_books from books group by category;

-- 5.2 Average price
select round(avg(price)) as avg_price from books;

-- 5.3 Most borrowed book
select b.title,count(t.book_id) as borrow_count_book 
from members m 
join transactions t on m.member_id=t.member_id 
join books b on t.book_id=b.book_id
group by t.book_id order by borrow_count_book desc limit 1;

-- 5.4
select sum(fine_amount) as totle_fine 
from transactions;

-- 6
-- 6.1 Books with authors
select b.title,a.name as 'author name' 
from books b 
join authors a on b.author_id = a.author_id;

-- 6.2 
select m.name,t.transaction_id 
from members m 
join transactions t on m.member_id = t.member_id;

-- 7
-- 7.1 INNER JOIN Author + Book
select b.title,a.name as 'author name' 
from books b 
join authors a on b.author_id = a.author_id;

-- 7.2 Members + transactions (LEFT JOIN)
select m.name,t.borrow_date 
from members m 
left join transactions t on m.member_id=t.member_id;

-- 7.3 Books never borrowed
select b.title,t.borrow_date 
from transactions t 
right join books b on t.book_id= b.book_id 
where borrow_date is null;

-- 7.4 Members who never borrowed
select m.name,t.transaction_id 
from members m 
left join transactions t on m.member_id=t.member_id 
where transaction_id is null
union
select m.name,t.transaction_id 
from members m right join transactions t 
on m.member_id=t.member_id 
where transaction_id is null;

select m.name,t.transaction_id 
from members m 
left join transactions t on m.member_id=t.member_id 
where transaction_id is null;
-- 8
-- 8.1 Books borrowed by members registered after 2022
select * from books where
book_id in 
(select book_id 
from transactions t 
join members m on t.member_id=m.member_id 
where m.membership_date>'2022-01-01');

-- 8.2 
select * from books where
book_id = (select book_id 
from transactions 
group by book_id 
order by count(*) desc 
limit 1);

-- 8.3 Members who never borrowed
select * 
from members 
where member_id not in (select m.member_id 
from members m 
join transactions t on m.member_id=t.member_id);

-- 9
-- 9.1 Count books by year
select year(published_date),count(book_id) 
from books 
group by year(published_date);

-- 9.2
select transaction_id,timestampdiff(day,borrow_date,return_date) as deff_date 
from transactions;

-- 9.3
select transaction_id,date_format(borrow_date,'%d-%m-%Y') as new_formate 
from transactions;

-- 10
-- 10.1
select book_id,upper(title) as title 
from books;

-- 10.2
select name,trim(name) as trim_name 
from authors;

-- 10.3
set sql_safe_updates = 1;

update authors set email='Not Provied' where email is null;
update members set email='Not Provied' where email is null;

-- 11
-- 11.1
select b.title,
count(t.transaction_id) as borrow_count,
dense_rank() over(order by count(t.transaction_id) desc) as reak_no
from books b
left join transactions t on b.book_id=t.book_id
group by b.title;

-- 11.2
select m.member_id, m.name,
       count(t.transaction_id) as borrow_count,
       sum(count(t.transaction_id)) over (order by m.member_id) as cumulative_total
FROM members m
left join transactions t on m.member_id = t.member_id
group by m.member_id, m.name;

-- 11.3
select b.title,
count(t.transaction_id) as borrow_count,
avg(count(t.transaction_id)) over (order by b.book_id) as moving_avg
from books b
left join transactions t on b.book_id=t.book_id
where t.borrow_date>date_sub('2024-12-15',interval 3 month)
group by b.title,t.transaction_id;

-- 12
-- 12.1
select m.name,
case
	when t.borrow_date> date_sub(curdate(),interval 6 month) then 'Active'
	else 'Inactive'
end as memvership_Status
from members m left join transactions t on m.member_id=t.member_id;

-- 12.2
select title,published_date,
case
	when published_date>'2020-01-01' then 'New Arrival'
	when published_date<'2000-01-01' then 'Classic'
	else 'Regular'
end as book_Category
from books;
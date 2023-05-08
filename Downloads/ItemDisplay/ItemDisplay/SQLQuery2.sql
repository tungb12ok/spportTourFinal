Create database Item
USE  Item
CREATE TABLE Item(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(255),
	description Ntext,
	price money
)

INSERT INTO Item(name, description, price)
VALUES 
('Item 1', 'Description for Item 1', 9.99),
('Item 2', 'Description for Item 2', 12.99),
('Item 3', 'Description for Item 3', 15.99),
('Item 4', 'Description for Item 4', 8.99),
('Item 5', 'Description for Item 5', 19.99),
('Item 6', 'Description for Item 6', 7.99),
('Item 7', 'Description for Item 7', 11.99),
('Item 8', 'Description for Item 8', 14.99),
('Item 9', 'Description for Item 9', 10.99),
('Item 10', 'Description for Item 10', 6.99),
('Item 11', 'Description for Item 11', 13.99),
('Item 12', 'Description for Item 12', 17.99),
('Item 13', 'Description for Item 13', 4.99),
('Item 14', 'Description for Item 14', 21.99),
('Item 15', 'Description for Item 15', 16.99),
('Item 16', 'Description for Item 16', 9.99),
('Item 17', 'Description for Item 17', 12.99),
('Item 18', 'Description for Item 18', 15.99),
('Item 19', 'Description for Item 19', 8.99),
('Item 20', 'Description for Item 20', 19.99),
('Item 21', 'Description for Item 21', 7.99),
('Item 22', 'Description for Item 22', 11.99),
('Item 23', 'Description for Item 23', 14.99),
('Item 24', 'Description for Item 24', 10.99),
('Item 25', 'Description for Item 25', 6.99),
('Item 26', 'Description for Item 26', 6.99),
('Item 27', 'Description for Item 27', 6.99),
('Item 28', 'Description for Item 28', 6.99),
('Item 29', 'Description for Item 29', 6.99),
('Item 30', 'Description for Item 30', 6.99)
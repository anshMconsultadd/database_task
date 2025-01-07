 CREATE DATABASE IF NOT EXISTS DEMO ;
 USE DEMO ;
  

CREATE table accounts(
    id INT PRIMARY key,
    username VARCHAR(255)
);

CREATE TABLE items (
    id INT PRIMARY key,
    type ENUM('sword', 'shield', 'armor'),
    name VARCHAR(255)
);

create table accounts_items(
    account_id int ,
    item_id int ,
    quality ENUM('common', 'rare', 'epic'),
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (item_id)  REFERENCES items(id));


select * from accounts;
select * from items;
select * from accounts_items;

INSERT INTO accounts (id, username)
VALUES 
(1, 'cmunns1'),
(2, 'yworcs0');


INSERT INTO items (id, type, name)
VALUES 
(1, 'sword', 'Sword of Solanaceae'),
(2, 'shield', 'Shield of Rosaceae'),
(3, 'shield', 'Shield of Fagaceae'),
(5, 'shield', 'Shield of Lauraceae'),
(6, 'sword', 'Sword of Loasaceae'),
(7, 'armor', 'Armor of Myrtaceae'),
(8, 'shield', 'Shield of Rosaceae'),
(10, 'shield', 'Shield of Rosaceae');


INSERT INTO accounts_items (account_id, item_id, quality)
VALUES
(1, 10, 'epic'),
(1, 2, 'rare'),
(1, 2, 'rare'),
(1, 7, 'rare'),
(1, 1, 'common'),
(1, 2, 'common'),
(1, 3, 'common'),
(1, 5, 'common'),
(1, 8, 'common'),
(2, 8, 'epic'),
(2, 5, 'rare'),
(2, 3, 'common'),
(2, 6, 'common');




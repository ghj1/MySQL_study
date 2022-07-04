CREATE DATABASE trigger_demo;

USE trigger_demo;

CREATE TABLE uesrs(username VARCHAR(100), age INT);

INSERT INTO users(username, age) VALUES("bobby", 23);

INSERT INTO users(username, age) VALUES("sally", 16);

SELECT * FROM users;

-- trigger create 
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

INSERT INTO users(username, age) VALUES("Sue", 54);

-- example 2
-- source /Users/gimhyeonjeong/Documents/MySQL_study/sql_file/ig.sql 실행 후  

DELIMITER $$

CREATE TRIGGER trigger_name
     trigger_time trigger_event ON table_name FOR EACH ROW
     BEGIN
     END;
$$

DELIMITER ;
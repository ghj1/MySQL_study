-- user 스키마 
CREATE DATABASE ig_clone;

USE ig_clone;

CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) UNIQUE NOT NULL,
create_at TIMESTAMP DEFAULT NOW()
);

-- photos 스키마 
CREATE TABLE photos(
id INT AUTO_INCREMENT PRIMARY KEY,
image_url VARCHAR(255) NOT NULL, 
user_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos(image_url, user_id) VALUES 
('/aldkjd76', 1), ('/lkajsd98', 2), ('/90jddlkj', 2);

SELECT*FROM photos 
JOIN users ON photos.user_id = users.id;

SELECT photos.image_url, users.username FROM photos 
JOIN users ON photos.user_id = users.id;


-- comments 스키마 
CREATE TABLE comments(
id INT AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255) NOT NULL,
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photos(id)
);


INSERT INTO comments(comment_text, user_id, photo_id) VALUES 
('Meow!' , 1, 2),
('Amazing Shot', 3, 2), 
('I < 3 This', 2, 1);


-- LIKE 스키마
CREATE TABlE likes(
user_id INT NOT NULL,
photo_id INT NOT NULL, 
create_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photos(id),
PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id) VALUES 
(1,1),(2,1),(1,2),(1,3),(3,3);



-- Relationship 스키마 
CREATE TABLE follows(
follower_id INT NOT NULL,   
followee_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(follower_id) REFERENCES users(id),
FOREIGN KEY(followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES 
(1,2),(1,3),(3,1),(2,3);

-- tags 스키마 
CREATE TABLE tags(
id INT AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE,
create_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
photo_id INT NOT NULL,  
tag_id INT NOT NULL,  
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(tag_id) REFERENCES tags(id),
PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO tags(tag_name) VALUES 
('adorable'), ('cute'), ('sunrise');

INSERT INTO photo_tags(photo_id, tag_id) VALUES
(1,1),(1,2),(2,3),(3,2);
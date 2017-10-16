CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT NOT NULL,
    screen_name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    publish TIMESTAMP DEFAULT current_timestamp,
    user_id INT REFERENCES users ON DELETE CASCADE
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users ON DELETE CASCADE,
    post_id INT REFERENCES posts ON DELETE CASCADE,
    refer_comment INT,
    FOREIGN KEY (refer_comment) REFERENCES comments(id) ON DELETE 
    comment TEXT NOT NULL
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag TEXT NOT NULL
);

CREATE TABLE post_tags (
    post_id INT REFERENCES posts ON DELETE CASCADE,
    tag_id INT REFERENCES tags ON DELETE CASCADE,
    PRIMARY KEY(post_id, tag_id)
);

INSERT INTO users (first_name, last_name, email, screen_name) VALUES
('Eddie', 'Yao', 'eddie.thinkful@gmail.com', 'adpoyao'),
('Andy', 'Gaines', 'andy.thinkful@gmail.com', 'ziz'),
('Chris', 'Klanac', 'chris@thinkful@gmail.com', 'cklanac');

INSERT INTO posts (title, content, user_id) VALUES
('Post 1', 'content 1', '1'),
('Post 2', 'content 2', '1'),
('Post 3', 'content 3', '2'),
('Post 4', 'content 4', '3');

INSERT INTO comments (user_id, post_id, comment, refer_comment) VALUES
(1, 3, 'Awesome', 2),
(2, 1, 'AMAZING!', 3),
(3, 4, 'Oops, made  a mistake!', 1);

INSERT INTO tags (tag) VALUES
('blessed'),
('snooze'),
('nothing'),
('failing');

INSERT INTO post_tags (post_id, tag_id) VALUES
('1', '4'),
('1', '3'),
('2', '1'),
('3', '2');
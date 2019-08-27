PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;

DROP TABLE IF EXISTS replies;

DROP TABLE IF EXISTS question_follows;

DROP TABLE IF EXISTS questions;

DROP TABLE IF EXISTS users;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL, 
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,


  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Brandon', 'Warner'),
  ('Kafele', 'Kossally');
  
INSERT INTO
  questions (title, body, user_id)
VALUES
  ('When will I master the craft?', NULL, (SELECT id FROM users WHERE users.fname = 'Brandon')),
  ('SQL syntax?', NULL, (SELECT id FROM users WHERE users.fname = 'Kafele'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE users.fname = 'Brandon'), (SELECT id FROM questions WHERE questions.title = 'When will I master the craft?')),
  ((SELECT id FROM users WHERE users.fname = 'Kafele'), (SELECT id FROM questions WHERE questions.title = 'SQL syntax?')),
  ((SELECT id FROM users WHERE users.fname = 'Kafele'), (SELECT id FROM questions WHERE questions.title = 'When will I master the craft?')),
  ((SELECT id FROM users WHERE users.fname = 'Brandon'), (SELECT id FROM questions WHERE questions.title = 'SQL syntax?'));

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE users.fname = 'Kafele'), (SELECT id FROM questions WHERE questions.title = 'When will I master the craft?')),
  ((SELECT id FROM users WHERE users.fname = 'Brandon'), (SELECT id FROM questions WHERE questions.title = 'SQL syntax?'));

INSERT INTO
  replies (body, question_id, user_id, parent_id)
VALUES
  ('Never!',(SELECT id FROM questions WHERE questions.title = 'When will I master the craft?'),
    (SELECT id FROM users WHERE users.fname = 'Kafele'), NULL),
  ('Huh?',(SELECT id FROM questions WHERE questions.title = 'SQL syntax?'),
    (SELECT id FROM users WHERE users.fname = 'Brandon'), NULL),
  ('Lies!!!',(SELECT id FROM questions WHERE questions.title = 'When will I master the craft?'),
    (SELECT id FROM users WHERE users.fname = 'Brandon'), (SELECT id FROM replies WHERE replies.body = 'Never!'));
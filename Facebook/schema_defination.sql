CREATE TABLE Users (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Friendship (
	user_id INT NOT NULL,
	friend_id INT NOT NULL, 
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, friend_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	FOREIGN KEY (friend_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TYPE media_type AS ENUM ('text', 'photo', 'video');

CREATE TABLE Posts (
	post_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	content TEXT,
    media_type media_type NOT NULL,
	media_url TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Likes (
	like_id SERIAL PRIMARY KEY,
	user_id INT,
	post_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
	UNIQUE(user_id, post_id)
);


CREATE TABLE Comments (
	comment_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	post_id INT NOT NULL,
	comment_text TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE
);


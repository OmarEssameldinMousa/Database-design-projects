-- Schema Definition for Chat Application

-- Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- Messages Table
CREATE TABLE Messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

-- Chats Table
CREATE TABLE Chats (
    chat_id SERIAL PRIMARY KEY,
    chat_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Chat Participants Table
CREATE TABLE Chat_Participants (
    chat_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role VARCHAR(50),
    PRIMARY KEY (chat_id, user_id),
    FOREIGN KEY (chat_id) REFERENCES Chats(chat_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Attachments Table
CREATE TABLE Attachments (
    attachment_id SERIAL PRIMARY KEY,
    message_id INTEGER NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    file_type VARCHAR(50),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (message_id) REFERENCES Messages(message_id)
);

-- Status Table
CREATE TABLE Status (
    status_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    status VARCHAR(50),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Friends Table
CREATE TABLE Friends (
    user_id INTEGER NOT NULL,
    friend_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    PRIMARY KEY (user_id, friend_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (friend_id) REFERENCES Users(user_id)
);

-- Indexes

-- Index on `username`
CREATE INDEX idx_username ON Users (username);

-- Unique index on `email`
CREATE UNIQUE INDEX idx_email ON Users (email);

-- Composite index on `sender_id` and `receiver_id`
CREATE INDEX idx_sender_receiver ON Messages (sender_id, receiver_id);

-- Index on `chat_id` and `user_id` in `Chat_Participants`
CREATE INDEX idx_chat_user ON Chat_Participants (chat_id, user_id);

-- Index on `user_id` in `Status`
CREATE INDEX idx_user_status ON Status (user_id);


-- Sample Data Insertion
-- Insert sample users
INSERT INTO Users (username, email, password_hash) VALUES ('user1', 'user1@example.com', 'password_hash1');
INSERT INTO Users (username, email, password_hash) VALUES ('user2', 'user2@example.com', 'password_hash2');
INSERT INTO Users (username, email, password_hash) VALUES ('user3', 'user3@example.com', 'password_hash3');

-- Insert sample statuses
INSERT INTO Status (user_id, status) VALUES (1, 'online');
INSERT INTO Status (user_id, status) VALUES (2, 'offline');
INSERT INTO Status (user_id, status) VALUES (3, 'away');

-- Insert sample friends
INSERT INTO Friends (user_id, friend_id, status) VALUES (1, 2, 'accepted');
INSERT INTO Friends (user_id, friend_id, status) VALUES (1, 3, 'pending');
INSERT INTO Friends (user_id, friend_id, status) VALUES (2, 3, 'accepted');

-- Insert sample messages
INSERT INTO Messages (sender_id, receiver_id, content) VALUES (1, 2, 'Hello, User2!');
INSERT INTO Messages (sender_id, receiver_id, content) VALUES (2, 1, 'Hi, User1!');
INSERT INTO Messages (sender_id, receiver_id, content) VALUES (1, 3, 'Hey, User3!');

-- Insert sample chats
INSERT INTO Chats (chat_name) VALUES ('Group Chat 1');
INSERT INTO Chats (chat_name) VALUES ('Group Chat 2');

-- Insert sample chat participants
INSERT INTO Chat_Participants (chat_id, user_id, role) VALUES (1, 1, 'admin');
INSERT INTO Chat_Participants (chat_id, user_id, role) VALUES (1, 2, 'member');
INSERT INTO Chat_Participants (chat_id, user_id, role) VALUES (2, 1, 'member');
INSERT INTO Chat_Participants (chat_id, user_id, role) VALUES (2, 3, 'admin');

-- Insert sample attachments
INSERT INTO Attachments (message_id, file_path, file_type) VALUES (1, '/path/to/file1.jpg', 'image');
INSERT INTO Attachments (message_id, file_path, file_type) VALUES (2, '/path/to/file2.pdf', 'file');

-- Challenge Queries

-- Query 1: Send a message between users
-- Example: User 1 sends a message to User 2
INSERT INTO Messages (sender_id, receiver_id, content) VALUES (1, 2, 'Hello, how are you?');

-- Query 2: Create a group chat
-- Example: Create a new chat named 'Study Group'
INSERT INTO Chats (chat_name) VALUES ('Study Group');

-- Query 3: Join a group chat
-- Example: User 1 and User 3 join the 'Study Group' chat (assume chat_id = 3 for 'Study Group')
INSERT INTO Chat_Participants (chat_id, user_id, role) VALUES (3, 1, 'member');
INSERT INTO Chat_Participants (chat_id, user_id, role) VALUES (3, 3, 'member');

-- Query 4: Add friends
-- Example: User 2 sends a friend request to User 3
INSERT INTO Friends (user_id, friend_id, status) VALUES (2, 3, 'pending');

-- Query 5: Retrieve messages between two users (user_id = 1 and user_id = 2)
SELECT * FROM Messages
WHERE (sender_id = 1 AND receiver_id = 2)
   OR (sender_id = 2 AND receiver_id = 1)
ORDER BY timestamp;

-- Query 6: Retrieve participants in a chat group (chat_id = 1)
SELECT u.username, cp.role
FROM Chat_Participants cp
JOIN Users u ON cp.user_id = u.user_id
WHERE cp.chat_id = 1;

-- Query 7: Retrieve all attachments for a specific message (message_id = 1)
SELECT * FROM Attachments
WHERE message_id = 1;

-- Query 8: Retrieve the status of a specific user (user_id = 1)
SELECT * FROM Status
WHERE user_id = 1;

-- Query 9: Retrieve all friends of a specific user (user_id = 1)
SELECT u.username, f.status
FROM Friends f
JOIN Users u ON f.friend_id = u.user_id
WHERE f.user_id = 1;


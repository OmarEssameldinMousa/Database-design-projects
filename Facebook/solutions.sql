-- Q1) Assuming user_id = 1 wants to add user_id = 2 as a friend
INSERT INTO Friendships (user_id, friend_id) VALUES (1, 2);
INSERT INTO Friendships (user_id, friend_id) VALUES (2, 1);


-- Q2)
-- Text post by user_id = 1
INSERT INTO Posts (user_id, content, media_type) VALUES (1, 'This is a text post', 'text');
-- Photo post by user_id = 1
INSERT INTO Posts (user_id, content, media_type, media_url) VALUES (1, 'This is a photo post', 'photo', 'http://example.com/photo.jpg');
-- Video post by user_id = 1
INSERT INTO Posts (user_id, content, media_type, media_url) VALUES (1, 'This is a video post', 'video', 'http://example.com/video.mp4');


-- Q3) User_id = 1 likes post_id = 2
INSERT INTO Likes (user_id, post_id) VALUES (1, 2);


-- Q4) User_id = 1 comments on post_id = 2
INSERT INTO Comments (post_id, user_id, comment_text) VALUES (2, 1, 'This is a comment on the post');


-- Q5) Retrieve posts from friends of user_id = 1
SELECT p.*
FROM Posts p
JOIN Friendships f ON p.user_id = f.friend_id
WHERE f.user_id = 1
ORDER BY p.created_at DESC;

-- Q6) Retrieve likes for post_id = 2
SELECT L.*, U.username
FROM Likes L
JOIN Users U USING (user_id) 
WHERE L.post_id = 2
ORDER BY L.created_at DESC
-- Retrieve comments for post_id = 2
SELECT c.*, u.username
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
WHERE c.post_id = 2
ORDER BY c.created_at DESC;






### 1. Users Table
The `Users` table stores information about each user.

- **Columns:**
  - `user_id`: A unique identifier for each user (Primary Key).
  - `username`: The user's username (Unique, Not Null).
  - `email`: The user's email address (Unique, Not Null).
  - `password`: The user's password (Not Null).
  - `created_at`: The timestamp when the user was created (Default to the current timestamp).

### 2. Friendships Table
The `Friendships` table stores information about friendships between users.

- **Columns:**
  - `user_id`: The user who initiates the friendship (Foreign Key referencing `Users.user_id`).
  - `friend_id`: The user who is being added as a friend (Foreign Key referencing `Users.user_id`).
  - `created_at`: The timestamp when the friendship was created (Default to the current timestamp).

- **Primary Key:**
  - The combination of `user_id` and `friend_id` ensures that each friendship is unique.

### 3. Posts Table
The `Posts` table stores information about posts made by users.

- **Columns:**
  - `post_id`: A unique identifier for each post (Primary Key).
  - `user_id`: The user who created the post (Foreign Key referencing `Users.user_id`).
  - `content`: The content of the post (Text, can be null if only media is posted).
  - `media_type`: The type of media associated with the post (Enum: 'text', 'photo', 'video').
  - `media_url`: The URL of the media (Text, can be null if the post is only text).
  - `created_at`: The timestamp when the post was created (Default to the current timestamp).

### 4. Likes Table
The `Likes` table stores information about likes on posts.

- **Columns:**
  - `like_id`: A unique identifier for each like (Primary Key).
  - `user_id`: The user who liked the post (Foreign Key referencing `Users.user_id`).
  - `post_id`: The post that was liked (Foreign Key referencing `Posts.post_id`).
  - `created_at`: The timestamp when the like was created (Default to the current timestamp).

- **Constraints:**
  - The combination of `user_id` and `post_id` must be unique, ensuring that a user can only like a post once.

### 5. Comments Table
The `Comments` table stores information about comments on posts.

- **Columns:**
  - `comment_id`: A unique identifier for each comment (Primary Key).
  - `post_id`: The post that the comment is associated with (Foreign Key referencing `Posts.post_id`).
  - `user_id`: The user who made the comment (Foreign Key referencing `Users.user_id`).
  - `comment_text`: The text of the comment (Not Null).
  - `created_at`: The timestamp when the comment was created (Default to the current timestamp).

### Relationships and Constraints

1. **Users and Friendships:**
   - The `Friendships` table references the `Users` table twice, ensuring that both `user_id` and `friend_id` exist in the `Users` table.
   - The primary key on the combination of `user_id` and `friend_id` ensures that each friendship is unique.
   - Friendships are mutual, so if user A is friends with user B, user B should also be friends with user A (this can be enforced at the application level).

2. **Users and Posts:**
   - The `Posts` table has a foreign key referencing the `Users` table, ensuring that each post is associated with an existing user.
   - Deleting a user will cascade delete their posts.

3. **Users and Likes:**
   - The `Likes` table has foreign keys referencing both the `Users` table and the `Posts` table.
   - The combination of `user_id` and `post_id` must be unique, ensuring that a user can only like a post once.
   - Deleting a user or a post will cascade delete the associated likes.

4. **Users and Comments:**
   - The `Comments` table has foreign keys referencing both the `Users` table and the `Posts` table.
   - Deleting a user or a post will cascade delete the associated comments.

### Summary

- The schema consists of five tables: `Users`, `Friendships`, `Posts`, `Likes`, and `Comments`.
- Relationships between users, posts, likes, and comments are managed using foreign keys.
- Constraints ensure data integrity, such as unique usernames and emails, unique likes, and cascading deletes to maintain referential integrity.

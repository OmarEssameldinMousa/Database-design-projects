# Database-design-projects
in this repository you will find different projects to train yourself in data modeling and database's schema designing 
## project 1 - Facebook database design 
### Project Requirements

1. **User Profile**
   - Users should be able to sign up and create a profile.
   - Users should be able to add other profiles as friends.
   
2. **Posts**
   - Users should be able to add posts containing text, photos, or videos.
   - Users should be able to see posts that their friends have added.

3. **Interactions**
   - Users should be able to like posts.
   - Users should be able to add comments to posts.

### Database Schema

Let's define the tables needed to meet these requirements:

1. **Users Table**
   - `user_id` (Primary Key, Auto-increment)
   - `username` (Unique, Not Null)
   - `email` (Unique, Not Null)
   - `password` (Not Null)
   - `created_at` (Timestamp, Default current time)

2. **Friendships Table**
   - `user_id` (Foreign Key referencing `Users.user_id`, Composite Primary Key)
   - `friend_id` (Foreign Key referencing `Users.user_id`, Composite Primary Key)
   - `created_at` (Timestamp, Default current time)

3. **Posts Table**
   - `post_id` (Primary Key, Auto-increment)
   - `user_id` (Foreign Key referencing `Users.user_id`, Not Null)
   - `content` (Text)
   - `media_type` (Enum: 'text', 'photo', 'video')
   - `media_url` (Text)
   - `created_at` (Timestamp, Default current time)

4. **Likes Table**
   - `like_id` (Primary Key, Auto-increment)
   - `user_id` (Foreign Key referencing `Users.user_id`, Not Null)
   - `post_id` (Foreign Key referencing `Posts.post_id`, Not Null)
   - `created_at` (Timestamp, Default current time)

5. **Comments Table**
   - `comment_id` (Primary Key, Auto-increment)
   - `post_id` (Foreign Key referencing `Posts.post_id`, Not Null)
   - `user_id` (Foreign Key referencing `Users.user_id`, Not Null)
   - `comment_text` (Text, Not Null)
   - `created_at` (Timestamp, Default current time)


### Constraints to Implement

1. Ensure unique friendships: Mutual friendships should be enforced at the application level.
2. Ensure a user can only like a post once using a composite unique key in the `Likes` table.
3. Cascading deletes to maintain data integrity.

### Challenge

1. Implement this database schema in your preferred SQL database.
2. Insert sample data to test the relationships and constraints.
3. Write queries to:
   - Add friends.
   - Post content (text, photo, video).
   - Like a post.
   - Comment on a post.
   - Retrieve posts from friends.
   - Retrieve likes and comments for a post.

## Project 2 - Chat Application Database Design

### Project Requirements

#### User Profile

1. Users should be able to sign up and create a profile.
2. Users should be able to log in and manage their profile.
3. Users should have a status indicating their availability (online, offline, etc.).

#### Messaging

1. Users should be able to send messages to other users.
2. Messages can contain text and attachments (images, files).
3. Messages should be timestamped and have a read/unread status.

#### Chat Groups

1. Users should be able to create and join group chats.
2. Group chats should support multiple participants.
3. Group chats should have a name and participants can have roles (admin, member).

#### Friendships

1. Users should be able to add other users as friends.
2. Friendships should have a status (pending, accepted, blocked).

#### Database Schema

Let's define the tables needed to meet these requirements:

#### Users Table

- `user_id` (Primary Key, Auto-increment)
- `username` (Unique, Not Null)
- `email` (Unique, Not Null)
- `password_hash` (Not Null)
- `created_at` (Timestamp, Default current time)
- `updated_at` (Timestamp, Default current time on update)
- `last_login` (Timestamp)

#### Messages Table

- `message_id` (Primary Key, Auto-increment)
- `sender_id` (Foreign Key referencing Users.user_id, Not Null)
- `receiver_id` (Foreign Key referencing Users.user_id, Not Null)
- `content` (Text, Not Null)
- `timestamp` (Timestamp, Default current time)
- `is_read` (Boolean, Default false)

#### Chats Table

- `chat_id` (Primary Key, Auto-increment)
- `chat_name` (Optional)
- `created_at` (Timestamp, Default current time)
- `updated_at` (Timestamp, Default current time on update)

#### Chat Participants Table

- `chat_id` (Foreign Key referencing Chats.chat_id, Composite Primary Key)
- `user_id` (Foreign Key referencing Users.user_id, Composite Primary Key)
- `joined_at` (Timestamp, Default current time)
- `role` (Optional, e.g., admin, member)

#### Attachments Table

- `attachment_id` (Primary Key, Auto-increment)
- `message_id` (Foreign Key referencing Messages.message_id, Not Null)
- `file_path` (Text, Not Null)
- `file_type` (Optional, e.g., image, file)
- `uploaded_at` (Timestamp, Default current time)

#### Status Table

- `status_id` (Primary Key, Auto-increment)
- `user_id` (Foreign Key referencing Users.user_id, Not Null)
- `status` (Text, Not Null)
- `last_updated` (Timestamp, Default current time)

#### Friends Table

- `user_id` (Foreign Key referencing Users.user_id, Composite Primary Key)
- `friend_id` (Foreign Key referencing Users.user_id, Composite Primary Key)
- `created_at` (Timestamp, Default current time)
- `status` (Text, e.g., pending, accepted, blocked)

#### Constraints to Implement

- Ensure unique friendships: Mutual friendships should be enforced at the application level.
- Cascading deletes to maintain data integrity.

#### Challenge

Implement this database schema in your preferred SQL database.
Insert sample data to test the relationships and constraints.
Write queries to:
- Send a message between users.
- Create and join group chats.
- Add friends.
- Retrieve messages between two users.
- Retrieve participants in a chat group.
- Retrieve all attachments for a specific message.
- Retrieve the status of a specific user.
- Retrieve all friends of a specific user.

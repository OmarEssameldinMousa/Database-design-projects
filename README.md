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


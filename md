# Graph Schema Definition  

## Nodes  
- **User**  
    - Attributes:  
        - id: String (unique identifier)  
        - name: String  
        - email: String  
        - created_at: DateTime  

- **Post**  
    - Attributes:  
        - id: String (unique identifier)  
        - title: String  
        - content: String  
        - created_at: DateTime  
        - user_id: String (reference to User)  

- **Comment**  
    - Attributes:  
        - id: String (unique identifier)  
        - content: String  
        - created_at: DateTime  
        - post_id: String (reference to Post)  
        - user_id: String (reference to User)  

## Relationships  
- **CREATES**  
    - From: User  
    - To: Post  

- **HAS_COMMENT**  
    - From: Post  
    - To: Comment  

- **AUTHORED_BY**  
    - From: Comment  
    - To: User  

## Indexes  
- User:  
    - id  
    - email  

- Post:  
    - id  
    - user_id  

- Comment:  
    - id  
    - post_id  
    - user_id  

## Example Queries  
1. Get all posts by a user  
2. Get all comments for a post  
3. Find users who commented on a specific post  

## Notes  
- This schema is designed to accommodate a social media platform where users can create posts and comment on them.  
- Ensure to maintain referential integrity between nodes.  

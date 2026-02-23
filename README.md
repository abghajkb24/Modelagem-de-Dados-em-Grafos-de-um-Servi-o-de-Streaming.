# Graph Data Modeling for a Streaming Service

## Introduction
Graph databases are an essential tool for streaming services, enabling them to manage complex relationships and provide recommendations based on user interactions and content metadata. This document outlines the principles of graph data modeling tailored for a streaming service.

## Core Concepts

### Nodes
- **Users**: Represent individuals who consume content.
- **Content**: This includes movies, TV shows, and other media items.
- **Genres**: Categories like Action, Drama, Comedy, etc.
- **Platforms**: The different platforms through which content can be accessed (e.g., Netflix, Hulu).

### Relationships
- **WATCHED**: A connection from a User to Content they have watched.
- **LIKES**: A connection from a User to Content they have liked.
- **BELONGS_TO**: A connection from Content to Genres.
- **AVAILABLE_ON**: A connection from Content to Platforms.

### Properties
Each node and relationship can have properties. For example:
- **User**: `{ "username": "abghajkb24", "age": 25, "location": "USA" }`
- **Content**: `{ "title": "Inception", "release_year": 2010, "duration": 148 }`
- **LIKES**: `{ "rating": 5 }`

## Use Cases
1. **Recommendation Systems**: Utilize the connections between Users and Content to suggest new titles based on viewing history and preferences.
2. **Social Features**: Connect Users to facilitate friend suggestions, content sharing, and discussions over watched content.
3. **Content Discovery**: Help users discover content within their preferred genre or based on their watching habits.
4. **Trending Analysis**: Analyze viewing patterns in real-time to identify trending content and genres.

## Example Queries
Using Cypher query language:
- **Find all content watched by a user**:
  ```cypher
  MATCH (u:User {username: 'abghajkb24'})-[:WATCHED]->(c:Content)
  RETURN c

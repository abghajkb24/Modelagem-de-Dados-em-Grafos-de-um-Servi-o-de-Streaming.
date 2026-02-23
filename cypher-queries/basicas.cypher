// Basic Cypher queries for a streaming service graph database

// Query to find all movies and their details
MATCH (movie:Movie) RETURN movie;

// Query to find all users
MATCH (user:User) RETURN user;

// Query to find all movies watched by a specific user
MATCH (u:User)-[:WATCHED]->(m:Movie) WHERE u.name = 'John Doe' RETURN m;

// Query to find all users who watched a specific movie
MATCH (u:User)-[:WATCHED]->(m:Movie) WHERE m.title = 'Inception' RETURN u;

// Query to find the top N movies watched by users
MATCH (m:Movie)<-[:WATCHED]-(u:User) RETURN m, COUNT(u) as num_watched ORDER BY num_watched DESC LIMIT 10;

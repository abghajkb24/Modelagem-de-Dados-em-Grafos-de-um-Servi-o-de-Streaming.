// Analytical Cypher Queries

// Query 1: Find all users who have watched a specific movie
MATCH (u:User)-[:WATCHED]->(m:Movie {title: 'Inception'})
RETURN u.name, u.age

// Query 2: Load the number of movies watched by each user
MATCH (u:User)-[:WATCHED]->(m:Movie)
RETURN u.name, COUNT(m) AS movies_watched
ORDER BY movies_watched DESC

// Query 3: Find movies with more than a certain number of views
MATCH (m:Movie)
WHERE size(m.views) > 1000
RETURN m.title, size(m.views) AS view_count

// Query 4: Find the most popular genre among users
MATCH (u:User)-[:WATCHED]->(m:Movie)
RETURN m.genre, COUNT(m) AS popularity
ORDER BY popularity DESC

// Query 5: Recommendations for users based on similar viewing habits
MATCH (u1:User)-[:WATCHED]->(m:Movie)<-[:WATCHED]-(u2:User)
WHERE u1 <> u2
RETURN u2.name, COLLECT(m.title) AS recommended_movies
LIMIT 5;

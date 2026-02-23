// Recommendation Cypher Queries

// 1. Recommend a movie based on user preferences
MATCH (u:User)-[:LIKES]->(m:Movie)
WITH u, collect(m) as likedMovies
MATCH (m:Movie)<-[:LIKES]-(u2:User)
WHERE u <> u2 AND m NOT IN likedMovies
RETURN m.title as RecommendedMovie, count(u2) as popularity
ORDER BY popularity DESC
LIMIT 5;

// 2. Find similar movies
MATCH (m:Movie)<-[:SIMILAR]-(s:Movie)
WHERE m.title = 'Inception'
RETURN s.title as SimilarMovie;

// 3. Recommend movies to a user based on age
MATCH (u:User)
WHERE u.age >= 18
MATCH (u)-[:LIKES]->(m:Movie)
RETURN m.title as MovieRecommendation;

// 4. Top rated movies in a specific genre
MATCH (m:Movie)-[:IN_GENRE]->(g:Genre)
WHERE g.name = 'Action'
RETURN m.title as TopRatedMovie
ORDER BY m.rating DESC
LIMIT 10;

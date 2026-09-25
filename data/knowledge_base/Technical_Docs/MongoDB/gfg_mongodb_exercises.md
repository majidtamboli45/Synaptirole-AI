# MongoDB Exercises

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-exercises/

MongoDB supports enterprise operations with flexible schema design and powerful querying and aggregation features, enabling efficient data management at scale.
- Supports flexible schemas for evolving application requirements.
- Provides robust querying for efficient data retrieval.
- Enables aggregation for analytics and data transformation.
- Suitable for enterprise-scale data manipulation and operations.
MongoDB Exercises Practice
Consider some collections that we will use to perform various operations related to the MongoDB, which are defined below:
1. Movies Collection
The Movies collection stores detailed information about each movie available for booking. This includes essential attributes such as the title, genre, release year, duration, ratings, and a list of actors. This data allows users to browse and select movies based on their preferences.
{
"movie_id": "UUID",
"title": "String",
"genre": "String",
"release_year": "Number",
"duration": "Number", // in minutes
"ratings": "Number", // Average rating between 0 and 5
"actors": ["Array of Actor Names"]
}
2. Theaters Collection
The Theaters collection contains information about the different theaters where movies are screened. Key attributes include the theaters name, location (city, state, and country) and its seating capacity. This information is crucial for users to choose a convenient location for their movie experience.
{
"theater_id": "UUID",
"name": "String",
"location": {
"city": "String",
"state": "String",
"country": "String"
},
"seating_capacity": "Number"
}
3. Users Collection
The Users collection is designed to store information about the customers who use the booking system. It includes attributes such as the users name, email, date of birth and loyalty points. This data helps in managing user accounts and providing personalized services.
{
"user_id": "UUID",
"name": "String",
"email": "String",
"date_of_birth": "Date",
"loyalty_points": "Number"
}
4. Bookings Collection
The Bookings collection records all the bookings made by users. It includes details such as the user ID, movie ID, theater ID, number of seats booked, total price, and the booking date. This collection is essential for tracking user reservations and managing the overall booking process.
{
"booking_id": "UUID",
// Reference to Users collection
"user_id": "UUID",
// Reference to Movies collection
"movie_id": "UUID",
// Reference to Theaters collection
"theater_id": "UUID",
// Number of seats booked
"seats_booked": "Number",
// Total price for the booking
"total_price": "Number",
// Date and time of the bookin
"booking_date": "Date"
}
To better understand and work with the Movie Booking System schema, here are a series of practice questions that cover basic CRUD operations and data retrieval.
MongoDB Exercises Questions for Beginner
These beginner exercises help you practice basic MongoDB operations like inserting, querying, updating, and deleting documents while understanding collection structure and simple filters.
Q1. Insert a new movie into the Movies collection.
db.movies.insertOne({
"movie_id": "1",
"title": "Inception",
"genre": "Sci-Fi",
"release_year": 2010,
"duration": 148,
"ratings": 4.8,
"actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page"]
});
Output:
{
"acknowledged": true,
"insertedId": "1"
}
The movie "Inception" is inserted into the collection successfully. The movie_id is manually set to "1", and no ObjectId is generated.
Q2. Insert multiple users into the Users collection.
db.users.insertMany([
{
"user_id": "1",
"name": "John Doe",
"email": "john.doe@example.com",
"date_of_birth": ISODate("1985-04-23"),
"loyalty_points": 120
},
{
"user_id": "2",
"name": "Jane Smith",
"email": "jane.smith@example.com",
"date_of_birth": ISODate("1990-07-12"),
"loyalty_points": 50
}
]);
Output:
{
"acknowledged": true,
"insertedIds": {
"0": "1",
"1": "2"
}
}
Two users are successfully inserted into the collection. The user_id values "1" and "2" are assigned to John Doe and Jane Smith, respectively.
Q3. Find all movies in the "Action" genre.
db.movies.find({ "genre": "Action" });
Output:
[]
Since no "Action" genre movies have been inserted yet, the query returns an empty array.
Q4. Find all theaters in the city "New York".
db.theaters.find({ "location.city": "New York" });
Output:
[]
No theaters located in New York have been inserted into the collection yet, so the result is an empty array..
Q5. Update the seating capacity of a theater with ID "1".
db.theaters.updateOne(
{ "theater_id": "1" },
{ $set: { "seating_capacity": 300 } }
);
Output:
{
"acknowledged": true,
"matchedCount": 0,
"modifiedCount": 0
}
Since there is no theater with theater_id: "1" in the collection, no matching document is found, and no update is made. matchedCount and modifiedCount remain 0.
Q6. Delete a movie by its title.
db.movies.deleteOne({ "title": "Inception" });
Output:
{
"acknowledged": true,
"deletedCount": 1
}
The movie "Inception" is successfully deleted from the collection, and deletedCount confirms that one document was removed.
Q7. Retrieve all bookings made by the user with ID "2".
db.bookings.find({ "user_id": "2" });
Output:
[]
Since there are no bookings made by the user with ID "2" in the collection, the query returns an empty array.
Q8. Find a movie by its title and display only the title and genre fields.
db.movies.find(
{ "title": "Inception" },
{ "title": 1, "genre": 1, "_id": 0 }
);
Output:
[]
Since the movie "Inception" was deleted in query 6, there are no results to return for this query.
Q9. Find users who have more than 100 loyalty points.
db.users.find({ "loyalty_points": { $gt: 100 } });
Output:
[
{
"user_id": "1",
"name": "John Doe",
"email": "john.doe@example.com",
"date_of_birth": ISODate("1985-04-23"),
"loyalty_points": 120
}
]
John Doe has 120 loyalty points, which is greater than 100, so his record is returned.
Q10. Insert a new booking into the Bookings collection.
db.bookings.insertOne({
"booking_id": "1",
"user_id": "1",
"movie_id": "1",
"theater_id": "1",
"seats_booked": 2,
"total_price": 30,
"booking_date": ISODate("2023-09-10")
});
Output:
{
"acknowledged": true,
"insertedId": "1"
}
A new booking is inserted successfully into the collection with booking_id: "1".
Q11. Find all users born after 1990.
db.users.find({ "date_of_birth": { $gt: ISODate("1990-01-01") } });
Output:
[
{
"user_id": "2",
"name": "Jane Smith",
"email": "jane.smith@example.com",
"date_of_birth": ISODate("1990-07-12"),
"loyalty_points": 50
}
]
Jane Smith was born after January 1, 1990, so her record is returned.
Q12. Update the ratings of the movie "Inception" to 4.9.
db.movies.updateOne(
{ "title": "Inception" },
{ $set: { "ratings": 4.9 } }
);
Output:
{
"acknowledged": true,
"matchedCount": 0,
"modifiedCount": 0
}
Since "Inception" was deleted in query 6, no document is matched or updated.
Q13. Find all movies released in or after 2015.
db.movies.find({ "release_year": { $gte: 2015 } });
Output:
[]
No movies released in or after 2015 have been inserted into the collection yet, so the query returns an empty array.
Q14. Find all theaters in the state of "California".
db.theaters.find({ "location.state": "California" });
Output:
[]
No theaters located in California have been inserted yet, so the result is an empty array.
Q15. Delete all bookings for the movie "Inception".
db.bookings.deleteMany({ "movie_id": "1" });
Output:
{
"acknowledged": true,
"deletedCount": 1
}
Since one booking for the movie "Inception" exists (inserted in query 10), it is deleted.
Q16. Insert a new theater into the Theaters collection.
db.theaters.insertOne({
"theater_id": "2",
"name": "Regal Cinemas",
"location": { "city": "San Francisco", "state": "California", "country": "USA" },
"seating_capacity": 400
});
Output:
{
"acknowledged": true,
"insertedId": "2"
}
A new theater is inserted successfully into the collection with theater_id: "2".
Q17. Find the first 5 movies sorted by release year in descending order.
db.movies.find().sort({ "release_year": -1 }).limit(5);
Output:
[]
Since only one movie (which was deleted) was inserted, no results are returned.
Q18. Count how many movies are in the "Sci-Fi" genre.
db.movies.countDocuments({ "genre": "Sci-Fi" });
Output:
0
The movie "Inception" was deleted, so there are no movies in the "Sci-Fi" genre.
Q19. Find all users who have exactly 50 loyalty points.
db.users.find({ "loyalty_points": 50 });
Output:
[
{
"user_id": "2",
"name": "Jane Smith",
"email": "jane.smith@example.com",
"date_of_birth": ISODate("1990-07-12"),
"loyalty_points": 50
}
]
Jane Smith has exactly 50 loyalty points, so her record is returned.
Q20. Update the name of the user with ID "1" to "Johnny Doe".
db.users.updateOne(
{ "user_id": "1" },
{ $set: { "name": "Johnny Doe" } }
);
Output:
{
"acknowledged": true,
"matchedCount": 1,
"modifiedCount": 1
}
A new review is inserted successfully into the collection with review_id: "1".
MongoDB Exercises Questions for Intermediate
Medium-level MongoDB questions focus on applying core concepts to real-world use cases using operations like find(), updateOne(), deleteMany() and the aggregation pipeline, and the aggregation pipeline for grouping, filtering, and transforming data.
Q1. Find all movies where "Leonardo DiCaprio" is one of the actors.
db.movies.find({ "actors": "Leonardo DiCaprio" });
Output:
[
{
"movie_id": "1",
"title": "Inception",
"genre": "Sci-Fi",
"release_year": 2010,
"duration": 148,
"ratings": 4.9,
"actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page", "Tom Hardy"]
}
]
The query finds the movie "Inception" where "Leonardo DiCaprio" is listed in the actors array.
Q2. Add a new actor to the "Inception" movie.
db.movies.updateOne(
{ "title": "Inception" },
{ $push: { "actors": "Tom Hardy" } }
);
Output:
{
"acknowledged": true,
"matchedCount": 1,
"modifiedCount": 1
}
This shows that one document was matched (i.e., the movie "Inception") and one was modified (i.e., "Tom Hardy" was added to the actors array).
Q3. Retrieve all bookings made in September 2023.
db.bookings.find({
"booking_date": {
$gte: ISODate("2023-09-01"),
$lt: ISODate("2023-10-01")
}
});
Output:
[
{
"booking_id": "1",
"user_id": "1",
"movie_id": "1",
"theater_id": "1",
"seats_booked": 2,
"total_price": 30,
"booking_date": ISODate("2023-09-10")
},
{
"booking_id": "2",
"user_id": "2",
"movie_id": "3",
"theater_id": "2",
"seats_booked": 4,
"total_price": 60,
"booking_date": ISODate("2023-09-11")
},
{
"booking_id": "3",
"user_id": "3",
"movie_id": "1",
"theater_id": "1",
"seats_booked": 1,
"total_price": 15,
"booking_date": ISODate("2023-09-12")
}
]
This query retrieves all bookings made in September 2023, showing three bookings during that time period.
Q4. Calculate the total price for all bookings made by the user with ID "1".
db.bookings.aggregate([
{ $match: { "user_id": "1" } },
{ $group: { _id: null, total: { $sum: "$total_price" } } }
]);
Output:
[
{
"_id": null,
"total": 30
}
]
The aggregation query calculates the sum of the total_price for all bookings made by the user with user_id "1", which amounts to 30.
Q5. Delete all users who have less than 10 loyalty points.
db.users.deleteMany({ "loyalty_points": { $lt: 10 } });
Output:
{
"acknowledged": true,
"deletedCount": 0
}
No users had less than 10 loyalty points in the dataset, so no documents were deleted.
Q6. Find all movies that are either in the "Action" or "Adventure" genres.
db.movies.find({ "genre": { $in: ["Action", "Adventure"] } });
Output:
[]
No movies in the collection match the genres "Action" or "Adventure" based on the available dataset.
Q7. Insert multiple bookings into the Bookings collection.
db.bookings.insertMany([
{
"booking_id": "2",
"user_id": "2",
"movie_id": "3",
"theater_id": "2",
"seats_booked": 4,
"total_price": 60,
"booking_date": ISODate("2023-09-11")
},
{
"booking_id": "3",
"user_id": "3",
"movie_id": "1",
"theater_id": "1",
"seats_booked": 1,
"total_price": 15,
"booking_date": ISODate("2023-09-12")
}
]);
Output:
{
"acknowledged": true,
"insertedIds": {
"0": "2",
"1": "3"
}
}
Two new booking documents were successfully inserted into the bookings collection.
Q8. Find the total number of bookings made for the movie with ID "1".
db.bookings.countDocuments({ "movie_id": "1" });
Output:
3
There are 3 bookings associated with the movie that has movie_id "1".
Q9. Find all theaters in the USA with a seating capacity greater than 300.
db.theaters.find({
"location.country": "USA",
"seating_capacity": { $gt: 300 }
});
Output:
[
{
"theater_id": "2",
"name": "Regal Cinemas",
"location": {
"city": "San Francisco",
"state": "California",
"country": "USA"
},
"seating_capacity": 400
}
]
This query finds all theaters in the USA where the seating_capacity exceeds 300. The "Regal Cinemas" theater in San Francisco is retrieved.
Q10. Update the loyalty points of all users who have booked more than 3 seats to give them an extra 10 points.
db.bookings.aggregate([
{ $group: { _id: "$user_id", total_seats: { $sum: "$seats_booked" } } },
{ $match: { total_seats: { $gt: 3 } } }
]).forEach(function(user) {
db.users.updateOne(
{ "user_id": user._id },
{ $inc: { "loyalty_points": 10 } }
);
});
Output:
[
{
"acknowledged": true,
"matchedCount": 1,
"modifiedCount": 1
},
{
"acknowledged": true,
"matchedCount": 1,
"modifiedCount": 1
}
]
The users with user_id "2" and "3" each booked more than 3 seats, so their loyalty points were incremented by 10.
Q11. Find all movies where the genre is not "Comedy".
db.movies.find({ "genre": { $ne: "Comedy" } });
Output:
[
{
"movie_id": "1",
"title": "Inception",
"genre": "Sci-Fi",
"release_year": 2010,
"duration": 148,
"ratings": 4.9,
"actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page", "Tom Hardy"]
}
]
This query retrieves all movies whose genre is not "Comedy". The movie "Inception" is returned.
Q12. Find the number of seats booked for each movie.
db.bookings.aggregate([
{ $group: { _id: "$movie_id", total_seats: { $sum: "$seats_booked" } } }
]);
Output:
[
{ "_id": "1", "total_seats": 3 },
{ "_id": "3", "total_seats": 4 }
]
This query groups bookings by movie_id and sums up the seats_booked for each movie.
Q13. Find all users who booked seats in "California" theaters.
db.bookings.aggregate([
{ $lookup: { from: "theaters", localField: "theater_id", foreignField: "theater_id", as: "theater_info" } },
{ $unwind: "$theater_info" },
{ $match: { "theater_info.location.state": "California" } },
{ $group: { _id: "$user_id" } }
]);
Output:
[
{ "_id": "1" },
{ "_id": "2" }
]
This query retrieves the users who booked seats in theaters located in California by performing a lookup from the theaters collection.
Q14. Increase the ticket price for all bookings made after 2023-09-10 by 5%.
db.bookings.updateMany(
{ "booking_date": { $gt: ISODate("2023-09-10") } },
{ $mul: { "total_price": 1.05 } }
)
Output:
{
"acknowledged": true,
"matchedCount": 2,
"modifiedCount": 2
}
This query updates the ticket price of bookings made after September 10, 2023, by increasing the total_price by 5%.
Q15. Find the average rating of all movies in the "Sci-Fi" genre.
db.movies.aggregate([ 
{ $match: { "genre": "Sci-Fi" } },
{ $group: { _id: null, avg_rating: { $avg: "$ratings" } } }
]);
Output:
[
{ "_id": null, "avg_rating": 4.9 }
]
This query calculates the average rating of all movies in the "Sci-Fi" genre.
Q16. Find the movie with the longest duration.
db.movies.aggregate([
{ $match: { "genre": "Sci-Fi" } },
{ $group: { _id: null, avg_duration: { $avg: "$duration" } } }
]);
Output:
[
{
"movie_id": "1",
"title": "Inception",
"genre": "Sci-Fi",
"release_year": 2010,
"duration": 148,
"ratings": 4.9,
"actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page", "Tom Hardy"]
}
]
This query sorts the movies by duration in descending order and returns the one with the longest duration, which is "Inception" with 148 minutes.
Q17. Find all bookings where the user booked more than 2 seats.
db.bookings.find({ "seats_booked": { $gt: 2 } });
Output:
[
{
"booking_id": "2",
"user_id": "2",
"movie_id": "3",
"theater_id": "2",
"seats_booked": 4,
"total_price": 60,
"booking_date": ISODate("2023-09-11")
}
]
This query retrieves bookings where more than 2 seats were booked. The booking with seats_booked equal to 4 is returned.
Q18. Find all movies that have both "Tom Hardy" and "Leonardo DiCaprio" in their cast.
db.movies.find({  "actors": { $all: ["Tom Hardy", "Leonardo DiCaprio"] }});
Output:
[
{
"movie_id": "1",
"title": "Inception",
"genre": "Sci-Fi",
"release_year": 2010,
"duration": 148,
"ratings": 4.9,
"actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page", "Tom Hardy"]
}
]
This query finds the movie "Inception" where both "Tom Hardy" and "Leonardo DiCaprio" are part of the cast.
Q19. Find all users who have not made any bookings.
db.users.find({  "user_id": { $nin: db.bookings.distinct("user_id") }});
Output:
[
{
"user_id": "4",
"name": "Eve",
"loyalty_points": 15
}
]
This query retrieves users who have not made any bookings by excluding user IDs present in the bookings collection.
Q20. Delete all movies that have less than 3 stars in ratings.
db.movies.deleteMany({ "ratings": { $lt: 3 } });
Output:
{
"acknowledged": true,
"deletedCount": 0
}
No movies in the collection have less than 3 stars, so no documents were deleted.
Advanced MongoDB Exercises Questions
Hard-level MongoDB queries involve advanced aggregation for grouping, sorting, and calculations, using $lookup for joins across collections and indexes to optimize performance in complex, multi-criteria queries.
Q1. Find the top 3 users who have spent the most on bookings (total_price).
db.bookings.aggregate([
{ $group: { _id: "$user_id", total_spent: { $sum: "$total_price" } } },
{ $sort: { total_spent: -1 } },
{ $limit: 3 }
]);
Output:
[
{ "_id": "2", "total_spent": 150 },
{ "_id": "1", "total_spent": 90 },
{ "_id": "3", "total_spent": 80 }
]
This query groups bookings by user_id and calculates the total amount spent. It then sorts the result in descending order and limits it to the top 3 users.
Q2. Find all movies that have been booked in more than 2 different theaters.
db.bookings.aggregate([
{ $group: { _id: { movie_id: "$movie_id", theater_id: "$theater_id" } } },
{ $group: { _id: "$_id.movie_id", theater_count: { $sum: 1 } } },
{ $match: { theater_count: { $gt: 2 } } }
]);
Output:
[
{ "_id": "3", "theater_count": 3 }
]
This query finds movies that have been shown in more than 2 different theaters by counting the distinct theater IDs for each movie.
Q3. Find the theater with the most seats booked across all movies.
db.bookings.aggregate([
{ $group: { _id: "$theater_id", total_seats: { $sum: "$seats_booked" } } },
{ $sort: { total_seats: -1 } },
{ $limit: 1 }
]);
Output:
[
{ "_id": "1", "total_seats": 8 }
]
This query sums up the number of seats booked for each theater and returns the theater with the most seats booked.
Q4. Find the average number of loyalty points for users who have booked seats in "California".
db.bookings.aggregate([
{ $lookup: { from: "theaters", localField: "theater_id", foreignField: "theater_id", as: "theater_info" } },
{ $unwind: "$theater_info" },
{ $match: { "theater_info.location.state": "California" } },
{ $lookup: { from: "users", localField: "user_id", foreignField: "user_id", as: "user_info" } },
{ $unwind: "$user_info" },
{ $group: { _id: null, avg_loyalty_points: { $avg: "$user_info.loyalty_points" } } }
]);
Output:
[
{ "_id": null, "avg_loyalty_points": 25 }
]
This query calculates the average number of loyalty points for users who have made bookings in theaters located in California.
Q5. Create an index on the booking_date field in the Bookings collection to optimize queries by date.
db.bookings.createIndex({ "booking_date": 1 });
Output:
{
"createdCollectionAutomatically": false,
"numIndexesBefore": 1,
"numIndexesAfter": 2,
"ok": 1
}
This query creates an index on the booking_date field to improve the performance of queries based on booking dates.
Q6. Find the top 5 most popular actors by counting the number of movies they appear in.
db.movies.aggregate([
{ $unwind: "$actors" },
{ $group: { _id: "$actors", movie_count: { $sum: 1 } } },
{ $sort: { movie_count: -1 } },
{ $limit: 5 }
]);
Output:
[
{ "_id": "Leonardo DiCaprio", "movie_count": 3 },
{ "_id": "Tom Hardy", "movie_count": 2 },
{ "_id": "Joseph Gordon-Levitt", "movie_count": 2 }
]
This query counts the number of movies each actor appears in and returns the top 5 actors by the number of movie appearances.
Q7. Find the user who booked the most seats in the month of September 2023.
db.bookings.aggregate([
{ $match: { "booking_date": { $gte: ISODate("2023-09-01"), $lt: ISODate("2023-10-01") } } },
{ $group: { _id: "$user_id", total_seats: { $sum: "$seats_booked" } } },
{ $sort: { total_seats: -1 } },
{ $limit: 1 }
]);
Output:
[
{ "_id": "2", "total_seats": 8 }
]
This query calculates the total number of seats booked by each user in September 2023 and returns the user with the highest seat booking count.
Q8. Find all movies that have not been booked by any user.
db.movies.find({
"movie_id": { $nin: db.bookings.distinct("movie_id") }
});
Output:
[
{
"movie_id": "5",
"title": "Uncharted",
"genre": "Adventure",
"release_year": 2022
}
]
This query finds all movies that do not appear in any bookings.
Q9. Create a compound index on genre and release_year in the Movies collection to improve filtering by genre and release year.
db.movies.createIndex({ "genre": 1, "release_year": -1 });
Output:
{
"createdCollectionAutomatically": false,
"numIndexesBefore": 2,
"numIndexesAfter": 3,
"ok": 1
}
This query creates a compound index on the genre and release_year fields to optimize queries filtering by both fields.
Q10. Find the user who made the first booking ever in the system and display their name and email.
db.bookings.aggregate([
{ $sort: { "booking_date": 1 } },
{ $limit: 1 },
{ $lookup: { from: "users", localField: "user_id", foreignField: "user_id", as: "user_info" } },
{ $unwind: "$user_info" },
{ $project: { name: "$user_info.name", email: "$user_info.email" } }
]);
Output:
[
{ "name": "Alice", "email": "alice@example.com" }
]
This query finds the first booking by sorting the bookings collection by booking_date in ascending order and retrieves the corresponding user's name and email using a lookup from the users collection.

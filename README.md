# Digital_streaming_analytics

**Overview**

This repository contains SQL scripts for a project named digital_streaming.The database includes tables for users, content, watch history, subscriptions, payments, and feedback.It helps analyze user activity, subscription trends, content performance, and overall revenue insights.

**Database Schema**

**Tables**

1.users
user_id: INT, Primary Key
username: VARCHAR(50)
email: VARCHAR(100)
country: VARCHAR(50)
subscription_type: VARCHAR(20)
join_date: DATE

2.content
content_id: INT, Primary Key
title: VARCHAR(100)
genre: VARCHAR(50)
content_type: VARCHAR(20) 
release_year: INT
rating: DECIMAL(2,1)

3.watch_history
watch_id: INT, Primary Key
user_id: INT, Foreign Key
content_id: INT, Foreign Key
watch_date: DATE
watch_duration: INT 
device: VARCHAR(50)

4.subscription
subscription_id: INT, Primary Key
user_id: INT, Foreign Key
plan_name: VARCHAR(50) 
start_date: DATE
end_date: DATE
status: VARCHAR(20) 

5.payment
payment_id: INT, Primary Key
subscription_id: INT, Foreign Key
payment_date: DATE
payment_method: VARCHAR(30) 
amount: DECIMAL(6,2)
transaction_status: VARCHAR(20) 

6.feedback
feedback_id: INT, Primary Key
user_id: INT, Foreign Key
content_id: INT, Foreign Key
rating: DECIMAL(2,1)
comment: VARCHAR(255)
feedback_date: DATE

**Data Insertion**

The SQL script contains INSERT statements to populate all tables with records. The data covers different types of users, content categories, and viewing activities to simulate a real-world streaming service.

**SQL Digital Streaming Queries and Insights**

Top 5 Most Watched Content:-

SELECT c.title, COUNT(w.watch_id) AS total_views
FROM watch_history w
JOIN content c ON w.content_id = c.content_id
GROUP BY c.title
ORDER BY total_views DESC
LIMIT 5;

Most Active Users (by Watch Count):-

SELECT u.username, COUNT(w.watch_id) AS total_watched
FROM users u
JOIN watch_history w ON u.user_id = w.user_id
GROUP BY u.username
ORDER BY total_watched DESC
LIMIT 5;

Average Rating for Each Content:-

SELECT c.title, ROUND(AVG(f.rating), 2) AS avg_rating
FROM feedback f
JOIN content c ON f.content_id = c.content_id
GROUP BY c.title
ORDER BY avg_rating DESC;

Total Revenue by Subscription Plan:-

SELECT s.plan_name, SUM(p.amount) AS total_revenue
FROM payment p
JOIN subscription s ON p.subscription_id = s.subscription_id
GROUP BY s.plan_name
ORDER BY total_revenue DESC;

Active vs Expired Subscriptions:-

SELECT status, COUNT(*) AS total_users
FROM subscription
GROUP BY status;

Most Common Device Used for Streaming:-

SELECT device, COUNT(*) AS usage_count
FROM watch_history
GROUP BY device
ORDER BY usage_count DESC;

Monthly Revenue Trend:-

SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month, SUM(amount) AS total_revenue
FROM payment
WHERE transaction_status = 'Success'
GROUP BY month
ORDER BY month;                                             

Top 5 Highest Rated Content:-

SELECT c.title,ROUND(AVG(f.rating), 1) AS average_rating
FROM feedback f
JOIN content c ON f.content_id = c.content_id
GROUP BY c.title
ORDER BY average_rating DESC
LIMIT 5;

Average Watch Duration per Genre:-

SELECT c.genre,ROUND(AVG(w.watch_duration), 2) AS avg_watch_time
FROM watch_history w
JOIN content c ON w.content_id = c.content_id
GROUP BY c.genre
ORDER BY avg_watch_time DESC;

User Retention Rate:-

SELECT COUNT(DISTINCT CASE WHEN status = 'Active' THEN user_id END) AS active_users, COUNT(DISTINCT user_id) AS total_users,
ROUND((COUNT(DISTINCT CASE WHEN status = 'Active' THEN user_id END) / COUNT(DISTINCT user_id)) * 100, 2) AS retention_rate
FROM subscription;

Current Date and Time:-
SELECT NOW(); SELECT DATE(NOW()); SELECT CURDATE(); SELECT DATE_FORMAT(CURDATE(), ‘%d/%m/%y’);

Date Difference:-
SELECT DATEDIFF(CURDATE(), ‘2025-09-20’);

**Usage**

1.Create Database and Tables:

Run the CREATE TABLE statements:-
CREATE DATABASE digital_streaming;
USE digital_streaming;

2.Insert Data:
Execute all the INSERT INTO statements to add data to each table.

3.Run Analysis Queries:
Use the provided SQL queries to explore insights like most watched content, active users, device usage, and subscription performance.

**Contributing**

Contributions are welcome!
If you’d like to improve this project, feel free to submit a pull request or open an issue.

**Contact**

For any questions or feedback, please contact https://www.linkedin.com/in/athulyadileep1625/ or athulyadileep012@gmail.com

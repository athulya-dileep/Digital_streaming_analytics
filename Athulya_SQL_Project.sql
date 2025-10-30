CREATE DATABASE digital_streaming;
USE digital_streaming;
CREATE TABLE users (user_id INT AUTO_INCREMENT PRIMARY KEY,username VARCHAR(50),email VARCHAR(100),country VARCHAR(50),subscription_type VARCHAR(20),join_date DATE);
INSERT INTO users (username, email, country, subscription_type, join_date) VALUES
('Arjun Mehta', 'arjun.mehta@gmail.com', 'India', 'Premium', '2024-01-05'),
('Diya Sharma', 'diya.sharma@yahoo.com', 'India', 'Standard', '2024-01-12'),
('Ravi Patel', 'ravi.patel@gmail.com', 'USA', 'Basic', '2024-02-10'),
('Sneha Das', 'sneha.das@outlook.com', 'India', 'Premium', '2024-02-25'),
('John Lewis', 'john.lewis@gmail.com', 'UK', 'Standard', '2024-03-03'),
('Priya Nair', 'priya.nair@gmail.com', 'India', 'Basic', '2024-03-08'),
('David Kim', 'david.kim@gmail.com', 'South Korea', 'Premium', '2024-03-20'),
('Riya Sen', 'riya.sen@gmail.com', 'India', 'Standard', '2024-04-02'),
('Alan George', 'alan.george@gmail.com', 'Australia', 'Basic', '2024-04-18'),
('Maya Rao', 'maya.rao@gmail.com', 'India', 'Premium', '2024-04-25'),
('Vikram Iyer', 'vikram.iyer@gmail.com', 'India', 'Basic', '2024-05-05'),
('Ananya Pillai', 'ananya.pillai@gmail.com', 'India', 'Standard', '2024-05-18'),
('Emma Brown', 'emma.brown@gmail.com', 'UK', 'Premium', '2024-06-01'),
('Raj Verma', 'raj.verma@gmail.com', 'India', 'Basic', '2024-06-14'),
('Liam Johnson', 'liam.johnson@gmail.com', 'USA', 'Standard', '2024-07-01'),
('Nisha Kaur', 'nisha.kaur@gmail.com', 'India', 'Premium', '2024-07-12'),
('Chris Lee', 'chris.lee@gmail.com', 'Singapore', 'Standard', '2024-08-05'),
('Meera Joseph', 'meera.joseph@gmail.com', 'India', 'Premium', '2024-08-20'),
('Amit Kumar', 'amit.kumar@gmail.com', 'India', 'Basic', '2024-09-04'),
('Sophia Wong', 'sophia.wong@gmail.com', 'Hong Kong', 'Premium', '2024-09-22');
SELECT * FROM users;

CREATE TABLE content (content_id INT AUTO_INCREMENT PRIMARY KEY,title VARCHAR(100),genre VARCHAR(50),content_type VARCHAR(20),release_year INT,rating DECIMAL(2,1));
INSERT INTO content (title, genre, content_type, release_year, rating) VALUES
('The Lost Kingdom', 'Action', 'Series', 2022, 8.4),
('Ocean Depths', 'Documentary', 'Movie', 2021, 7.9),
('Laugh Out Loud', 'Comedy', 'Series', 2023, 8.1),
('Midnight Shadows', 'Thriller', 'Movie', 2020, 8.6),
('Future World', 'Sci-Fi', 'Movie', 2024, 8.8),
('Cooking With Heart', 'Reality', 'Series', 2021, 7.3),
('Dance Fever', 'Reality', 'Series', 2022, 7.5),
('Hidden Truth', 'Drama', 'Movie', 2023, 8.2),
('Love Beyond Time', 'Romance', 'Movie', 2021, 7.8),
('World of Wonders', 'Documentary', 'Series', 2022, 8.0),
('Cyber Quest', 'Action', 'Movie', 2023, 8.7),
('Haunted Hills', 'Horror', 'Movie', 2020, 7.9),
('Street Beats', 'Music', 'Series', 2023, 8.3),
('Planet Pulse', 'Documentary', 'Series', 2024, 8.1),
('Code of Silence', 'Thriller', 'Movie', 2022, 8.4),
('Mind Games', 'Mystery', 'Series', 2021, 7.7),
('Heartstrings', 'Romance', 'Movie', 2022, 8.0),
('Comedy Central', 'Comedy', 'Series', 2020, 7.6),
('Legends Reborn', 'Action', 'Movie', 2024, 8.9),
('Nature’s Voice', 'Documentary', 'Movie', 2023, 8.2);
SELECT * FROM content;

CREATE TABLE watch_history (watch_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT,content_id INT,watch_date DATE,watch_duration INT, device VARCHAR(50),FOREIGN KEY (user_id) REFERENCES users(user_id),FOREIGN KEY (content_id) REFERENCES content(content_id));
INSERT INTO watch_history (user_id, content_id, watch_date, watch_duration, device) VALUES
(1, 1, '2024-01-10', 120, 'Mobile'),
(2, 3, '2024-01-18', 45, 'Laptop'),
(3, 2, '2024-02-15', 90, 'Smart TV'),
(4, 5, '2024-03-01', 110, 'Tablet'),
(5, 4, '2024-03-10', 95, 'Mobile'),
(6, 6, '2024-03-20', 60, 'Smart TV'),
(7, 7, '2024-04-02', 80, 'Laptop'),
(8, 8, '2024-04-05', 100, 'Smart TV'),
(9, 10, '2024-04-18', 70, 'Mobile'),
(10, 9, '2024-04-25', 95, 'Laptop'),
(11, 11, '2024-05-05', 130, 'Smart TV'),
(12, 13, '2024-05-18', 60, 'Mobile'),
(13, 15, '2024-06-01', 120, 'Laptop'),
(14, 16, '2024-06-14', 85, 'Tablet'),
(15, 18, '2024-07-01', 90, 'Mobile'),
(16, 17, '2024-07-12', 70, 'Smart TV'),
(17, 14, '2024-08-05', 100, 'Laptop'),
(18, 19, '2024-08-20', 95, 'Smart TV'),
(19, 12, '2024-09-04', 85, 'Tablet'),
(20, 20, '2024-09-22', 105, 'Mobile');
SELECT *FROM watch_history;

CREATE TABLE subscription (subscription_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT,plan_name VARCHAR(50),start_date DATE,end_date DATE,status VARCHAR(20),FOREIGN KEY (user_id) REFERENCES users(user_id));
INSERT INTO subscription (user_id, plan_name, start_date, end_date, status) VALUES
(1, 'Premium', '2024-01-05', '2025-01-05', 'Active'),
(2, 'Standard', '2024-01-12', '2025-01-12', 'Active'),
(3, 'Basic', '2024-02-10', '2024-08-10', 'Expired'),
(4, 'Premium', '2024-02-25', '2025-02-25', 'Active'),
(5, 'Standard', '2024-03-03', '2024-09-03', 'Expired'),
(6, 'Basic', '2024-03-08', '2024-09-08', 'Expired'),
(7, 'Premium', '2024-03-20', '2025-03-20', 'Active'),
(8, 'Standard', '2024-04-02', '2025-04-02', 'Active'),
(9, 'Basic', '2024-04-18', '2024-10-18', 'Expired'),
(10, 'Premium', '2024-04-25', '2025-04-25', 'Active'),
(11, 'Basic', '2024-05-05', '2024-11-05', 'Expired'),
(12, 'Standard', '2024-05-18', '2025-05-18', 'Active'),
(13, 'Premium', '2024-06-01', '2025-06-01', 'Active'),
(14, 'Basic', '2024-06-14', '2024-12-14', 'Expired'),
(15, 'Standard', '2024-07-01', '2025-07-01', 'Active'),
(16, 'Premium', '2024-07-12', '2025-07-12', 'Active'),
(17, 'Standard', '2024-08-05', '2025-08-05', 'Active'),
(18, 'Premium', '2024-08-20', '2025-08-20', 'Active'),
(19, 'Basic', '2024-09-04', '2025-03-04', 'Active'),
(20, 'Premium', '2024-09-22', '2025-09-22', 'Active');
SELECT * FROM subscription;

CREATE TABLE payment (payment_id INT AUTO_INCREMENT PRIMARY KEY,subscription_id INT,payment_date DATE,payment_method VARCHAR(30),amount DECIMAL(6,2),transaction_status VARCHAR(20),FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id));
INSERT INTO payment (subscription_id, payment_date, payment_method, amount, transaction_status) VALUES
(1, '2024-01-05', 'UPI', 999.00, 'Success'),
(2, '2024-01-12', 'Credit Card', 799.00, 'Success'),
(3, '2024-02-10', 'Debit Card', 499.00, 'Success'),
(4, '2024-02-25', 'UPI', 999.00, 'Success'),
(5, '2024-03-03', 'Credit Card', 799.00, 'Failed'),
(6, '2024-03-08', 'Debit Card', 499.00, 'Success'),
(7, '2024-03-20', 'Credit Card', 999.00, 'Success'),
(8, '2024-04-02', 'UPI', 799.00, 'Success'),
(9, '2024-04-18', 'UPI', 499.00, 'Pending'),
(10, '2024-04-25', 'Credit Card', 999.00, 'Success'),
(11, '2024-05-05', 'Debit Card', 499.00, 'Failed'),
(12, '2024-05-18', 'UPI', 799.00, 'Success'),
(13, '2024-06-01', 'Credit Card', 999.00, 'Success'),
(14, '2024-06-14', 'UPI', 499.00, 'Success'),
(15, '2024-07-01', 'Debit Card', 799.00, 'Success'),
(16, '2024-07-12', 'UPI', 999.00, 'Success'),
(17, '2024-08-05', 'Credit Card', 799.00, 'Pending'),
(18, '2024-08-20', 'Debit Card', 999.00, 'Success'),
(19, '2024-09-04', 'UPI', 499.00, 'Success'),
(20, '2024-09-22', 'Credit Card', 999.00, 'Success');
SELECT * FROM payment;

CREATE TABLE feedback (feedback_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT,content_id INT,rating DECIMAL(2,1),comment VARCHAR(255),feedback_date DATE,FOREIGN KEY (user_id) REFERENCES users(user_id),FOREIGN KEY (content_id) REFERENCES content(content_id));
INSERT INTO feedback (feedback_id, user_id, content_id, rating, comment, feedback_date)VALUES
(1, 1, 3, 5, 'Amazing series! Really engaging storyline.', '2025-07-02'),
(2, 2, 5, 4, 'Good movie but could have been shorter.', '2025-07-05'),
(3, 3, 1, 5, 'Excellent documentary, very informative.', '2025-07-08'),
(4, 4, 7, 3, 'Average show, didn’t like the pacing.', '2025-07-09'),
(5, 5, 9, 4, 'Loved the cinematography and background music.', '2025-07-10'),
(6, 6, 2, 5, 'Highly entertaining and motivating.', '2025-07-11'),
(7, 7, 10, 2, 'Did not meet expectations.', '2025-07-12'),
(8, 8, 6, 4, 'Nice concept, enjoyed watching.', '2025-07-13'),
(9, 9, 4, 3, 'Storyline was predictable.', '2025-07-15'),
(10, 10, 8, 5, 'Absolutely fantastic!', '2025-07-16'),
(11, 11, 2, 4, 'Really liked the lead actor’s performance.', '2025-07-18'),
(12, 12, 3, 3, 'Could have been better.', '2025-07-20'),
(13, 13, 7, 5, 'A masterpiece! Highly recommend.', '2025-07-22'),
(14, 14, 9, 4, 'Very emotional and powerful.', '2025-07-25'),
(15, 15, 5, 2, 'Too slow for my taste.', '2025-07-26'),
(16, 16, 1, 4, 'Informative and well presented.', '2025-07-27'),
(17, 17, 10, 5, 'Loved every moment of it.', '2025-07-28'),
(18, 18, 6, 3, 'Not as good as expected.', '2025-07-29'),
(19, 19, 8, 5, 'Very creative and entertaining.', '2025-07-30'),
(20, 20, 4, 4, 'Enjoyed it with family, good weekend watch.', '2025-07-31');
SELECT * FROM feedback;
UPDATE feedback SET comment ='Family Entertainer' WHERE  feedback_id = 10 ;

--- Top 5 Most Watched Content
SELECT c.title, COUNT(w.watch_id) AS total_views  FROM watch_history w 
JOIN content c ON w.content_id = c.content_id
GROUP BY c.title ORDER BY total_views DESC LIMIT 5;

--- Most Active Users (by Watch Count)
SELECT u.username, COUNT(w.watch_id) AS total_watched FROM users u
JOIN watch_history w ON u.user_id = w.user_id
GROUP BY u.username ORDER BY total_watched DESC LIMIT 5;

--- Average Rating for Each Content
SELECT c.title, ROUND(AVG(f.rating), 2) AS avg_rating FROM feedback f
JOIN content c ON f.content_id = c.content_id
GROUP BY c.title ORDER BY avg_rating DESC;

--- Total Revenue by Subscription Plan
SELECT s.plan_name, SUM(p.amount) AS total_revenue FROM payment p
JOIN subscription s ON p.subscription_id = s.subscription_id
GROUP BY s.plan_name ORDER BY total_revenue DESC;

--- Active vs Expired Subscriptions
SELECT status, COUNT(*) AS total_users FROM subscription GROUP BY status;

--- Most Common Device Used for Streaming
SELECT device, COUNT(*) AS usage_count FROM watch_history GROUP BY device ORDER BY usage_count DESC;

--- Monthly Revenue Trend
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,SUM(amount) AS total_revenue FROM payment WHERE transaction_status = 'Success' GROUP BY month ORDER BY month;                                             

--- Top 5 Highest Rated Content
SELECT c.title, ROUND(AVG(f.rating), 1) AS average_rating FROM feedback f
JOIN content c ON f.content_id = c.content_id
GROUP BY c.title ORDER BY average_rating DESC LIMIT 5;

--- Average Watch Duration per Genre
SELECT c.genre,ROUND(AVG(w.watch_duration), 2) AS avg_watch_time FROM watch_history w
JOIN content c ON w.content_id = c.content_id
GROUP BY c.genre ORDER BY avg_watch_time DESC;

--- User Retention Rate
SELECT COUNT(DISTINCT CASE WHEN status = 'Active' THEN user_id END) AS active_users, COUNT(DISTINCT user_id) AS total_users,
ROUND((COUNT(DISTINCT CASE WHEN status = 'Active' THEN user_id END) / COUNT(DISTINCT user_id)) * 100, 2) AS retention_rate
FROM subscription;

SELECT now(); # to get date n time
SELECT Date(now()); # to get only date
SELECT curdate(); # to get approximate current date when there are many dates
SELECT date_format(curdate(),'%d/%m/%y'); # to get desired date format
SELECT datediff(curdate(),'2024-01-18'); # to get number of days




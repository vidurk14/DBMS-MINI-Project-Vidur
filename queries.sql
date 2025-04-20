--1. Find All 2BHK Apartments Under ₹30,000


SELECT title, rent, location
FROM Apartments
WHERE bhk = 2 AND rent < 30000;

--2.Count Listings per Landlord

SELECT u.name, COUNT(a.apt_id) AS total_listings
FROM Users u
JOIN Apartments a ON u.user_id = a.landlord_id
WHERE u.role = 'Landlord'
GROUP BY u.user_id;

--3.List Unanswered Questions

SELECT q.question_text, a.title, u.name AS asked_by
FROM Questions q
JOIN Apartments a ON q.apt_id = a.apt_id
JOIN Users u ON q.user_id = u.user_id
WHERE q.answer_text IS NULL;

--4.List All Verified Landlords

SELECT user_id, name, email
FROM Users
WHERE role = 'Landlord' AND is_verified = 1;

--5.Find Apartments with Rent ≤ ₹20,000 in Bangalore

SELECT apt_id, title, rent, location
FROM Apartments
WHERE rent <= 20000 AND location LIKE '%Bangalore%';

--6.Show Top-Rated Apartments (Avg Rating ≥ 4.5)

SELECT a.title, AVG(r.rating) AS avg_rating
FROM Apartments a
JOIN Reviews r ON a.apt_id = r.apt_id
GROUP BY a.apt_id
HAVING avg_rating >= 4.5;

--7.Calculate Total Rent Collected by a Landlord

SELECT u.name, SUM(p.amount) AS total_earnings
FROM Users u
JOIN Apartments a ON u.user_id = a.landlord_id
JOIN Payments p ON a.apt_id = p.apt_id
WHERE u.user_id = 1;

--8.Search Furnished 2BHKs Near a Metro Station

SELECT title, rent, location
FROM Apartments
WHERE bhk = 2 AND furnished = 'Fully' AND location LIKE '%Metro%';

--9.List All Tenant Reviews for a Specific Apartment

SELECT u.name, r.rating, r.comment
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
WHERE r.apt_id = 1;

--10.Identify Most Active Tenants (Based on Questions/Reviews)

SELECT u.name,
       COUNT(DISTINCT q.question_id) AS questions_asked,
       COUNT(DISTINCT r.review_id) AS reviews_posted
FROM Users u
LEFT JOIN Questions q ON u.user_id = q.user_id
LEFT JOIN Reviews r ON u.user_id = r.user_id
WHERE u.role = 'Tenant'
GROUP BY u.user_id
ORDER BY (questions_asked + reviews_posted) DESC;

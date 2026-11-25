-- Beginner analysis prepared with AI assistance for Rohan to run and review.
USE `rohan_music_store`;

-- 1. How many customers does the store have?
SELECT COUNT(*) AS customer_count FROM Customer;

-- 2. What are total sales and average invoice value?
SELECT COUNT(*) AS invoice_count,
       ROUND(SUM(Total), 2) AS total_sales,
       ROUND(AVG(Total), 2) AS average_invoice_value
FROM Invoice;

-- 3. Which countries generate the most revenue?
SELECT BillingCountry, ROUND(SUM(Total), 2) AS revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY revenue DESC, BillingCountry;

-- 4. Who are the five highest-spending customers?
-- Each invoice is joined once. Joining InvoiceLine here would repeat Total.
SELECT c.CustomerId, c.FirstName, c.LastName,
       ROUND(SUM(i.Total), 2) AS total_spend
FROM Customer AS c
JOIN Invoice AS i ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY total_spend DESC, c.CustomerId
LIMIT 5;

-- 5. Which music genres generate the most revenue?
-- Use the price paid on InvoiceLine, not today's catalog price on Track.
SELECT g.Name AS genre,
       SUM(il.Quantity) AS units_sold,
       ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue
FROM InvoiceLine AS il
JOIN Track AS t ON t.TrackId = il.TrackId
JOIN Genre AS g ON g.GenreId = t.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY revenue DESC, genre;

-- 6. Which customers have no invoices?
-- A LEFT JOIN preserves customers even when no invoice matches.
SELECT c.CustomerId, c.FirstName, c.LastName
FROM Customer AS c
LEFT JOIN Invoice AS i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceId IS NULL
ORDER BY c.CustomerId;

-- 7. What does monthly revenue look like?
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS sales_month,
       ROUND(SUM(Total), 2) AS revenue
FROM Invoice
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY sales_month;

-- 8. Which invoices exceed the average invoice value?
SELECT InvoiceId, CustomerId, Total
FROM Invoice
WHERE Total > (SELECT AVG(Total) FROM Invoice)
ORDER BY Total DESC, InvoiceId;

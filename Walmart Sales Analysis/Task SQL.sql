-- Creating db
create database WalmartData;

Use WalmartData;

-- 1. Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').
SELECT * 
FROM WalmartData
WHERE Branch = 'A';

-- 2. Find the total sales for each product line.
SELECT Product_line, SUM(Total) AS Total_Sales
FROM WalmartData
GROUP BY Product_line;

-- 3. List all sales transactions where the payment method was 'Cash'.
SELECT * 
FROM WalmartData
WHERE Payment = 'Cash';

-- 4. Calculate the total gross income generated in each city.
SELECT City, SUM(gross_income) AS Total_Gross_Income
FROM WalmartData
GROUP BY City;

-- 5. Find the average rating given by customers in each branch.
SELECT Branch, AVG(Rating) AS Average_Rating
FROM WalmartData
GROUP BY Branch;

-- 6. Determine the total quantity of each product line sold.
SELECT Product_line, SUM(Quantity) AS Total_Quantity_Sold
FROM WalmartData
GROUP BY Product_line;

-- 7. List the top 5 products by unit price.
SELECT Product_line, Unit_price
FROM WalmartData
ORDER BY Unit_price DESC
LIMIT 5;

-- 8. Find sales transactions with a gross income greater than 30.
SELECT * 
FROM WalmartData
WHERE gross_income > 30;

-- 9. Retrieve sales transactions that occurred on weekends.
SELECT * 
FROM WalmartData
WHERE WEEKDAY(STR_TO_DATE(Date, '%d-%m-%Y')) IN (5, 6);  -- Assuming the date format is 'dd-mm-yyyy'

-- 10. Calculate the total sales and gross income for each month.
SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
    SUM(Total) AS Total_Sales,
    SUM(gross_income) AS Total_Gross_Income
FROM WalmartData
GROUP BY Month;

-- 11. Find the number of sales transactions that occurred after 6 PM.
SELECT COUNT(*) AS Transactions_After_6PM
FROM WalmartData
WHERE TIME_FORMAT(Time, '%H:%i:%s') > '18:00:00';

-- 12. List the sales transactions that have a higher total than the average total of all transactions.
SELECT * 
FROM WalmartData
WHERE Total > (SELECT AVG(Total) FROM WalmartData);

-- 13. Calculate the cumulative gross income for each branch by date.
SELECT 
    Branch, 
    STR_TO_DATE(Date, '%d-%m-%Y') AS Date, 
    SUM(gross_income) OVER(PARTITION BY Branch ORDER BY STR_TO_DATE(Date, '%d-%m-%Y')) AS Cumulative_Gross_Income
FROM WalmartData
ORDER BY Branch, Date;


--------Project 2 ------------

SELECT * FROM [dbo].[Customer_Data]

-------retrieve the total number of customers from each region-----------
SELECT Region, COUNT(CustomerID) AS TotalCustomers FROM [dbo].[Customer_Data]
WHERE Region IS NOT NULL
GROUP BY Region

-------Find the most popular subscription type by the Number of customers --------
SELECT SubscriptionType, COUNT(CustomerID) AS TotalCustomers FROM [dbo].[Customer_Data]
WHERE SubscriptionType IS NOT NULL
GROUP BY SubscriptionType
ORDER BY TotalCustomers DESC

-----Find customers who canceled their subscription within 6 months ---------
SELECT CustomerID,CustomerName,SubscriptionStart,SubscriptionEnd FROM [dbo].[Customer_Data]
WHERE SubscriptionEnd IS NOT NULL
AND SubscriptionEnd >= DATEADD(MONTH, -6, GETDATE())

-------Calculate the average subscription duration for all customers--------
SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM [dbo].[Customer_Data]
WHERE SubscriptionEnd IS NOT NULL

--------Find customers with subscriptions longer than 12 months ------
SELECT CustomerID,CustomerName,SubscriptionStart,SubscriptionEnd
FROM [dbo].[Customer_Data]
WHERE DATEDIFF(DAY,SubscriptionStart,SubscriptionEnd) > 365

------ Calculate total revenue by subscription type ---------
SELECT SubscriptionType,SUM(Revenue) AS TotalRevenue
FROM [dbo].[Customer_Data]
WHERE SubscriptionType IS NOT NULL
GROUP BY SubscriptionType
ORDER BY TotalRevenue DESC

--------find the top 3 regions by subscription cancellations ---------
SELECT TOP 3 Region,COUNT(Canceled) AS TotalCancellations
FROM [dbo].[Customer_Data]
WHERE SubscriptionEnd IS NOT NULL
GROUP BY Region
ORDER BY TotalCancellations DESC

---------Find the total number of active and canceled subscriptions -------
SELECT
    SUM(CASE WHEN SubscriptionEnd IS  NULL THEN 1 ELSE 0 END) AS ActiveSubscriptions,
    SUM(CASE WHEN SubscriptionEnd IS NOT NULL THEN 1 ELSE 0 END) AS CanceledSubscriptions
FROM [dbo].[Customer_Data]
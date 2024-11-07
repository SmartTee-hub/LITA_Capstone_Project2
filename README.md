# LITA_Capstone_Project2
### Project Title:Customer Segmentation for a Subscription Service 

[Project Overview](#project-Overview)

[Data Sources](#Data-Sources)

[Tools Used](Tools-Used)

[Data Cleaning and preparations](Data-Cleaning-and-preparations)

[Data Analysis](#Data-Analysis)

[Data Visualization](Data-Visualization)

[Result and Findings](Result-and-Findings)

[Recommendation](Recommendation)

[Contribution](Contribution)
### Project Overview:
---
This project aims to generate insight into Customer Segmentation for a Subscription Service by using Excel, SQL, and Power BI to analyze subscription data, identify key customer segments(behavior), track subscription types, and identify key trends in cancellations and renewals to optimize customer retention strategies.

### Data Sources
---
The primary source of Data used here is Data subcription.csv and this is an open source data that was given by Incubator Hub 

### Tools Used
---
- Microsoft Excel is a versatile tool used for a wide range of numerical tasks, including: 
  1. for Data cleaning
  2. For Data Analysis 
  3. Financial Modeling
  4. For Data Management
  5. for Data visualization.
     
- SQL - Structured Query Language SQL is a powerful language for managing and manipulating relational databases. Here are some of its key uses:
   1. Data Retrieval
   2. Data Manipulation
   3. Data Definition
   4. Data Control.
      
- Power BI - is a powerful Business Intelligence tool used for:
  1. Data Integration
  2. Data Transformation
  3. Data Modeling
  4. Data Visualization
  5. Data Analysis
  6. Data Storytelling.

### Data Cleaning and preparations
---
  In the initial phase of the data cleansing and preparations, we perform the following action;
  1. Data loading and inspection
  2. handling missing variables
  3. Data cleansing and formatting.

 ### Exploratory Data Analysis
 ---
EDA involved the exploring of the data to answer some questions about the data such as;
- What is Customer Behavior
- What is the Subscription Types
- What is the key trends in Cancellations and Renewals?

  
  ### Data Analysis
---
This is where we include some basic lines of code or queries or even some of the DAX expressions used during your analysis;

``` SQL
SELECT * FROM [dbo].[Customer_Data]

SELECT Region, COUNT(CustomerID) AS TotalCustomers FROM [dbo].[Customer_Data]
WHERE Region IS NOT NULL
GROUP BY Region


SELECT SubscriptionType, COUNT(CustomerID) AS TotalCustomers FROM [dbo].[Customer_Data]
WHERE SubscriptionType IS NOT NULL
GROUP BY SubscriptionType
ORDER BY TotalCustomers DESC


SELECT CustomerID,CustomerName,SubscriptionStart,SubscriptionEnd FROM [dbo].[Customer_Data]
WHERE SubscriptionEnd IS NOT NULL
AND SubscriptionEnd >= DATEADD(MONTH, -6, GETDATE())


SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM [dbo].[Customer_Data]
WHERE SubscriptionEnd IS NOT NULL


SELECT CustomerID,CustomerName,SubscriptionStart,SubscriptionEnd
FROM [dbo].[Customer_Data]
WHERE DATEDIFF(DAY,SubscriptionStart,SubscriptionEnd) > 365


SELECT SubscriptionType,SUM(Revenue) AS TotalRevenue
FROM [dbo].[Customer_Data]
WHERE SubscriptionType IS NOT NULL
GROUP BY SubscriptionType
ORDER BY TotalRevenue DESC


SELECT TOP 3 Region,COUNT(Canceled) AS TotalCancellations
FROM [dbo].[Customer_Data]
WHERE SubscriptionEnd IS NOT NULL
GROUP BY Region
ORDER BY TotalCancellations DESC


SELECT
    SUM(CASE WHEN SubscriptionEnd IS  NULL THEN 1 ELSE 0 END) AS ActiveSubscriptions,
    SUM(CASE WHEN SubscriptionEnd IS NOT NULL THEN 1 ELSE 0 END) AS CanceledSubscriptions
FROM [dbo].[Customer_Data]
```

### Data Visualization
---
![Project 2 Table](https://github.com/user-attachments/assets/f4ab75af-3b06-4d90-9fdf-605290f648fa) ![Project 2 Pivot](https://github.com/user-attachments/assets/7042c529-7a4b-438a-a0f1-718d54150ed0)
![Project 2 Graph](https://github.com/user-attachments/assets/073de925-caf0-4fac-91b4-3eb4742a046f)
![Project 2 PowerBI](https://github.com/user-attachments/assets/2570470f-9a17-43a3-9f0c-4d8ac6fbdf30)

### Result and Findings
---
The analysis reveals that Shoes was the top-selling product, with the South region demonstrating the highest demand, purchasing 546,300 units, significantly more than the East (37,200) and West (29,880) regions.

The analysis indicates that the South region exhibited the highest overall Regional sales performance, generating a total revenue of 927,820. This significantly surpasses the sales figures for the East (485,925), North (387,000), and West (300,345) regions.This suggests a strong demand for various product categories, including shoes, socks, gloves, hats, jackets, and shirts, within the South region.

The analysis reveals that February was the peak sales month in both 2023 and 2024, with sales of 247,500 and 298,800, respectively. In contrast, the lowest sales were recorded in April 2023 (7,425) and July 2024 (37,200). The total annual sales for 2023 and 2024 were 1,105,330 and 995,760, respectively and the Grand Total is 2,101,090.

### Recommendation
---
Recommendations: Capitalize on South's shoe demand, diversify product offerings in other regions, leverage peak sales periods, optimize inventory, analyze seasonal trends, and continuously adapt to market changes.
### Contribution
---

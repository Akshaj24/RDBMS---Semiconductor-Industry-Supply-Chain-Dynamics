-- Show the semiconductor wafer testing pass rates for each foundry, broken down by the different testing methods including wafer testing, functional testing, and visual inspection.
--SQL_code

SELECT
f.Name AS Foundry,
round(100*count(case when t.Wafer_testing='Passed'then 1
end)/count(t.Wafer_testing),2) as Wafer,
round(100*count(case when t.Functional_testing='Passed'then 1
end)/count(t.Wafer_testing),2) AS Functional,
round(100*count(case when t.Visual_Inspection='Passed'then 1
end)/count(t.Wafer_testing),2) AS Visual,
ROUND(SUM(CASE WHEN t.ATE = 'Basic' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2)
AS Basic_ATE,
ROUND(SUM(CASE WHEN t.ATE = 'Intermediate' THEN 1 ELSE 0 END) / COUNT(*) *
100, 2) AS Intermediate_ATE,
ROUND(SUM(CASE WHEN t.ATE = 'Advanced' THEN 1 ELSE 0 END) / COUNT(*) *
A100, 2) AS Advanced_ATE
FROM Foundry f
JOIN Testing t ON f.Foundry_ID = t.Foundry_ID
GROUP BY f.Name;

/*
2. Which chip designs have the best performance-to-cost ratio based on clock speed, number of cores, and power consumption? Performance-to-Cost Ratio
The Performance-to-Cost Ratio is a metric used to evaluate the efficiency or value of a
product, system, or service in terms of its performance relative to its cost. In the
context of chip design or any technology product, this ratio can be particularly
insightful for comparing different designs or models.
The Performance-to-Cost Ratio is calculated by dividing a measure of the product's
performance by its cost. A higher ratio indicates that you're getting more performance
per unit of cost, which is generally desirable. For instance, if you have two chip designs
and one has twice the performance of the other but costs the same, it will have a
higher Performance-to-Cost Ratio.
The Performance-to-Cost Ratio is calculated as follows:
● Performance: Estimated by multiplying the clock speed by the number of cores.
It's a simplistic measure, assuming that higher clock speeds and more cores
directly translate to better performance.
● Cost: The total cost of designing the chip, which includes the costs of various
components like clock speed technology, core technology, cache memory, etc.
The ratio is then used to compare different chip designs, indicating which designs offer
more processing power per unit of cost. This analysis is valuable in product
development and strategic decision-making, particularly in industries where both
performance and cost efficiency are crucial.
*/

SELECT
DesignSub.Design_ID,
ClockSpeedSub.Clock_Speed,
NumCoreSub.Number_of_Cores,
TechSub.Technology_Used,
CacheMemSub.Cache_Memory,
PowerSub.Power,
DesignSub.Total_Cost,
(CAST(SUBSTRING_INDEX(ClockSpeedSub.Clock_Speed, ' ', 1) AS
UNSIGNED) * NumCoreSub.Number_of_Cores / DesignSub.Total_Cost) AS
Performance_Cost_Ratio
FROM
(SELECT
d.Design_ID,
d.CS_ID,
d.Core_ID,
d.Tech_ID,
d.Cache_ID,
d.Power_ID,
(cs.Cost + t.Cost + nc.Cost + cm.Cost + p.Cost) AS Total_Cost
FROM
Design d
JOIN Clock_Speed cs ON d.CS_ID = cs.CS_ID
JOIN Technology t ON d.Tech_ID = t.Tech_ID
JOIN Num_Core nc ON d.Core_ID = nc.Core_ID
JOIN Cache_Memory cm ON d.Cache_ID = cm.Cache_ID
JOIN Power p ON d.Power_ID = p.Power_ID
) AS DesignSub
JOIN Clock_Speed ClockSpeedSub ON DesignSub.CS_ID =
ClockSpeedSub.CS_ID
JOIN Num_Core NumCoreSub ON DesignSub.Core_ID = NumCoreSub.Core_ID
JOIN Technology TechSub ON DesignSub.Tech_ID = TechSub.Tech_ID JOIN
Cache_Memory CacheMemSub ON DesignSub.Cache_ID =
CacheMemSub.Cache_ID
JOIN Power PowerSub ON DesignSub.Power_ID = PowerSub.Power_ID
ORDER BY
Performance_Cost_Ratio DESC;



-- 1. Matching Purchase Orders with customers and number of chips :

SELECT po.Order_ID, COUNT(c.Chip_ID) AS NumberOfChips, cust.Name FROM
Purchase_Order po
JOIN Chip c ON po.Order_ID = c.Order_ID JOIN Customer cust ON po.Customer_ID =
cust.Customer_ID
GROUP BY po.Order_ID, cust.Name;
/*
Justification -
● This query is essential for financial reporting and supply chain management as it aligns
product output (chips) with customer orders.
● It enables the company to monitor production efficiency and customer fulfillment.
Moreover, it serves as a foundation for customer relationship management, inventory
tracking, and revenue forecasting by showing the number of chips each customer is
receiving.
*/


--2. Calculating Chip Costs :
--Chip_cost being a derivable attribute , we need this query to calculate cost required to manufacture a chip.


SELECT Chip_ID, Design.Design_ID,
(SELECT ROUND(SUM(Cost)) FROM Power WHERE Power.Power_ID = Design.Power_ID)
+
(SELECT ROUND(SUM(Cost)) FROM Cache_Memory WHERE Cache_Memory.Cache_ID =
Design.Cache_ID) +
(SELECT ROUND(SUM(Cost)) FROM Num_Core WHERE Num_Core.Core_ID =
Design.Core_ID) +
(SELECT ROUND(SUM(Cost)) FROM Technology WHERE Technology.Tech_ID =
Design.Tech_ID) +
(SELECT ROUND(SUM(Cost)) FROM Clock_Speed WHERE Clock_Speed.CS_ID =
Design.CS_ID)
AS ChipCost FROM Chip JOIN Design ON Chip.Design_ID = Design.Design_ID;

/*
Justification -
● This query is vital for cost analysis and pricing strategy as it provides a detailed
breakdown of each chip's production cost.
● By aggregating the costs of individual components, it helps in identifying the most
expensive parts of the chip's design, which could be targeted for cost reduction efforts.
Additionally, it informs pricing decisions to ensure profitability and competitiveness in the
market.
*/

--Calculating Batch Cost -

SELECT WaferBatch.Batch_ID, ROUND(SUM(ChipCost), 0) AS BatchCost FROM (SELECT
Chip.Batch_ID, Chip.Chip_ID,
(SELECT SUM(Cost) FROM Power WHERE Power.Power_ID = Design.Power_ID)
+(SELECT SUM(Cost) FROM Cache_Memory WHERE Cache_Memory.Cache_ID
=
Design.Cache_ID) + (SELECT SUM(Cost) FROM Num_Core WHERE
Num_Core.Core_ID = Design.Core_ID) + (SELECT SUM(Cost) FROM Technology
WHERE Technology.Tech_ID = Design.Tech_ID) + (SELECT SUM(Cost) FROM
Clock_Speed WHERE Clock_Speed.CS_ID = Design.CS_ID)
AS ChipCost FROM Chip JOIN Design ON Chip.Design_ID = Design.Design_ID) AS
ChipCosts JOIN WaferBatch ON ChipCosts.Batch_ID = WaferBatch.Batch_ID
GROUP BY WaferBatch.Batch_ID;

/*
Justification -
● This query is significant for financial management as it provides a cost analysis at the
batch level, which is crucial for understanding the economics of production runs.
● By knowing the cost associated with each wafer batch, the company can make informed
decisions about production planning, cost control, and price setting for the chips. It also
aids in identifying which batches are more cost-effective, guiding potential process
improvements or design changes.
*/

--Calculating the Financial Overview -


SELECT po.Order_ID, ROUND(SUM(d.Cost)) AS TotalCostValue, ROUND(SUM(d.Cost) * (1
+ MarginPercentage / 100)) AS TotalSellingValue, ROUND(SUM(d.Cost) *
(MarginPercentage / 100)) AS Profit, ROUND(MarginPercentage, 2) AS MarginPercentage,
ROUND((SUM(d.Cost) * (1 + MarginPercentage / 100)) / 5) AS AverageOrderValue
FROM Purchase_Order po
JOIN Chip c ON po.Order_ID = c.Order_ID
JOIN (SELECT Design_ID, (SELECT SUM(Cost) FROM Power WHERE Power_ID =
Design.Power_ID) + (SELECT SUM(Cost) FROM Cache_Memory WHERE Cache_ID =
Design.Cache_ID) + (SELECT SUM(Cost) FROM Num_Core WHERE Core_ID =
Design.Core_ID) + (SELECT SUM(Cost) FROM Technology WHERE Tech_ID =
Design.Tech_ID) + (SELECT SUM(Cost) FROM Clock_Speed WHERE CS_ID =
Design.CS_ID) AS Cost FROM Design) d ON c.Design_ID = d.Design_ID JOIN (SELECT
Order_ID, CASE Order_ID WHEN 'ORD001' THEN 18.3 WHEN 'ORD002' THEN 19. WHEN
'ORD003' THEN 22.4 WHEN 'ORD004' THEN 23.0 WHEN 'ORD005' THEN 19.8 ELSE 23.0
END AS MarginPercentage FROM Purchase_Order) AS po_margins ON po.Order_ID =
po_margins.Order_ID GROUP BY po.Order_ID, MarginPercentage;

/*
Justification -
● This query is essential for financial analysis and reporting. It helps in understanding the
profitability of each order by calculating the cost, selling value, and profit, accounting for
the margin.
● The average order value is also determined under the assumption that each purchase
order consists of five chips, which can help in assessing the revenue per unit and making
informed decisions about pricing strategies and discount policies.
*/



--Customer Centric Dashboard (Visualization) -


SELECT cust.Name AS CustomerName, COUNT(distinct po.Order_ID) AS
NumberOfPurchaseOrders, COUNT(c.Chip_ID) AS NumberOfChips,
ROUND(SUM(ChipCosts.ChipCost), 2) AS TotalCostValue,
ROUND(SUM(ChipCosts.ChipCost * (1 + po_margins.MarginPercentage / 100)), 2) AS
TotalSellingValue, ROUND(SUM(ChipCosts.ChipCost * (1 +
po_margins.MarginPercentage / 100)) - SUM(ChipCosts.ChipCost), 2) AS Profit,
ROUND(AVG(ChipCosts.ChipCost), 2) AS AverageCostPerChip,
ROUND(AVG(ChipCosts.ChipCost * (1 + po_margins.MarginPercentage / 100)), 2) AS
AverageSellingPricePerChip, ROUND(AVG(po_margins.MarginPercentage), 2) AS
AverageMarginPercentage FROM Customer cust JOIN Purchase_Order po ON
cust.Customer_ID = po.Customer_ID JOIN Chip c ON po.Order_ID = c.Order_ID JOIN
(SELECT d.Design_ID, ROUND((SELECT SUM(Cost) FROM Power WHERE
Power.Power_ID = d.Power_ID) + (SELECT SUM(Cost) FROM Cache_Memory WHERE
Cache_Memory.Cache_ID = d.Cache_ID) + (SELECT SUM(Cost) FROM Num_Core WHERE
Num_Core.Core_ID = d.Core_ID) + (SELECT SUM(Cost) FROM Technology WHERE
Technology.Tech_ID = d.Tech_ID) + (SELECT SUM(Cost) FROM Clock_Speed WHERE
Clock_Speed.CS_ID = d.CS_ID), 2) AS ChipCost FROM Design d) ChipCosts ON
c.Design_ID = ChipCosts.Design_ID JOIN (SELECT Order_ID, CASE Order_ID WHEN
'ORD001' THEN 18.3 WHEN 'ORD002' THEN 19.7 WHEN 'ORD003' THEN 22.4 WHEN
'ORD004' THEN 23.0 WHEN 'ORD005' THEN 19.8 ELSE 23.0 END AS MarginPercentage
FROM Purchase_Order ) po_margins ON po.Order_ID = po_margins.Order_ID GROUP BY
cust.Name;
SELECT cust.Name AS CustomerName, COUNT(distinct po.Order_ID) AS
NumberOfPurchaseOrders, COUNT(c.Chip_ID) AS NumberOfChips,
ROUND(SUM(ChipCosts.ChipCost), 2) AS TotalCostValue,
ROUND(SUM(ChipCosts.ChipCost * (1 + po_margins.MarginPercentage / 100)), 2) AS
TotalSellingValue, ROUND(SUM(ChipCosts.ChipCost * (1 +
po_margins.MarginPercentage / 100)) - SUM(ChipCosts.ChipCost), 2) AS Profit,
ROUND(AVG(ChipCosts.ChipCost), 2) AS AverageCostPerChip,
ROUND(AVG(ChipCosts.ChipCost * (1 + po_margins.MarginPercentage / 100)), 2) AS
AverageSellingPricePerChip, ROUND(AVG(po_margins.MarginPercentage), 2) AS
AverageMarginPercentage FROM Customer cust JOIN Purchase_Order po ON
cust.Customer_ID = po.Customer_ID JOIN Chip c ON po.Order_ID = c.Order_ID JOIN
(SELECT d.Design_ID, ROUND(( SELECT SUM(Cost) FROM Power WHERE
Power.Power_ID = d.Power_ID) + (SELECT SUM(Cost) FROM Cache_Memory WHERE
Cache_Memory.Cache_ID = d.Cache_ID) +(SELECT SUM(Cost) FROM Num_Core WHERE
Num_Core.Core_ID = d.Core_ID) + (SELECT SUM(Cost) FROM Technology WHERE
Technology.Tech_ID = d.Tech_ID) + (SELECT SUM(Cost) FROM Clock_Speed WHERE
Clock_Speed.CS_ID = d.CS_ID), 2) AS ChipCost FROM Design d ) ChipCosts ON
c.Design_ID = ChipCosts.Design_ID JOIN ( SELECT Order_ID, CASE Order_ID WHEN
'ORD001' THEN 18.3 WHEN 'ORD002' THEN 19.7 WHEN 'ORD003' THEN 22.4 WHEN
'ORD004' THEN 23.0 WHEN 'ORD005' THEN 19.8 ELSE 23.0 END AS MarginPercentage
FROM Purchase_Order) po_margins ON po.Order_ID = po_margins.Order_ID GROUP BY
cust.Name;


/* 
Problem Statement
Which semiconductor foundry exhibits the best balance of production efficiency, cost
management, and order fulfillment capacity?

Foundry Performance and Efficiency Analysis:
In the semiconductor industry, where production speed, cost efficiency, and the capacity to
fulfill orders are crucial, assessing the overall performance of a foundry is essential. This
involves considering not only how quickly and cost-effectively a foundry can produce
chips but also its ability to handle and complete customer orders. The following metrics
are crucial for this analysis.

Production Efficiency Rate: This measures the average number of chips produced per
day, indicating the foundry's production speed and capacity.

Cost Efficiency Ratio: This ratio reflects how cost-effectively the foundry operates,
calculated by dividing the total production cost by the average production time in days. 
It provides insight into the foundry's cost management relative to its production timeline.
Foundry Efficiency Ratio: A crucial metric for this analysis, calculated by dividing the
Production Efficiency Rate by the Cost Efficiency Ratio. A higher ratio suggests a better
balance between production speed and cost-effectiveness, indicating a more efficient
overall operation.

Total Orders: Reflects the foundry's market demand and capacity to handle customer
orders, with a higher number of orders possibly indicating better market trust and
operational capability.

This analysis aims to identify which foundry not only operates efficiently in terms of
production and cost but also effectively manages customer demands. It is invaluable for
stakeholders to understand which foundry offers the best balance of these aspects,
guiding strategic decisions, investments, and operational improvements in the highly
competitive semiconductor industry
*/

SELECT F.Name as Foundry_Name,
COUNT(DISTINCT PO.Order_ID) as Total_Orders,
COUNT(DISTINCT C.Chip_ID) as Total_Chips,
ROUND(AVG(DATEDIFF(PK.Date, PO.Date))) as Average_Production_Time_Days,
SUM(CPC.Production_Cost_Per_Chip) as Total_Production_Cost,
ROUND(SUM(CPC.Production_Cost_Per_Chip) / AVG(DATEDIFF(PK.Date, PO.Date)), 4)
as Cost_Efficiency_Ratio,
COUNT(DISTINCT C.Chip_ID) / AVG(DATEDIFF(PK.Date, PO.Date))
as Production_Efficiency_Rate,
(COUNT(DISTINCT C.Chip_ID) / AVG(DATEDIFF(PK.Date, PO.Date))) /
(SUM(CPC.Production_Cost_Per_Chip) / AVG(DATEDIFF(PK.Date, PO.Date)))
as Foundry_Efficiency_Ratio
FROM Foundry F
JOIN Testing T ON F.Foundry_ID = T.Foundry_ID
JOIN Testing_ON TON ON T.Testing_ID = TON.Testing_ID
JOIN Chip C ON TON.Chip_ID = C.Chip_ID
JOIN ( SELECT C.Chip_ID,
(CS.Cost + Tech.Cost + NC.Cost + CM.Cost + P.Cost) as Production_Cost_Per_Chip
FROM Chip C
JOIN Design D ON C.Design_ID = D.Design_ID
JOIN Clock_Speed CS ON D.CS_ID = CS.CS_ID
JOIN Technology Tech ON D.Tech_ID = Tech.Tech_ID
JOIN Num_Core NC ON D.Core_ID = NC.Core_ID
JOIN Cache_Memory CM ON D.Cache_ID = CM.Cache_ID
JOIN Power P ON D.Power_ID = P.Power_ID
) CPC ON C.Chip_ID = CPC.Chip_ID
JOIN Purchase_Order PO ON C.Order_ID = PO.Order_ID
JOIN WaferBatch WB ON C.Batch_ID = WB.Batch_ID
JOIN Packaging PK ON C.Chip_ID = PK.Chip_ID
GROUP BY F.Name
ORDER BY Foundry_Efficiency_Ratio DESC;
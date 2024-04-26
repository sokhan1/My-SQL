# -*- coding: utf-8 -*-
"""
Created on Wed Mar 27 18:48:47 2024

@author: User
"""

# VIP Visualization
import mysql.connector # To get data from database
import pandas as pd # for visualization
import matplotlib.pyplot as plt # for visualization

# Connection to my SQL

connection=mysql.connector.connect(
    host='127.0.0.2',user='root',password='',  database='')

# VIP CustomerQuery
VipQuery="""
SELECT 
	o.customerNumber,
    COUNT(DISTINCT o.orderNumber) AS order_count,
    SUM(p.amount) AS total_spent
FROM
	orders o
JOIN
	payments p ON o.customerNumber = p.customerNumber
GROUP BY
	o.customerNumber
ORDER BY
    total_spent DESC
LIMIT 10;
"""

# Loading VIP Data as DataFrame
Vip_DataFrame = pd.read_sql_query(VipQuery, connection)

# Visualize purchase frequency
plt.figure(figsize=(20,12))
plt.bar(Vip_DataFrame['customerNumber'].astype(str), Vip_DataFrame['order_count'],
        color='skyblue')
plt.xlabel('Customer Number')
plt.ylabel('Order Count')
plt.title('Visualization of VIP Order Frequency')
plt.xticks(rotation=0)
plt.show()

#Visualize purchase amount
plt.figure(figsize=(20,12))
plt.bar(Vip_DataFrame['customerNumber'].astype(str), Vip_DataFrame['total_spent'],color='lightgreen')
plt.xlabel('Customer Number')
plt.ylabel('Total spent($)')
plt.title('VIP Customers Total Spending')
plt.xticks(rotation=0)
plt.show()


#Change in purchase amount over time
PurchaseChangeQuery="""
SELECT
    p.customerNumber,
    SUM(CASE
        WHEN p.paymentDate BETWEEN '2004-01-01' AND '2004-12-30' THEN p.amount
        ELSE 0
    END) AS Previous_Period_Total,
    SUM(CASE
        WHEN p.paymentDate BETWEEN '2004-12-30' AND '2005-12-31' THEN p.amount
        ELSE 0
    END) AS Recent_Period_Total
From
    payments p
INNER JOIN(
    SELECT customerNumber
    FROM payments
    GROUP BY customerNumber
    ORDER BY SUM(amount) DESC
    ) AS Vip_Customers ON p.customerNumber = Vip_Customers.customerNumber
GROUP BY
    p.customerNumber;
"""

# Transform to DataFrame
PurchaseChange_DataFrame=pd.read_sql_query(PurchaseChangeQuery,connection)
PurchaseChange_DataFrame['PurchaseChange'] = PurchaseChange_DataFrame['Recent_Period_Total']-PurchaseChange_DataFrame['Previous_Period_Total']


#Select the top 10 customers by volume of change
TOP_10_CHANGE = PurchaseChange_DataFrame.assign(
    Abs_PurchaseChange=PurchaseChange_DataFrame['PurchaseChange'].abs()
    ).nlargest(10, 'Abs_PurchaseChange')

plt.figure(figsize=(20,12))
plt.bar(TOP_10_CHANGE['customerNumber'].astype(str),
        PurchaseChange_DataFrame.loc[TOP_10_CHANGE.index, 'PurchaseChange'],
        color='orange'
        )
plt.xlabel('CustomerNumber')
plt.ylabel('PurchaseChange in Total')
plt.title('TOP 10 VIP Customers with Largest Changes in Spending')
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

#Find the top 10 customers with the highest change in purchase amount
Increased_TOP10 =  PurchaseChange_DataFrame[PurchaseChange_DataFrame['PurchaseChange']>0] \
    .nlargest(10, 'PurchaseChange')
#Find the top 10 customers with the lowest change in purchase amount
Decreased_TOP10 =  PurchaseChange_DataFrame[PurchaseChange_DataFrame['PurchaseChange']<0] \
    .nlargest(10, 'PurchaseChange')\
    .sort_values(by='PurchaseChange', ascending=True)

#Visualize the top 10 customers with increased purchase amounts
plt.figure(figsize=(20,12))
plt.bar(Increased_TOP10['customerNumber'].astype(str), Increased_TOP10['PurchaseChange'], color='green')
plt.xlabel('Customer Number')
plt.ylabel('Increase in Total spent')
plt.title('TOP 10 Customers with Increased Spending')
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()


#Visualize the top 10 customers with decreased purchase amounts
plt.figure(figsize=(20,12))
plt.bar(Decreased_TOP10['customerNumber'].astype(str), Decreased_TOP10['PurchaseChange'], color='green')
plt.xlabel('Customer Number')
plt.ylabel('Decrease in Total spent')
plt.title('TOP 10 Customers with Decreased Spending')
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

#Finish
connection.close()

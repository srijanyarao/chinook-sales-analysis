# 🌍 Customer & Country Insights

## 🔍 Why This Analysis Matter
Revenue by Country shows which countries generate the most revenue, helping businesses understand geographic demand.

Top Customers by Lifetime Value (LTV) 

LTV = total money each customer has spent.
This helps identify:
- VIP customers
- retention opportunities
- who to target with loyalty programs


AOV is a key metric for:
- forecasting revenue
- understanding customer behavior
- designing promotions (e.g., “Spend $10, get 1 free track”)

---

## 🧠 SQL Queries

### Revenue by Country
```sql
SELECT BillingCountry, sum(Total) AS Revenue_Country
  FROM Invoice
  GROUP BY BillingCountry
  ORDER BY Revenue_Country DESC;
```

The United States is the store’s largest market, generating $523.06 in revenue — more than any other country. North America (USA + Canada) contributes over 35% of total revenue, making it the strongest region overall.
Brazil ranks #4, outperforming several European countries. This aligns with artist‑level analysis, where Brazilian artists showed strong performance, suggesting meaningful engagement from Portuguese‑speaking markets.
European countries such as France, Germany, and the United Kingdom form a stable mid‑tier revenue group, while a long tail of smaller markets contributes consistent but lower revenue.



### Top Customers by Lifetime Value (LTV) — Analysis
```sql
SELECT c.CustomerId,c.FirstName || ' ' || c.LastName AS CustomerName,
       SUM(i.Total) AS LifetimeValue
  FROM Customer  AS c
  JOIN Invoice  AS i 
    ON c.CustomerId = i.CustomerId
 GROUP BY c.CustomerId
 ORDER BY LifetimeValue DESC;
```

Customer spending is relatively consistent, with top customers such as Helena Holý, Richard Cunningham, and Luis Rojas generating between $45–50 in lifetime value. High‑value customers come from a wide range of countries, indicating a globally distributed customer base.
The clustering of LTV values reflects the synthetic nature of the dataset but still highlights the importance of identifying and retaining high‑value customers.


### Average Order Value (AOV)
```sql
SELECT AVG(Total) as AOV
  FROM Invoice
```
The average order value is approximately $5–6, which aligns with typical purchasing behavior (5–6 tracks per order at $0.99 each). This metric helps understand customer purchasing patterns and informs pricing or bundling strategies.

## 💳 Average Order Value (AOV)

<div style="
    background: #f5f8ff;
    border-left: 6px solid #4C72B0;
    padding: 15px 20px;
    width: 320px;
    border-radius: 8px;
">

### **Average Order Value**
<span style="font-size: 32px; font-weight: bold; color: #4C72B0;">
$5.65
</span>

Customers spend an average of **$5–6** per order.

</div>




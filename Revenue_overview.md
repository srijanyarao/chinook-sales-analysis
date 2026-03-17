# 📊 Revenue Overview

## 🔍 Why This Analysis Matters
Understanding revenue trends helps businesses forecast future performance, plan marketing campaigns, and identify periods of high customer engagement. Stable revenue patterns support reliable budgeting and operational planning.

Revenue Contribution by Genre shows how much each genre contributes to total revenue, expressed as a percentage.
It helps businesses understand:
- Which genres drive the most money
- Where to invest in catalog expansion
- Which genres need marketing support
- Customer taste patterns

Number of Invoices by Country shows how many orders came from each country.
It helps identify:
- Customer activity
- Market size
- Engagement levels

## 🧠 SQL Queries

### Total Revenue
```sql
SELECT SUM(Total) AS total_revenue
FROM Invoice;
```
The Chinook store generated a total of $2,328.60 in revenue across all recorded transactions. This serves as the baseline for understanding how revenue is distributed across years, months, products, and customers.

### Revenue by year
```sql
SELECT strftime('%Y', InvoiceDate) as Year, SUM(Total) as yearly_revenue
  FROM Invoice
 GROUP BY strftime('%Y', InvoiceDate)
 ORDER BY Year;
```
Revenue remained stable across the 5‑year period:
- Highest: 2010 — $481.45
- Lowest: 2009 — $449.46
- Variation between years is minimal, indicating consistent customer engagement.


### Revenue by month
```sql
SELECT strftime('%Y-%m', InvoiceDate) as Year_Month, SUM(Total) as monthly_revenue
  FROM Invoice
 GROUP BY strftime('%Y-%m', InvoiceDate)
 ORDER BY Year_Month;
 
```
Monthly revenue reveals more detailed patterns:
- 2009: Extremely stable — nearly identical revenue every month
- 2010–2012: Moderate variation with occasional spikes
- 2013: Most volatile year, with both the lowest and one of the highest monthly values



### Revenue Contribution by Genre
```sql
with Genre_Revenue_table As(
  SELECT g.Name, SUM(il.UnitPrice * il.Quantity) As Revenue_Genre
  FROM Genre AS g
  JOIN track AS t
    ON g.GenreId = t.GenreId
  JOIN InvoiceLine as il
    ON il.TrackId = t.TrackId
 GROUP BY g.GenreId
 ORDER BY Revenue_Genre DESC
)
Select Name As Genre,Revenue_Genre,
       (Revenue_Genre * 100/(Select SUM(Revenue_Genre) FROM Genre_Revenue_table)) as Percent_contribution
  FROM Genre_Revenue_table
 ORDER By Percent_contribution DESC;

```
Rock is the dominant genre, contributing 35.5% of total revenue. Latin (16.4%), Metal (11.2%), and Alternative & Punk (10.4%) form the next tier of high‑performing genres. TV Shows contribute an additional 4%, reinforcing earlier findings that episodic content performs strongly.
The remaining genres form a long tail of niche categories, each contributing less than 2% of revenue. This distribution highlights strong customer preference for rock‑oriented genres while maintaining a diverse catalog.

### Number of Invoices by Country
```sql
SELECT BillingCountry, COUNT(InvoiceId) as number_of_invoices
  FROM Invoice
 GROUP BY BillingCountry
 ORDER BY number_of_invoices DESC;
```
The United States is the most active market with 91 invoices, followed by Canada with 56. Brazil and France tie for third place with 35 invoices each, indicating strong engagement from both European and South American customers.
European countries collectively form a stable mid‑tier market, while a long tail of countries contributes consistent but lower invoice counts. This suggests a globally distributed customer base with concentrated activity in North America and Brazil.

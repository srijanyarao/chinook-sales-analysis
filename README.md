# 🎧 Chinook Sales & Revenue Analytics

A complete SQL‑based analysis of sales, revenue, customer behavior, and product performance using the Chinook digital music store dataset.

## 📌 Project Overview
This project explores the Chinook dataset to understand what drives revenue, which products perform best, and how customers behave.
The analysis covers:
- Revenue trends over time
- Top‑selling tracks, genres, and artists
- Customer lifetime value (LTV)
- Country‑level revenue patterns
- Genre contribution percentages
- Invoice activity by country
All insights are derived using SQL (SQLite) and presented in a structured, business‑focused format.

## 📊 Key Insights
1. Revenue Overview
- Total revenue: $2,328.60
- Revenue is stable across years (2009–2013)
- 2010 is the highest‑earning year
- Monthly revenue shows occasional spikes, especially in 2010 and 2011

2. Top‑Selling Tracks
- Highest‑earning tracks are TV show episodes, not music tracks
- Episodes like Pilot, Gay Witch Hunt, and Phyllis’s Wedding generated the most revenue
- Indicates strong demand for episodic content

3. Top Genres
- Rock dominates with 35.5% of total revenue
- Latin, Metal, and Alternative & Punk form the next tier
- TV Shows contribute 4%, reinforcing episodic content demand
- Long tail of niche genres (<2% each)

4. Top Artists
- Highest‑earning artists: Iron Maiden, U2, Metallica, Led Zeppelin
- Strong alignment with top genres (Rock + Metal)
- Brazilian artists (e.g., Os Paralamas Do Sucesso, Chico Buarque) perform strongly
- Revenue follows a classic long‑tail distribution

5. Revenue by Country
- USA is the largest market (523.06 revenue, 91 invoices)
- Canada is a strong secondary market
- Brazil ties with France for #3 in invoice count
- Europe shows stable mid‑tier engagement

6. Customer Lifetime Value (LTV)
- Top customer: Helena Holý with LTV 49.62
- LTV values are tightly clustered (most between 37–49)
- High‑value customers come from diverse countries


## How to Recreate the Database

This project includes:
- A Createtables.sql file
- All CSV files containing the Chinook dataset
  
You can rebuild the entire database from scratch using SQLite.

Step 1 — Open SQLite
```sql
sqlite3 chinook.sqlite
```
Step 2 — Create All Tables
```sql
.read database/Createtables.sql
```
Step 3 — Import All CSV Files
```sql
.mode csv
.headers on
.import database/customers.csv Customers
.import database/invoices.csv Invoice
.import database/invoice_items.csv InvoiceLine
.import database/tracks.csv Track
.import database/albums.csv Album
.import database/artists.csv Artist
.import database/genres.csv Genre
```
Repeat for any additional CSVs.

## 🧠 What I Learned
- How to structure SQL analysis for business storytelling
- How to interpret revenue patterns and customer behavior
- How to present insights clearly using Markdown
- How to build a clean, recruiter‑friendly GitHub project


# 🎵 Top 10 Tracks, Genre and Artists by Revenue

## 🔍 Why This Analysis Matters
Top 10 tracks This tells a business:
- TV content is high‑performing and should be promoted more.
- Customers are willing to buy multiple episodes from the same series.
- Bundling TV episodes or offering season passes could increase revenue

Top Genre tells a business:
- Rock is the core revenue driver — invest in more rock content.
- Latin and Metal are strong secondary markets.
- TV Shows are emerging as a high‑value category.
- The catalog has a long tail — many niche genres with small but steady revenue.

Top Artists tells a business:
- Customers strongly prefer classic rock and metal artists.
- These artists drive repeat purchases.
- Marketing efforts should focus on rock/metal catalogs.
- There is a long tail of artists with minimal sales — opportunity for targeted promotions.



---

## 🧠 SQL Queries

### Top 10 tracks
```sql
SELECT t.Name AS TrackName,
       SUM(il.UnitPrice * il.Quantity) AS Revenue
 FROM InvoiceLine il
 JOIN Track t ON il.TrackId = t.TrackId
 GROUP BY t.TrackId
 ORDER BY Revenue DESC
 LIMIT 10;
```
Top‑selling tracks are dominated by TV show episodes rather than music tracks. Titles like “Pilot,” “Gay Witch Hunt,” and “Phyllis’s Wedding” generated the highest revenue, each purchased multiple times. This indicates strong customer demand for episodic content and suggests opportunities for bundling or promoting TV series within the store.


### Top Genre
```sql
SELECT g.Name, SUM(il.UnitPrice * il.Quantity) As Revenue_Genre
  FROM Genre AS g
  JOIN track AS t
    ON g.GenreId = t.GenreId
  JOIN InvoiceLine as il
    ON il.TrackId = t.TrackId
 GROUP BY g.GenreId
 ORDER BY Revenue_Genre DESC;
```

Rock is the highest‑earning genre, contributing over 35% of total revenue. Latin, Metal, and Alternative & Punk also show strong performance, indicating a customer base with diverse but rock‑leaning preferences. TV Shows appear in the top 5 genres, reinforcing the trend seen in track‑level analysis that episodic content drives meaningful revenue.

### Top Artists
```sql
SELECT ar.Name, SUM(il.UnitPrice * il.Quantity) As Revenue
  FROM InvoiceLine as il
  JOIN Track as t
    ON il.TrackId = t.TrackId
  JOIN Album AS a
    ON a.AlbumId = t.AlbumId
  JOIN Artist as ar
    ON ar.ArtistId = a.ArtistId
 GROUP BY a.ArtistId
 ORDER BY Revenue DESC;
```

Top‑earning artists include U2, Iron Maiden, Led Zeppelin, and Deep Purple, all of which belong to high‑performing rock and metal genres. This consistency across tracks, genres, and artists highlights rock as the store’s strongest revenue driver. The long tail of artists with minimal revenue suggests opportunities for targeted marketing or curated playlists.

### Query Output

```text






















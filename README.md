# Spotify-Data-Analysis-using-SQL
Advanced SQL Analysis on Spotify Dataset |  Window Functions , Query Optimization &amp; Business Insights
🎵 Spotify Advanced SQL Project & Query Optimization

![spotify_logo](https://github.com/user-attachments/assets/e5406e7b-d57b-4d3b-831e-f56963a55c60)


📌 **Project Overview**

This project analyzes a Spotify dataset containing tracks, albums, artists, and streaming statistics. Using PostgreSQL, I explored the data through easy, medium, and advanced SQL queries, and applied query optimization techniques to improve performance.

The goal of this project is to:

- Strengthen advanced SQL skills (window functions, CTEs, subqueries).

- Practice real-world database optimization using EXPLAIN and indexes.

- Generate business insights such as most popular tracks, artist performance, and streaming trends.

📂 **Dataset**

The dataset includes attributes such as:

- **Track / Artist / Album / Album Type**

- **Streaming statistics**: views, likes, comments, streams

- **Audio features**: danceability, energy, tempo, liveness, valence, etc.

- **Flags**: licensed, official video, most_played_on

🚀**Project Steps**
**1. Data Exploration**

- Created a relational table in PostgreSQL (spotify).

- Explored key features like artist, track, views, likes, comments, and audio metrics.

**2. SQL Querying (Easy → Advanced)**

Queries are structured in **three** levels:

- **Easy** → filtering, aggregations, counts.

- **Medium** → grouping, averages, conditional aggregations.

- **Advanced** → window functions, CTEs, ratios, and ranking queries.

**3. Query Optimization**

To improve query performance, we carried out the following optimization process:

Initial Query Performance Analysis Using EXPLAIN

We began by analyzing the performance of a query using the EXPLAIN function.
The query retrieved tracks based on the artist column, and the performance metrics were as follows:
Execution time (E.T.): 7.1 ms
Planning time (P.T.): 0.2 ms
<img width="681" height="427" alt="Screenshot 2025-09-14 005008" src="https://github.com/user-attachments/assets/14a20a26-a068-4a8f-b851-632ee4ecd92a" />

Below is the screenshot of the EXPLAIN result before optimization:


Index Creation on the artist Column

To optimize the query performance, we created an index on the artist column. This ensures faster retrieval of rows where the artist is queried.
SQL command for creating the index:

``` CREATE INDEX idx_artist ON spotify_tracks(artist);```

Performance Analysis After Index Creation

After creating the index, we ran the same query again and observed significant improvements in performance:
Execution time (E.T.): 0.16 ms
Planning time (P.T.): 1.75 ms
Below is the screenshot of the EXPLAIN result after index creation:

<img width="725" height="492" alt="Screenshot 2025-09-14 010011" src="https://github.com/user-attachments/assets/f49c3b93-e686-4974-8db2-2b64ffb3a104" />

This optimization shows how indexing can drastically reduce query time, improving the overall performance of our database operations in the Spotify project.

**📊 Sample Business Insights**

- Top 5 tracks by **energy score**.

- Artists with the **highest average views**.

- Most popular **album type** (single vs album).

- **Cumulative likes trend** across tracks.

- Energy-to-liveness ratio for hit songs.

**⚡ Tech Stack**

- **Database**: PostgreSQL

- **SQL**: Joins, Aggregations, Window Functions, CTEs, Subqueries

- **Optimization**: Indexing, Query Execution Plan (EXPLAIN)

- **Tools**: pgAdmin 4 / SQL Editor




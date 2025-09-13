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

- Used **EXPLAIN ANALYZE** to check query execution plans.

- Created **indexes** on frequently used columns (e.g., artist).

- Reduced query time significantly (7ms → 0.15ms).

- Visualized before/after performance improvements.

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




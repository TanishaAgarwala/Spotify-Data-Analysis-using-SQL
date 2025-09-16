---Advanced SQL project---SPOTIFY----

/*Creating Table */

Drop table if exists Spotify;
Create table Spotify(
Artist varchar(255),
Track varchar(255),
Album varchar(255),
Album_type varchar(255),
Danceability Float,
Energy	Float,
Loudness Float,
Speechiness	Float,
Acousticness Float,
Instrumentalness Float,
Liveness Float,
Valence	Float,
Tempo Float,
Duration_min Float,	
Title varchar(255), 
Channel	varchar(255),
Views Float,	
Likes Bigint,
Comments Bigint,
Licensed Boolean,	
official_video Boolean,	
Stream	Bigint,
EnergyLiveness Float,
most_playedon varchar(50)
)

----Exploratory Data Analysis (EDA)----
Select * From Spotify
LIMIT 100;

Select Count(*) From Spotify;

Select Count (Distinct Album) From Spotify;

Select Count (Distinct Artist) From Spotify;

Select Count (Distinct Album) From Spotify;

/*Exploring album types in the Dataset */
Select Distinct Album_type From Spotify;

/*Exploring channels in the Dataset */
Select Distinct channel From Spotify;

/*Exploring streaming platform in the Dataset */
Select Distinct most_playedon From Spotify;

Select Min(duration_min) From Spotify;

Select Max(duration_min) From Spotify;

Select Max(Views) From Spotify;
Select Max(Comments) From Spotify;

/*Data Cleaning- Removing track with Duration of 0 mins */
Delete From Spotify
Where duration_min=0;

Select * From Spotify
Where duration_min=0;

/*----SQL Queries----
Q1) Retrieve the names of all tracks that have more than 1 billion stream */

Select * from spotify
Where stream > 1000000000

/*Q2) List all albums along with their respective artists. */

Select DISTINCT album,artist
From spotify;

/*Q3) Get the total number of comments for tracks where licensed = TRUE.*/

SELECT SUM(comments)
From spotify
Where licensed = 'TRUE';

/* Q4) Find all tracks that belong to the album type single.*/

Select *
From spotify
Where album_type = 'single';

/*Q5)Count the total number of tracks by each artist.*/

SELECT artist,count(*) AS total_tracks
From spotify
Group by artist
Order by total_tracks  desc ;

/*Q6)Calculate the average danceability of tracks in each album.*/

Select album, avg(danceability) AS avg_danceability
From spotify
Group by album 

/*Q7)Find the top 5 tracks with the highest energy values.*/

SELECT track, max(energy) AS Max_energy
From spotify
Group by track
Order by Max_energy  desc 
LIMIT 5;

/*Q8)List all tracks along with their views and likes where official_video = TRUE.*/

SELECT track, SUM(views) AS Total_views, Sum(likes) AS Total_likes
From spotify
WHERE official_video='True'
Group by track
Order by Total_views desc;

/*Q9) For each album, calculate the total views of all associated tracks.*/

Select track, album, sum(views) AS Total_views
From spotify
Group by track, album
Order by Total_views desc;

/*Q10)Retrieve the track names that have been streamed on Spotify more than YouTube.*/

Select * from 
(SELECT track,
 Coalesce(SUM(CASE WHEN most_playedon ='Youtube' THEN Stream END),0) AS streamed_on_yt,
Coalesce(SUM(CASE WHEN most_playedon ='Spotify' THEN Stream END),0) AS streamed_on_spotify

FROM spotify
Group by track
) t1
Where  streamed_on_spotify > streamed_on_yt
AND 
streamed_on_yt != 0

/*Q11) Find the top 3 most-viewed tracks for each artist using window functions.*/

WITH ranking_artist AS 
(
Select artist,track, SUM(views) AS Total_views ,
Dense_rank()Over(Partition by artist Order by SUM(views)Desc ) AS rank
From spotify 
Group by track,artist
Order by artist,Total_views Desc
) 
Select * from ranking_artist 
Where rank<=3 ;

/*Q12) Write a query to find tracks where the liveness score is above the average.*/

SELECT track,liveness
From spotify 
Where liveness> (Select avg(liveness)from spotify )

/* Q13) Calculate the difference between the highest and lowest energy values for tracks in each album.*/


WITH CTE AS(
SELECT album, MAX(Energy) AS Highest_energy,Min(Energy) AS Lowest_energy
From spotify 
Group by album
)

SELECT album,Highest_energy - Lowest_energy AS Energy_diff 
FROM CTE
Order by  Energy_diff  desc

/*Q14)Find tracks where the energy-to-liveness ratio is greater than 1.2 */

SELECT track, energy,liveness, (energy *0.1/liveness) AS ratio
From spotify
WHERE  (energy *0.1/liveness) > 1.2;

/*Q15)Calculate the cumulative sum of likes for tracks ordered by the number of views
using window functions.*/

SELECT track, views,
SUM(likes)OVER (ORDER BY views DESC Rows between unbounded preceding and current row) AS Cumulative_likes
From spotify ;


/*Q16) Top 5 Artists by Total Streams */

SELECT artist,
    SUM(stream) AS total_streams
FROM spotify
GROUP BY artist
ORDER BY total_streams DESC
LIMIT 5;

/*Q17)Find the top 3 artists with the highest average views across their tracks.*/

WITH artist_avg AS (
    SELECT 
        artist,
        AVG(views) AS avg_views,
        ROW_NUMBER() OVER (ORDER BY AVG(views) DESC) AS rnk
    FROM spotify
    GROUP BY artist
)
SELECT artist, avg_views
FROM artist_avg
WHERE rnk <= 3;




-------Query Optimization-------
EXPLAIN ANALYZE
SELECT artist, track, views 
FROM spotify
Where artist = 'Gorillaz'
 AND most_playedon='Youtube'
order by stream DESC
LIMIT 25

Create index artist_index on spotify(artist)

/*Before Index-PT->0.234ms,ET->7.1ms

After Index- PT-> 1.75ms, ET-> 0.165ms

# Exercises

## Create a new file called select_exercises.sql. Do your work for this exercise in that file.

## Use the albums_db database.

## Explore the structure of the albums table.

## Write queries to find the following information.

## The name of all albums by Pink Floyd
use albums_db;
select name
from albums
where artist = 'Pink Floyd';

## The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date
from albums
where name  = 'Sgt. Pepper\'s Lonely Hearts Club Band';

## The genre for the album Nevermind
select genre
from albums
where name = 'Nevermind';

## Which albums were released in the 1990s
select name
from albums
where release_date between 1990 and 1999;

## Which albums had less than 20 million certified sales
select name
from albums
where sales < 20.0;

## All the albums with a genre of "Rock". 
select name
from albums
where genre = 'Rock';
## Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
### We would need to use code that could return genre values that contain the word 'rock' (if such operation exists.) or we would have to list all unique sub-genres to get those values. 
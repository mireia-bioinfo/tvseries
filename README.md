# `tvseries` R data package
The tvseries package contains data from IMDb regarding TV shows ratings, genre, seasons, chapters and other information.

## Installation

```
devtools::install_github("mireia-bioinfo/tvseries")
```

## Usage
I recommend **not** loading the whole package with `library(tvseries)` as it contains large datasets and 
it might freeze your R session.

You can load and assign the different datasets in the package using: 

```
df <- tvseries::tvseries_top100
```

## Datasets
At this point, the package contains three different datasets:

- `tvseries_top100`. Dataset containing IMDb ratings for the **top 100 TV series selected by their popularity** 
(average number of votes per episode) and their average ranking.
- `tvseries_top250`. Dataset containing IMDb ratings for the **top 250 TV series selected by their popularity** 
(average number of votes per episode) and their average ranking.
- `tvseries`. Dataset containing IMDb ratings for all series, seasons and episodes. **Be careful when loading this 
dataset as it is pretty big and might freeze your session**.

All these datasets have the same number of columns which are as follows:

Name           | Description
---------------|------------
tvseries_title | Name of the TV series.
episode_title  | Name of the episode.
season_number  | Season number.
episode_number | Episode number.
start_year     | Year the show started.
end_year       | Year the show ended.
runtime_min    | Length of the episode in minutes.
genres         | Genres of the TV series.
average_rating | Average rating of the episode.
votes          | Number of votes for that episode.


Source data was obtained fromm [IMDb datasets](https://datasets.imdbws.com/) (a description of all the files and 
columns can be found [here](https://www.imdb.com/interfaces/)

For more information on how data was processed see [data_prep.R](https://github.com/mireia-bioinfo/tvseries/blob/master/data-raw/data_prep.R).

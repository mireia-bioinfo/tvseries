#' IMBDb ratings of TV series
#'
#' This package contains ratings an other TV series information from
#' IMDb.
#' @docType package
#' @name tvseries
#' @aliases tvseries tvseries-package
NULL

#' All IMDb ratings of TV series
#'
#' A dataset containing IMDb ratings for all series, seasons and
#' episodes. Be careful when loading this dataset as it is pretty
#' big and might freeze your session.
#'
#' @source \url{https://datasets.imdbws.com/}
#' @format A dataframe with 3,627,538 rows and 10 columns.
#' \itemize{
#'     \item \strong{tvseries_title}: Name of the TV series.
#'     \item \strong{episode_title}: Name of the episode.
#'     \item \strong{season_number}: Season number.
#'     \item \strong{episode_number}: Episode number.
#'     \item \strong{start_year}: Year the show started.
#'     \item \strong{end_year}: Year the show ended.
#'     \item \strong{runtime_min}: Length of the episode in minutes.
#'     \item \strong{genres}: Genres of the TV series.
#'     \item \strong{average_rating}: Average rating of the episode.
#'     \item \strong{votes}: Number of votes for that episode. }
"tvseries"

#' Top 100 most popular IMDB-rated TV series
#'
#' A dataset containing IMDb ratings for the top 100 TV series selected
#' by their popularity (average number of votes per episode) and their
#' average ranking.
#'
#' @source \url{https://datasets.imdbws.com/}
#' @format A dataframe with 7,100 rows and 10 columns.
#' \itemize{
#'     \item \strong{tvseries_title}: Name of the TV series.
#'     \item \strong{episode_title}: Name of the episode.
#'     \item \strong{season_number}: Season number.
#'     \item \strong{episode_number}: Episode number.
#'     \item \strong{start_year}: Year the show started.
#'     \item \strong{end_year}: Year the show ended.
#'     \item \strong{runtime_min}: Length of the episode in minutes.
#'     \item \strong{genres}: Genres of the TV series.
#'     \item \strong{average_rating}: Average rating of the episode.
#'     \item \strong{votes}: Number of votes for that episode. }
"tvseries_top100"

#' Top 250 most popular IMDB-rated TV series
#'
#' A dataset containing IMDb ratings for the top 250 TV series selected
#' by their popularity (average number of votes per episode) and their
#' average ranking.
#'
#' @source \url{https://datasets.imdbws.com/}
#' @format A dataframe with 18,470 rows and 10 columns.
#' \itemize{
#'     \item \strong{tvseries_title}: Name of the TV series.
#'     \item \strong{episode_title}: Name of the episode.
#'     \item \strong{season_number}: Season number.
#'     \item \strong{episode_number}: Episode number.
#'     \item \strong{start_year}: Year the show started.
#'     \item \strong{end_year}: Year the show ended.
#'     \item \strong{runtime_min}: Length of the episode in minutes.
#'     \item \strong{genres}: Genres of the TV series.
#'     \item \strong{average_rating}: Average rating of the episode.
#'     \item \strong{votes}: Number of votes for that episode. }
"tvseries_top250"

#' Must watch IMDB-rated TV series
#'
#' A dataset containing IMDb ratings for the TV series I personally recommend
#' you should watch! Load the dataset to discover which TV series are these!
#'
#' @source \url{https://datasets.imdbws.com/}
#' @format A dataframe with 18,470 rows and 10 columns.
#' \itemize{
#'     \item \strong{tvseries_title}: Name of the TV series.
#'     \item \strong{episode_title}: Name of the episode.
#'     \item \strong{season_number}: Season number.
#'     \item \strong{episode_number}: Episode number.
#'     \item \strong{start_year}: Year the show started.
#'     \item \strong{end_year}: Year the show ended.
#'     \item \strong{runtime_min}: Length of the episode in minutes.
#'     \item \strong{genres}: Genres of the TV series.
#'     \item \strong{average_rating}: Average rating of the episode.
#'     \item \strong{votes}: Number of votes for that episode. }
"tvseries_must_watch"

# Download datasets from IMDb
# download.file("https://datasets.imdbws.com/title.akas.tsv.gz",
#               destfile="data-raw/title.akas.tsv.gz")
# system(paste0("gunzip data-raw/title.akas.tsv.gz"))

download.file("https://datasets.imdbws.com/title.basics.tsv.gz",
              destfile="data-raw/title.basics.tsv.gz")
system(paste0("gunzip data-raw/title.basics.tsv.gz"))

download.file("https://datasets.imdbws.com/title.episode.tsv.gz",
              destfile="data-raw/title.episode.tsv.gz")
system(paste0("gunzip data-raw/title.episode.tsv.gz"))

download.file("https://datasets.imdbws.com/title.ratings.tsv.gz",
              destfile="data-raw/title.ratings.tsv.gz")
system(paste0("gunzip data-raw/title.ratings.tsv.gz"))


# title_akas <- read.delim("data-raw/title.akas.tsv", stringsAsFactors = FALSE, nrows=1e6)
title_basics <- read.delim("data-raw/title.basics.tsv", stringsAsFactors = FALSE)
title_basics <- title_basics[title_basics$titleType %in% c("tvEpisode", "tvSeries"),]
title_basics <- title_basics[title_basics$genres!="Sport",]
title_basics <- title_basics[!grepl("Documentary", title_basics$genres),]
title_basics <- title_basics[!grepl("Reality-TV", title_basics$genres),]

title_episode <- read.delim("data-raw/title.episode.tsv", stringsAsFactors = FALSE)
title_ratings <- read.delim("data-raw/title.ratings.tsv", stringsAsFactors = FALSE)

tv <- dplyr::inner_join(title_episode, title_basics)
tv <- dplyr::left_join(tv, title_ratings)
tv <- dplyr::left_join(tv, title_basics, by=c("parentTconst"="tconst"))

tv <- tv[,c("primaryTitle.y", "primaryTitle.x", "seasonNumber", "episodeNumber",
            "startYear.y", "endYear.y", "runtimeMinutes.x", "genres.x", "averageRating", "numVotes")]
colnames(tv) <- c("tvseries_title", "episode_title", "season_number", "episode_number",
                  "start_year", "end_year", "runtime_min", "genres", "average_rating", "num_votes")
tv <- tv[!is.na(tv$tvseries_title),]

tvseries <- tv
tvseries[tvseries=="\\N"] <- NA
tvseries[tvseries=="NA"] <- NA
tvseries$season_number <- as.numeric(tvseries$season_number)
tvseries$episode_number <- as.numeric(tvseries$episode_number)
tvseries$start_year <- as.numeric(tvseries$start_year)
tvseries$end_year <- as.numeric(tvseries$end_year)
tvseries$runtime_min <- as.numeric(tvseries$runtime_min)
tvseries$average_rating <- as.numeric(tvseries$average_rating)
tvseries$num_votes <- as.numeric(tvseries$num_votes)

usethis::use_data(tvseries, overwrite=T)

# Select 100 more popular and higher ranking
library(dplyr)

top <- tvseries %>%
  group_by(tvseries_title) %>%
  summarise(avg=mean(average_rating, na.rm=T),
            votes_average=sum(num_votes, na.rm=T)/length(episode_title)) %>%
  arrange(desc(votes_average), desc(avg))

top100 <- top$tvseries_title[1:100]

tvseries_top100 <- tvseries[tvseries$tvseries_title %in% top100,]
usethis::use_data(tvseries_top100, overwrite=T)


# Select 500 more popular and higher ranking
top250 <- top$tvseries_title[1:250]

tvseries_top250 <- tvseries[tvseries$tvseries_title %in% top250,]
usethis::use_data(tvseries_top250, overwrite=T)


# Create personal must_watch
load("data/tvseries.rda")
mw <- c("Jane the Virgin", "Crazy Ex-Girlfriend",
        "Brooklyn Nine-Nine", "The Good Place")
tvseries_must_watch <- tvseries[tvseries$tvseries_title %in% mw,]
usethis::use_data(tvseries_must_watch, overwrite=T)

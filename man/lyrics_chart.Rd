
\name{lyrics_chart}
\alias{lyrics_chart}
\title{Lyrics Chart}
\description{Read a text file of lyrics and generate a bar chart of the most frequent words.}
\usage{
lyrics_chart(file, output, filterCount = 5)
}
\arguments{
\item{file}{Path to a .txt file containing lyrics.}
\item{output}{Path to an existing directory where the chart will be saved.}
\item{filterCount}{Minimum number of occurrences for a word to appear (default 5).}
}
\value{
No return value. Saves a PNG file to the output directory.
}
\examples{
sample_lyrics <- "Hello world, hello everyone. Hello to the world!"
sample_file <- tempfile(fileext = ".txt")
writeLines(sample_lyrics, sample_file)
output_dir <- tempdir()
lyrics_chart(sample_file, output_dir, filterCount = 1)
}
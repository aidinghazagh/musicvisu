
\name{lyrics_chart}
\alias{lyrics_chart}
\title{Lyrics Chart}
\description{Will turn a txt file into a chart of the most recurring words}
\usage{
lyrics_chart(file, output, filterCount = 5)
}
\arguments{
\item{file}{Directory of a txt file to read}
\item{output}{Directory of the outputting chart}
\item{filterCount}{The minimum recurrence of a word to be shown on the chart}
}
\value{
No returning value only the outputting chart 
}
\examples{

sample_lyrics <- "Hello world, hello everyone. Hello to the world!"
sample_file <- tempfile(fileext = ".txt")
    
writeLines(sample_lyrics, sample_file)
    
    
lyrics_chart(sample_file, output_dir, filterCount = 1)
}
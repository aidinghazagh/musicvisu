
\name{note_duration_chart}
\alias{note_duration_chart}
\title{Note Duration Chart}
\description{Generate a horizontal bar chart of average note durations from note and timestamp data.}
\usage{
note_duration_chart(notes, timestamps, output)
}
\arguments{
\item{notes}{A character vector of valid note names (C0 through B8, with optional sharps).}
\item{timestamps}{A numeric vector of timestamps in seconds (non-negative).}
\item{output}{Path to an existing directory where the chart will be saved.}
}
\value{
No return value. Saves a PNG file to the output directory.
}
\examples{
notes <- c("C4", "D4", "E4", "C4")
timestamps <- c(0.0, 1.0, 2.0, 3.5)
output_dir <- tempdir()
note_duration_chart(notes, timestamps, output_dir)
}

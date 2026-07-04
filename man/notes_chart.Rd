
\name{notes_chart}
\alias{notes_chart}
\title{Notes Chart}
\description{Generate a step-line chart of musical notes over time.}
\usage{
notes_chart(notes, timestamps, output)
}
\arguments{
\item{notes}{A character vector of valid note names (C0 through B8, with optional sharps like "C#4").}
\item{timestamps}{A numeric vector of timestamps in seconds (non-negative).}
\item{output}{Path to an existing directory where the chart will be saved.}
}
\value{
No return value. Saves a PNG file to the output directory.
}
\examples{
# "Happy Birthday" song notes and corresponding timestamps
  notes <- c(
    "G4", "G4", "A4", "G4", "C5", "B4", 
    "G4", "G4", "A4", "G4", "D5", "C5", 
    "G4", "G4", "G5", "E5", "C5", "B4", "A4", 
    "F5", "F5", "E5", "C5", "D5", "C5",
    # Repeat to simulate larger dataset
    "G4", "G4", "A4", "G4", "C5", "B4", 
    "G4", "G4", "A4", "G4", "D5", "C5", 
    "G4", "G4", "G5", "E5", "C5", "B4", "A4", 
    "F5", "F5", "E5", "C5", "D5", "C5"
  )
  timestamps <- c(
    0.0, 0.5, 1.0, 1.5, 2.0, 3.0,
    4.0, 4.5, 5.0, 5.5, 6.0, 7.0,
    8.0, 8.5, 9.0, 9.5, 10.0, 11.0, 12.0,
    13.0, 13.5, 14.0, 14.5, 15.0, 16.0,
    # Repeat timestamps to simulate larger dataset
    17.0, 17.5, 18.0, 18.5, 19.0, 20.0,
    21.0, 21.5, 22.0, 22.5, 23.0, 24.0,
    25.0, 25.5, 26.0, 26.5, 27.0, 28.0, 29.0,
    30.0, 30.5, 31.0, 31.5, 32.0, 33.0
  )
  output_dir <- tempdir()

  notes_chart(notes, timestamps, output_dir)
}
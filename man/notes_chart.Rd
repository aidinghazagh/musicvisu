
\name{notes_chart}
\alias{notes_chart}
\title{Notes Chart}
\description{Will turn notes and their timestamps to a chart}
\usage{
notes_chart(notes, timestamps, output_dir)
}
\arguments{
\item{notes}{The vector of musical notes from C0 to B8}
\item{timestamps}{The vector of timestamps in seconds}
\item{output_dir}{A string of a directory with forward slashes}
}
\value{
No returning values only a png file to the designated output_dir
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
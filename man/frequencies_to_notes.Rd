
\name{frequencies_to_notes}
\alias{frequencies_to_notes}
\title{Frequencies To Notes}
\description{Will turn a vector of sound frequenceis into musical notes}
\usage{
frequencies_to_notes(c("440", "840", "261"))
}
\arguments{
\item{frequencies}{The vector of frequencies to turn into notes}
}
\value{
a vector of string characters that represent musical notes
}
\examples{
frequencies <- c("440", "840", "261")
notes <- frequencies_to_notes(frequencies)
cat(notes)
}

\name{frequencies_to_notes}
\alias{frequencies_to_notes}
\title{Frequencies To Notes}
\description{Convert a vector of sound frequencies (Hz) into musical note names.}
\usage{
frequencies_to_notes(frequencies, A4_freq = 440, A4_note = 69)
}
\arguments{
\item{frequencies}{A numeric vector of frequencies in Hz.}
\item{A4_freq}{Frequency of A4 in Hz (default 440).}
\item{A4_note}{MIDI note number for A4 (default 69).}
}
\value{
A character vector of musical note names (e.g. "A4", "C#5").
}
\examples{
frequencies <- c(440, 880, 261.63)
notes <- frequencies_to_notes(frequencies)
cat(notes)
}
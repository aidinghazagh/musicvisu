
\name{waveform_chart}
\alias{waveform_chart}
\title{Waveform Chart}
\description{Plot the amplitude waveform of audio samples over time.}
\usage{
waveform_chart(samples, sample_rate, output)
}
\arguments{
\item{samples}{A numeric vector of audio sample values.}
\item{sample_rate}{The sample rate in Hz (e.g. 44100).}
\item{output}{Path to an existing directory where the chart will be saved.}
}
\value{
No return value. Saves a PNG file to the output directory.
}
\examples{
# Generate a simple sine wave at 440 Hz
sample_rate <- 44100
t <- seq(0, 0.05, length.out = 2205)
samples <- sin(2 * pi * 440 * t)
output_dir <- tempdir()
waveform_chart(samples, sample_rate, output_dir)
}

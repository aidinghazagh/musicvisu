
\name{frequency_spectrum}
\alias{frequency_spectrum}
\title{Frequency Spectrum}
\description{Compute and plot the frequency spectrum of audio samples using FFT.}
\usage{
frequency_spectrum(samples, sample_rate, output, max_freq = 20000)
}
\arguments{
\item{samples}{A numeric vector of audio sample values.}
\item{sample_rate}{The sample rate in Hz (e.g. 44100).}
\item{output}{Path to an existing directory where the chart will be saved.}
\item{max_freq}{Maximum frequency to display in Hz (default 20000).}
}
\value{
No return value. Saves a PNG file to the output directory.
}
\examples{
# Generate a simple sine wave at 440 Hz
sample_rate <- 44100
t <- seq(0, 1, length.out = sample_rate)
samples <- sin(2 * pi * 440 * t)
output_dir <- tempdir()
frequency_spectrum(samples, sample_rate, output_dir)
}

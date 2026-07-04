frequency_spectrum <- function(samples, sample_rate, output, max_freq = 20000) {
  if (!is.numeric(samples)) {
    stop("samples must be a numeric vector.")
  }

  if (!is.numeric(sample_rate) || sample_rate <= 0) {
    stop("sample_rate must be a positive number.")
  }

  if (!dir.exists(output)) {
    stop("The specified output directory does not exist.")
  }

  if (!is.numeric(max_freq) || max_freq <= 0) {
    stop("max_freq must be a positive number.")
  }

  n <- length(samples)
  if (n < 2) {
    stop("samples must contain at least 2 values.")
  }

  fft_result <- stats::fft(samples)
  magnitudes <- Mod(fft_result[1:floor(n / 2)])
  magnitudes_db <- 20 * log10(magnitudes / max(magnitudes) + 1e-10)
  frequencies <- seq(0, sample_rate / 2, length.out = length(magnitudes))

  keep <- frequencies <= max_freq
  plot_data <- data.frame(
    Frequency = frequencies[keep],
    Magnitude_dB = magnitudes_db[keep]
  )

  p <- ggplot2::ggplot(plot_data, ggplot2::aes(x = .data$Frequency, y = .data$Magnitude_dB)) +
    ggplot2::geom_line(color = "steelblue", linewidth = 0.5) +
    ggplot2::labs(
      title = "Frequency Spectrum",
      x = "Frequency (Hz)",
      y = "Magnitude (dB)"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold"),
      panel.grid.minor = ggplot2::element_blank()
    ) +
    ggplot2::scale_x_continuous(labels = scales::label_number(suffix = " Hz"))

  ggplot2::ggsave(
    file.path(output, "frequency-spectrum.png"),
    plot = p,
    width = 10,
    height = 6,
    dpi = 300
  )
}

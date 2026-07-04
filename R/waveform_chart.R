waveform_chart <- function(samples, sample_rate, output) {
  if (!is.numeric(samples)) {
    stop("samples must be a numeric vector.")
  }

  if (!is.numeric(sample_rate) || sample_rate <= 0) {
    stop("sample_rate must be a positive number.")
  }

  if (!dir.exists(output)) {
    stop("The specified output directory does not exist.")
  }

  n <- length(samples)
  if (n < 2) {
    stop("samples must contain at least 2 values.")
  }

  time <- seq(0, (n - 1) / sample_rate, length.out = n)
  plot_data <- data.frame(Time = time, Amplitude = samples)

  p <- ggplot2::ggplot(plot_data, ggplot2::aes(x = .data$Time, y = .data$Amplitude)) +
    ggplot2::geom_line(color = "darkblue", linewidth = 0.3) +
    ggplot2::labs(
      title = "Waveform",
      x = "Time (seconds)",
      y = "Amplitude"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold"),
      panel.grid.minor = ggplot2::element_blank()
    )

  ggplot2::ggsave(
    file.path(output, "waveform.png"),
    plot = p,
    width = 12,
    height = 4,
    dpi = 300
  )
}

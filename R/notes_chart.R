notes_chart <- function(notes, timestamps, output) {
  if (length(notes) != length(timestamps)) {
    stop("The length of notes and timestamps must be the same.")
  }

  is_valid_note <- function(note) {
    return(grepl("^[A-G]#?[0-8]+$", note))
  }

  valid_notes <- vapply(notes, is_valid_note, logical(1))
  if (!all(valid_notes)) {
    stop("All notes must be valid note names followed by a number to represent the octave. (C0 - B8)")
  }

  is_valid_timestamp <- function(timestamp) {
    return(is.numeric(timestamp) && timestamp >= 0)
  }

  valid_timestamps <- vapply(timestamps, is_valid_timestamp, logical(1))
  if (!all(valid_timestamps)) {
    stop("All timestamps must be numeric and non-negative.")
  }

  note_names <- c("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
  octaves <- 0:8
  all_notes <- as.vector(t(outer(octaves, note_names, function(o, n) paste0(n, o))))

  notes <- factor(notes, levels = all_notes, ordered = TRUE)

  data <- data.frame(Timestamp = timestamps, Note = notes)

  n_points <- max(1, length(timestamps))
  base_text_size <- 50
  text_size_x <- max(6, min(20, base_text_size / (n_points / 10)))
  text_size_y <- max(6, min(20, base_text_size / (n_points / 10)))

  if (length(timestamps) == 1) {
    x_limits <- c(timestamps - 1, timestamps + 1)
  } else {
    x_limits <- c(min(timestamps), max(timestamps))
  }

  p <- ggplot2::ggplot(data, ggplot2::aes(x = .data$Timestamp, y = .data$Note, group = 1)) +
    ggplot2::geom_step(color = "blue", linewidth = 1) +
    ggplot2::geom_point(size = 2, shape = 21, fill = "white", color = "blue") +
    ggplot2::labs(
      title = "Notes Chart",
      x = "Timestamps (seconds)",
      y = "Notes"
    ) +
    ggplot2::theme_minimal(base_size = 15) +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold"),
      plot.subtitle = ggplot2::element_text(hjust = 0.5),
      axis.title.x = ggplot2::element_text(size = text_size_x, margin = ggplot2::margin(t = 10)),
      axis.title.y = ggplot2::element_text(size = text_size_y, margin = ggplot2::margin(r = 10)),
      axis.text.x = ggplot2::element_text(size = text_size_x * 0.8, angle = 45, hjust = 1),
      axis.text.y = ggplot2::element_text(size = text_size_y * 0.8),
      panel.grid.minor = ggplot2::element_blank()
    ) +
    ggplot2::scale_x_continuous(breaks = unique(timestamps), limits = x_limits) +
    ggplot2::scale_y_discrete()

  ggplot2::ggsave(
    file.path(output, "note-chart.png"),
    plot = p,
    width = 10,
    height = 9,
    dpi = 300
  )
}

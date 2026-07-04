note_duration_chart <- function(notes, timestamps, output) {
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

  if (length(notes) < 2) {
    stop("At least 2 notes are required to compute durations.")
  }

  durations <- diff(timestamps)
  plot_data <- data.frame(
    Note = notes[-length(notes)],
    Duration = durations
  )

  note_summary <- stats::aggregate(Duration ~ Note, data = plot_data, FUN = mean)

  p <- ggplot2::ggplot(note_summary, ggplot2::aes(x = stats::reorder(.data$Note, .data$Duration), y = .data$Duration)) +
    ggplot2::geom_col(fill = "steelblue") +
    ggplot2::coord_flip() +
    ggplot2::labs(
      title = "Average Note Duration",
      x = "Note",
      y = "Duration (seconds)"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold"),
      panel.grid.minor = ggplot2::element_blank()
    )

  ggplot2::ggsave(
    file.path(output, "note-duration.png"),
    plot = p,
    width = 8,
    height = 6,
    dpi = 300
  )
}

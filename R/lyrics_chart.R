lyrics_chart <- function(file, output, filterCount = 5) {
  if (!file.exists(file)) {
    stop("The specified file does not exist.")
  }

  if (!dir.exists(output)) {
    stop("The specified output directory does not exist.")
  }

  if (!is.numeric(filterCount) || filterCount <= 0 || filterCount != as.integer(filterCount)) {
    stop("filterCount must be a positive integer.")
  }

  readFile <- readr::read_file(file)
  if (is.na(readFile) || nchar(trimws(readFile)) == 0) {
    stop("The specified file is empty.")
  }

  readFile <- readFile |>
    stringr::str_to_lower() |>
    stringr::str_replace_all(pattern = "\n", replacement = " ") |>
    stringr::str_remove_all(pattern = "[:punct:]") |>
    stringr::str_squish()

  wordVector <- stringr::str_split_1(readFile, pattern = " ")
  wordTibble <- dplyr::tibble(word = wordVector) |>
    dplyr::group_by(.data$word) |>
    dplyr::summarise(count = dplyr::n()) |>
    dplyr::filter(.data$count >= filterCount) |>
    dplyr::arrange(dplyr::desc(.data$count)) |>
    dplyr::mutate(word = stringr::str_to_title(.data$word))

  if (nrow(wordTibble) == 0) {
    stop("No words found. Check the file or lower the filterCount argument.")
  }

  x_text_size <- max(6, min(12, 100 / nrow(wordTibble)))
  pretty_n <- max(1, round(max(wordTibble$count) / 5))

  p <- ggplot2::ggplot(wordTibble, ggplot2::aes(x = stats::reorder(.data$word, -.data$count), y = .data$count)) +
    ggplot2::geom_col(ggplot2::aes(fill = .data$count)) +
    ggplot2::labs(
      x = "Word",
      y = "Count",
      title = "Word Count",
      fill = "Count"
    ) +
    ggplot2::theme_classic() +
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(size = x_text_size),
      axis.title.x = ggplot2::element_text(vjust = -0.5),
      plot.title = ggplot2::element_text(hjust = 0.5)
    ) +
    ggplot2::scale_y_continuous(
      breaks = scales::pretty_breaks(n = pretty_n),
      limits = c(0, NA),
      labels = scales::label_number(accuracy = 1)
    )

  ggplot2::ggsave(
    file.path(output, "word-chart.png"),
    plot = p,
    width = 8,
    height = 6,
    dpi = 300
  )
}

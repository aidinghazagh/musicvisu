lyrics_chart <- function(file, output, filterCount = 5){
  library(tidyverse)
  library(ggplot2)
  
  if (!file.exists(file)) {
    stop("The specified file does not exist.")
  }
  
  if (!dir.exists(output)) {
    stop("The specified output directory does not exist.")
  }
  
  if (!is.numeric(filterCount) || filterCount <= 0 || filterCount != as.integer(filterCount)) {
    stop("filterCount must be a positive integer.")
  }
  
  readFile <- read_file(file) |> 
    str_to_lower() |> 
    str_replace_all(pattern = "\n", replacement = " ") |> 
    str_remove_all(pattern = "[:punct:]") |> 
    str_squish()
  
  wordVector <- str_split_1(readFile, pattern = " ")
  wordTibble <- tibble(word = wordVector) |> 
    group_by(word) |> 
    summarise(count = n()) |> 
    filter(count >= filterCount) |> 
    arrange(desc(count)) |> 
    mutate(word = str_to_title(word))
  
  if (nrow(wordTibble) == 0) {
    stop("No words found. check file or change the filterCount argument")
  }
  
  p <- ggplot(wordTibble, aes(x = reorder(word, -count), y = count,)) +
    geom_col(aes(fill = count)) +
    labs(
      x = "Word",
      y = "Count",
      title = "Word Count",
      fill = "Count"
    ) +
    theme_classic()+
    theme(
      axis.text.x = element_text(size = (100 / nrow(wordTibble))),
      axis.title.x = element_text(vjust = -0.5),
      plot.title = element_text(hjust = 0.5)
    ) +
    scale_y_continuous(
      breaks = scales::pretty_breaks(n = (max(wordTibble$count) / 5)),
      limits = c(0, NA), labels = scales::label_number(accuracy = 1)
    )
  
  ggsave(
    paste0(output, "/word-chart.png"),
    plot = p,
    width = 8,
    height = 6,
    dpi = 300
  )
}

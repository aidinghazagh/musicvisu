notes_chart <- function(notes, timestamps, output){
  library(ggplot2)
  
  if (length(notes) != length(timestamps)) {
    stop("The length of notes and timestamps must be the same.")
  }
  
  is_valid_note <- function(note) {
    # Check if the note follows the pattern of a valid musical note with an octave number
    return(grepl("^[A-G]#?[0-8]+$", note))
  }
  
  valid_notes <- sapply(notes, is_valid_note)
  if (!all(valid_notes)) {
    stop("All notes must be valid note names followed by a number to represent the octave. (C0 - B8)")
  }
  
  is_valid_timestamp <- function(timestamp) {
    return(is.numeric(timestamp) && timestamp >= 0)
  }
  
  valid_timestamps <- sapply(timestamps, is_valid_timestamp)
  if (!all(valid_timestamps)) {
    stop("All timestamps must be numeric and non-negative.")
  }
  
  # Define valid note names and generate all possible notes for ordering
  note_names <- c("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
  octaves <- 0:8  # Adjust this range as necessary for your application
  all_notes <- as.vector(t(outer(octaves, note_names, function(o, n) paste0(n, o))))
  
  # Ensure notes are factors with levels in the correct musical order
  notes <- factor(notes, levels = all_notes, ordered = TRUE)
  
  data <- data.frame(Timestamp = timestamps, Note = notes)
  
  # Determine text sizes based on the length of the data
  base_text_size <- 50
  text_size_x <- base_text_size / (length(timestamps) / 10)  # Adjust X axis text size
  text_size_y <- base_text_size / (length(notes) / 10)       # Adjust Y axis text size
  
  # Plot the notes against the timestamps using geom_step
  p <- ggplot(data, aes(x = Timestamp, y = Note, group = 1)) +
    geom_step(color = "blue", size = 1) +  # Customize step line
    geom_point(size = 2, shape = 21, fill = "white", color = "blue") +  # Add points with specific style
    labs(title = "Notes Chart",
         x = "Timestamps (seconds)",
         y = "Notes") +
    theme_minimal(base_size = 15) +  # Increase base font size for better readability
    theme(
      panel.background = element_rect(fill = "white", color = NA),  # Set background color
      plot.background = element_rect(fill = "white", color = NA),    # Set background color for the entire plot
      plot.title = element_text(hjust = 0.5, face = "bold"),  # Center and bold the title
      plot.subtitle = element_text(hjust = 0.5),  # Center the subtitle
      axis.title.x = element_text(size = text_size_x, margin = margin(t = 10)),  # Adjust X axis text size
      axis.title.y = element_text(size = text_size_y, margin = margin(r = 10)),  # Adjust Y axis text size
      axis.text.x = element_text(size = text_size_x * 0.8, angle = 45, hjust = 1),  # Adjust x-axis labels size and rotate
      axis.text.y = element_text(size = text_size_y * 0.8),  # Adjust y-axis labels size
      panel.grid.minor = element_blank()   # Remove minor grid lines
    ) +
    scale_x_continuous(breaks = unique(timestamps), limits = c(min(timestamps), max(timestamps))) +  # Only show provided timestamps
    scale_y_discrete()  # Ensure the Y axis displays discrete musical notes
  # Save plot to designated directory
  ggsave(
    paste0(output, "/note-chart.png"),
    plot = p,
    width = 10,
    height = 9,
    dpi = 300
  )
}

frequencies_to_notes <- function(frequencies, A4_freq = 440, A4_note = 69) {
  if (!is.numeric(frequencies)) {
    stop("frequencies vector should be numeric")
  }

  freq_to_note <- function(freq) {
    if (is.na(freq) || is.nan(freq) || is.infinite(freq) || freq <= 0) {
      warning("Non-positive, NA, NaN, or Inf frequency detected, setting note to NA")
      return(NA)
    }

    semitones_from_A4 <- 12 * log2(freq / A4_freq)
    midi_note <- round(A4_note + semitones_from_A4)

    note_names <- c("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
    octave <- (midi_note %/% 12) - 1
    note <- note_names[(midi_note %% 12) + 1]

    return(paste0(note, octave))
  }

  notes <- vapply(frequencies, freq_to_note, character(1))
  return(notes)
}

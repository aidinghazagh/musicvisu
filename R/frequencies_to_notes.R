frequencies_to_notes <- function(frequencies, A4_freq = 440, A4_note = 69){
  # Give out an error if input is not numeric
  if (! is.numeric(frequencies)) {
    stop("frequencies vector should be numeric")
  }
  
  # Helper function to convert a single frequency to a note
  freq_to_note <- function(freq) {
    if (freq <= 0) {
      # Give out a warning if we got NA values
      warning("frequency with value 0 or below detected setting note to NA")
      return(NA)
    }

    
    # Calculate the number of semitones from A4
    semitones_from_A4 <- 12 * log2(freq / A4_freq)
    
    # Get the closest MIDI note number
    midi_note <- round(A4_note + semitones_from_A4)
    
    # MIDI note to note name mapping
    note_names <- c("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
    # Perform a int division
    octave <- (midi_note %/% 12) - 1
    # Remainder can be used to calculate the note name
    note <- note_names[(midi_note %% 12) + 1]
    
    return(paste0(note, octave))
  }
  
  # Apply the helper function to each frequency in the vector
  notes <- sapply(frequencies, freq_to_note)
  return(notes)
}

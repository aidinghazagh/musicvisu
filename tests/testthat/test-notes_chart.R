describe("notes_chart()", {
  # "Happy Birthday" song notes and corresponding timestamps
  notes <- c(
    "G4", "G4", "A4", "G4", "C5", "B4", 
    "G4", "G4", "A4", "G4", "D5", "C5", 
    "G4", "G4", "G5", "E5", "C5", "B4", "A4", 
    "F5", "F5", "E5", "C5", "D5", "C5"
    # Repeat to simulate larger dataset
    #"G4", "G4", "A4", "G4", "C5", "B4", 
    #"G4", "G4", "A4", "G4", "D5", "C5", 
    #"G4", "G4", "G5", "E5", "C5", "B4", "A4", 
    #"F5", "F5", "E5", "C5", "D5", "C5"
  )
  timestamps <- c(
    0.0, 0.5, 1.0, 1.5, 2.0, 3.0,
    4.0, 4.5, 5.0, 5.5, 6.0, 7.0,
    8.0, 8.5, 9.0, 9.5, 10.0, 11.0, 12.0,
    13.0, 13.5, 14.0, 14.5, 15.0, 16.0
    # Repeat timestamps to simulate larger dataset
    #17.0, 17.5, 18.0, 18.5, 19.0, 20.0,
    #21.0, 21.5, 22.0, 22.5, 23.0, 24.0,
    #25.0, 25.5, 26.0, 26.5, 27.0, 28.0, 29.0,
    #30.0, 30.5, 31.0, 31.5, 32.0, 33.0
  )
  it("can validate inputs",{
    expect_error(notes_chart(c("C1", timestamps)))
    expect_error(notes_chart(c(
      "as", "www", "hhtt", "gsfh", "C5", "B4", 
      "G4", "dg", "A4", "G4", "vb", "C5", 
      "G4", "G4", "G5", "E5", "C5", "B4", "A4", 
      "F5", "F5", "E5", "C5", "D5", "C5"
    ), timestamps))
    expect_error(notes_chart(notes, c(
      0.0, "0.5", 1.0, 1.5, 2.0, 3.0,
      4.0, 4.5, 5.0, "hello", 6.0, 7.0,
      8.0, 8.5, 9.0, 9.5, 10.0, 11.0, 12.0,
      13.0, 13.5, 14.0, 14.5, 15.0, 16.0
    )))
  })
  it("can give correct output and create plot",{
    output_dir <- tempdir()
    notes_chart(notes, timestamps, output_dir)
    
    output_file <- file.path(output_dir, "note-chart.png")
    expect_true(file.exists(output_file))
    
    expect_match(tools::file_ext(output_file), "png")
  })
})
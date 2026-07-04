describe("note_duration_chart()", {
  notes <- c("C4", "D4", "E4", "F4", "G4")
  timestamps <- c(0.0, 1.0, 2.5, 3.0, 5.0)

  it("can create a duration chart from valid input", {
    output_dir <- tempdir()

    note_duration_chart(notes, timestamps, output_dir)

    output_file <- file.path(output_dir, "note-duration.png")
    expect_true(file.exists(output_file))
    expect_match(tools::file_ext(output_file), "png")
  })

  it("errors on mismatched lengths", {
    expect_error(note_duration_chart(c("C4", "D4"), c(0.0, 1.0, 2.0), tempdir()))
  })

  it("errors on invalid note names", {
    expect_error(note_duration_chart(c("X4", "D4"), c(0.0, 1.0), tempdir()))
  })

  it("errors on non-numeric timestamps", {
    expect_error(note_duration_chart(c("C4", "D4"), c("a", "b"), tempdir()))
  })

  it("errors with fewer than 2 notes", {
    expect_error(note_duration_chart("C4", 0.0, tempdir()))
  })
})

describe("frequencies_to_notes()", {
  it("can turn frequencies to notes", {
    expect_equal(frequencies_to_notes(c(440, 880, 261.63)), c("A4", "A5", "C4"))
  })
  it("can give out a warning when a input is 0 or in negative",{
    expect_warning(frequencies_to_notes(c(440, 880, 0)))
    
  })
  it("can give out an error if non numeric values are provided", {
    expect_error(frequencies_to_notes(c(440, 880, "string")))
  })
  it("can give out a warning if a frequency is 0 or below", {
    expect_warning(frequencies_to_notes(c(440, 0, 880)))
    expect_warning(frequencies_to_notes(c(440, -5, 880)))
  })
})
describe("waveform_chart()", {
  it("can create a waveform plot from valid input", {
    sample_rate <- 44100
    t <- seq(0, 0.01, length.out = 441)
    samples <- sin(2 * pi * 440 * t)
    output_dir <- tempdir()

    waveform_chart(samples, sample_rate, output_dir)

    output_file <- file.path(output_dir, "waveform.png")
    expect_true(file.exists(output_file))
    expect_match(tools::file_ext(output_file), "png")
  })

  it("errors on non-numeric samples", {
    expect_error(waveform_chart("not_a_number", 44100, tempdir()))
  })

  it("errors on invalid sample_rate", {
    samples <- sin(1:100)
    expect_error(waveform_chart(samples, -1, tempdir()))
    expect_error(waveform_chart(samples, 0, tempdir()))
  })

  it("errors on non-existent output directory", {
    samples <- sin(1:100)
    expect_error(waveform_chart(samples, 44100, "non_existent_dir"))
  })

  it("errors on too few samples", {
    expect_error(waveform_chart(c(1), 44100, tempdir()))
  })
})

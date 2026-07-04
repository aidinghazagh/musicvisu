describe("frequency_spectrum()", {
  it("can create a spectrum plot from valid input", {
    sample_rate <- 1000
    t <- seq(0, 1, length.out = sample_rate)
    samples <- sin(2 * pi * 440 * t)
    output_dir <- tempdir()

    frequency_spectrum(samples, sample_rate, output_dir)

    output_file <- file.path(output_dir, "frequency-spectrum.png")
    expect_true(file.exists(output_file))
    expect_match(tools::file_ext(output_file), "png")
  })

  it("can limit frequency range", {
    sample_rate <- 1000
    t <- seq(0, 1, length.out = sample_rate)
    samples <- sin(2 * pi * 100 * t)
    output_dir <- tempdir()

    frequency_spectrum(samples, sample_rate, output_dir, max_freq = 500)

    output_file <- file.path(output_dir, "frequency-spectrum.png")
    expect_true(file.exists(output_file))
  })

  it("errors on non-numeric samples", {
    expect_error(frequency_spectrum("not_a_number", 44100, tempdir()))
  })

  it("errors on invalid sample_rate", {
    samples <- sin(1:100)
    expect_error(frequency_spectrum(samples, -1, tempdir()))
    expect_error(frequency_spectrum(samples, 0, tempdir()))
  })

  it("errors on non-existent output directory", {
    samples <- sin(1:100)
    expect_error(frequency_spectrum(samples, 44100, "non_existent_dir"))
  })

  it("errors on too few samples", {
    expect_error(frequency_spectrum(c(1), 44100, tempdir()))
  })
})

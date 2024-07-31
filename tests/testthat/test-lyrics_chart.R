describe("lyrics_chart()", {
  output_dir <- tempdir()
  it("can give correct output and create plot", {
    sample_lyrics <- "Hello world, hello everyone. Hello to the world!"
    sample_file <- tempfile(fileext = ".txt")
    
    writeLines(sample_lyrics, sample_file)
    
    
    lyrics_chart(sample_file, output_dir, filterCount = 1)
    
    # Check if the output file is created
    output_file <- file.path(output_dir, "word-chart.png")
    expect_true(file.exists(output_file))
    
    expect_match(tools::file_ext(output_file), "png")
  })
  it("can validate inputs", {
    expect_error(lyrics_chart("non_existent_file.txt", output_dir))
    
    
    sample_lyrics <- "Hello world, hello everyone. Hello to the world!"
    sample_file <- tempfile(fileext = ".txt")
    writeLines(sample_lyrics, sample_file)
    
    expect_error(lyrics_chart(sample_file, "non_existent_dir"))
    
    
    expect_error(lyrics_chart(sample_file, output_dir, filterCount = -1))
    expect_error(lyrics_chart(sample_file, output_dir, filterCount = 0))
    expect_error(lyrics_chart(sample_file, output_dir, filterCount = 1.5))
    expect_error(lyrics_chart(sample_file, output_dir, filterCount = 16))
  })
})
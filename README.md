# musicvisu R package

## Overview

musicvisu is an R package that A music themed package to help visualize notations and lyrics. It provides functions to transform frequency data to musical notations, create a chart of most occurred words of a song lyrics and create a chart of notations and their timestamps relative to eachother.

## Installation

You can install the released version of musicvizu from CRAN with:

> install.packages("musicvizu")


Or the development version from GitHub with:

> devtools::install_github("aidinghazagh/musicvisu")


## Features

- Transform your frequency data to musical notations
- Find out how many times a word gets repeated in a song and analyze patterns
- Create charts from musical notes and find interesting observation and relations between them

## Usage

### frequencies_to_notes()
> frequencies <- c(440, 880, 241.5)
> notes <- frequencies_to_notes(frequencies)
> cat(notes)

### lyrics_chart()
> file <- "C:/Users/u/R/CS50 final project/yesterday.txt"
> output <- "C:/Users/u/R/CS50 final project/"
> lyrics_chart(file, output, filterCount = 3)

### notes_chart
> notes <- c(
>   "G4", "G4", "A4", "G4", "C5", "B4", 
>   "G4", "G4", "A4", "G4", "D5", "C5", 
>   "G4", "G4", "G5", "E5", "C5", "B4", "A4", 
>   "F5", "F5", "E5", "C5", "D5", "C5"
> )
> timestamps <- c(
>   0.0, 0.5, 1.0, 1.5, 2.0, 3.0,
>   4.0, 4.5, 5.0, 5.5, 6.0, 7.0,
>   8.0, 8.5, 9.0, 9.5, 10.0, 11.0, 12.0,
>   13.0, 13.5, 14.0, 14.5, 15.0, 16.0
> )
> output_dir <- "C:/Users/u/R/CS50 final project/"
>
> notes_chart(notes, timestamps, output_dir)


## License
This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
[ghazaghaidin@gmail.com](mailto:ghazaghaidin@gmail.com)
[linkedin](https://linkedin.com/in/aidin-ghazagh)

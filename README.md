# 🎶 musicvisu R package

## #️⃣ Indexes
- [Overview](#-overview)
- [Installation](#-installation)
- [Features](#-features)
- [Usage](#-usage)
  - [frequencies_to_notes()](#-frequencies_to_notes)
  - [lyrics_chart()](#-lyrics_chart)
  - [notes_chart()](#-notes_chart)
- [License](#-license)
- [Contributing](#-contributing)
- [Contact](#-contact)

## 👓 Overview

musicvisu is an R package that helps visualize musical notations and lyrics. It provides functions to transform frequency data to musical notations, create a chart of most occurred words of a song lyrics and create a chart of notations and their timestamps relative to eachother.

## 📦 Installation

You can install the released version of musicvizu from CRAN with:
```r
install.packages("musicvisu")
```

Or the development version from GitHub with:
```r
devtools::install_github("aidinghazagh/musicvisu")
```

## 🚀 Features

- Transform your frequency data to musical notations
- Find out how many times a word gets repeated in a song and analyze patterns
- Create charts from musical notes and find interesting observation and relations between them

## 📚 Usage

### • frequencies_to_notes()
```r
frequencies <- c(440, 880, 241.5)
notes <- frequencies_to_notes(frequencies)
cat(notes)
```

### • lyrics_chart()
```r
file <- "C:/Users/u/R/CS50 final project/yesterday.txt"
output <- "C:/Users/u/R/CS50 final project/"
lyrics_chart(file, output, filterCount = 3)
```

### • notes_chart()
```r
notes <- c(
  "G4", "G4", "A4", "G4", "C5", "B4", 
  "G4", "G4", "A4", "G4", "D5", "C5", 
  "G4", "G4", "G5", "E5", "C5", "B4", "A4", 
  "F5", "F5", "E5", "C5", "D5", "C5"
)

timestamps <- c(
  0.0, 0.5, 1.0, 1.5, 2.0, 3.0,
  4.0, 4.5, 5.0, 5.5, 6.0, 7.0,
  8.0, 8.5, 9.0, 9.5, 10.0, 11.0, 12.0,
  13.0, 13.5, 14.0, 14.5, 15.0, 16.0
)
output_dir <- "C:/Users/u/R/CS50 final project/"
notes_chart(notes, timestamps, output_dir)
```

## 📄 License
This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🤝 Contributing
Contributions are welcome! If you have any ideas or suggestions, feel free to open an issue or create a pull request.

## 📧 Contact
If you have any questions or feedback, feel free to reach out:

Email: [ghazaghaidin@gmail.com](mailto:ghazaghaidin@gmail.com)

Linkedin: [Aidin Ghazagh](https://linkedin.com/in/aidin-ghazagh)

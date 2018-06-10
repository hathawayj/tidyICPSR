#'Parse a Stata dictionary file for use in R
#'
#'R cannot read Stata's dictionary files directly. This function parses the
#'dictionary file to a \code{tibble} that can be used to further process
#'the data files and make them usable with R.
#'
#'Many datasets are distributed as a combination of Stata \code{.dat} (data,
#'usually fixed-width-format), \code{.dct} (dictionary), and \code{.do} (other
#'commands for Stata, for example recoding the data and so on) files. The
#'dictionary files are used to tell Stata details like which column in the data
#'file represents the starting position of the data for a given variable, how
#'many columns should be read for that given variable, what the storage type of
#'that variable is, and what that variable's name and label shoud be.
#'
#'The expected workflow might include (1) parsing the dictionary file using
#'\code{\link{dct_parser}}, (2) re-assigning some of the metadata extracted from the
#'dictionary file to your newly imported dataset.
#'
#'@param file Stata dictionary file, most often with a \code{.dct} extension.
#'@param names_to_lower defaults to TRUE.  If TRUE then the column names are changed to
#' all lower case with `str_to_lower()`.
#'@author Ananda Mahto
#'@references \itemize{ \item Stata data types:
#'\url{http://www.stata.com/help.cgi?datatypes} \item Stata help for
#'fixed-format data:
#'\url{http://www.stata.com/support/faqs/data-management/reading-fixed-format-data/}
#'\item Initial version of function on Stack Overflow:
#'@examples
#'
#'## Read an example dictionary file
#'
read_dct <- function(file, names_to_lower = TRUE) {
  # read in the dct file.  It is just an ASCII file.
  temp <- read_lines(file)
  # find the rows that describe the columns
  temp <- temp[temp %>% str_which("_column")]

  # This pattern stuff was borrowed from https://github.com/mrdwab/StataDCTutils
  pattern <- c(column = ".*\\(([0-9 ]+)\\)",
               parse = "(byte|int|long|float|double|str[0-9]+)",
               name = "(.*)",
               width = "%([0-9.]+)[a-z]+",
               label = "(.*)")
  pattern <- paste(paste(pattern[mymatch],
                         collapse ="\\s+"), "$", sep = "")

  # now create the columns
  start_parse <-  temp %>%
    str_extract_all(".*\\(([0-9 ]+)\\)") %>%
    unlist() %>%
    parse_number()

  parse_parse <-  temp %>%
    str_extract_all("(byte|int|long|float|double|str[0-9]+)") %>%
    map(1) %>%
    unlist()

  name_parse <- temp %>%
    str_replace_all(pattern, "\\3") %>%
    str_split_fixed(":", 2) %>%
    .[,1] %>%
    str_trim()

  if(names_to_lower) name_parse <- str_to_lower(name_parse)

  width_parse <- temp %>%
    str_extract_all("%([0-9.]+)[a-z]+") %>%
    unlist() %>%
    parse_number()

  label_parse <- temp %>%
    str_replace_all(pattern, "\\5") %>%
    str_replace_all('\"', '') %>%
    str_trim()

  out <- tibble(start = start_parse, name = name_parse,
                width = width_parse, parse = parse_parse, label = label_parse) %>%
    arrange(start)
  out



}

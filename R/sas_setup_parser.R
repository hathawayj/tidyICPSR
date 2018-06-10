#'Parse a Stata dictionary file for use in R
#'
#'R cannot read SAS's setup files directly. This function parses the
#'dictionary file to a \code{tibble} that can be used to further process
#'the data files and make them usable with R.
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
read_sas_format <- function(file, names_to_lower = TRUE) {
  # read in the dct file.  It is just an ASCII file.
  temp <- read_lines(file)

  spformat <- temp %>% str_which("SAS PROC FORMAT;")
  pformat <- temp %>% str_which("PROC FORMAT;")

  temp <- temp[-c(1:pformat[!pformat %in% spformat])]

  commentformat <- temp %>% str_which("\\*/")

  temp <- temp[-c(commentformat[1]:length(temp))]


  # function to build lists for use with dplyr::recode
  num_to_value <- function(x){
    map_values <- x %>% str_split("[:graph:]+=") %>% unlist() %>% .[-1]
    nvalues <- map_values %>%
      str_extract_all("\\([-]?[:digit:]+\\)") %>%
      unlist() %>%
      parse_number()

    mvalue <-  map_values %>%
      str_replace_all("\\([-]?[:digit:]+\\)", "") %>%
      str_replace_all("'", "") %>%
      str_replace_all(" ;", "") %>%
      str_trim()
    names(mvalue) = nvalues

    as.list(mvalue)

  }

  col_names <- temp %>%
    str_trim() %>%
    str_extract_all("VALUE [:graph:]+") %>%
    unlist() %>%
    str_replace_all("VALUE", "") %>%
    str_trim()



  out <- temp %>%
    str_trim() %>%
    str_c(collapse = " ") %>%
    str_split("VALUE [:graph:]+") %>%
    unlist() %>%
    .[-1] %>%
    as.list() %>%
    map(num_to_value)


  names(out) <- col_names
  out

}



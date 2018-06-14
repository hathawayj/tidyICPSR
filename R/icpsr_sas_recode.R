#'Parse a SAS PROC FORMAT file for use in R
#'
#'R cannot read SAS's setup files directly. This function parses the
#'dictionary file to a \code{tibble} that can be used to further process
#'the data files and make them usable with R.
#'


#'@param file SAS Proc Format File from ICPSR, with a \code{.sas} extension.
#'@author J. Hathaway
#'@references \itemize{ \item SAS data types:
#'\url{http://support.sas.com/documentation/cdl/en/fedsqlref/67364/HTML/default/viewer.htm#n19bf2z7e9p646n0z224cokuj567.htm}
#'@examples
#'
#'## Read an example dictionary file
#'
icpsr_sas_recode <- function(file) {
  # read in the sas file.  It is just an ASCII file.
  temp <- read_lines(file)

  spformat <- temp %>% str_which("SAS PROC FORMAT;")
  pformat <- temp %>% str_which("PROC FORMAT;")

  temp <- temp[-c(1:pformat[!pformat %in% spformat])]

  commentformat <- temp %>% str_which("\\*/")

  temp <- temp[-c(commentformat[1]:length(temp))]


  # function to build lists for use with dplyr::recode
  num_to_value <- function(x){
    map_values <- x %>%
      str_replace(">=", "geq") %>%
      str_replace("<=", "leq") %>%
      str_split("[:graph:]+=") %>%
      unlist() %>% .[-1]
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



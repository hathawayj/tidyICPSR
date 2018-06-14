#'Parse a SAS PROC FORMAT file for use in R
#'
#'R cannot read SAS's setup files directly. This function parses the
#'dictionary file to a \code{tibble} that can be used to further process
#'the data files and make them usable with R.
#'


#'@param file SAS Proc Format File from ICPSR, with a \code{.sas} extension.
#'@param to_lower can be "short", "long", or "both".  Defaults to "both". With both all characters are moved to lowercase.
#'@author J. Hathaway
#'@references \itemize{ \item SAS data types:
#'\url{http://support.sas.com/documentation/cdl/en/fedsqlref/67364/HTML/default/viewer.htm#n19bf2z7e9p646n0z224cokuj567.htm}
#'@examples
#'
#'## Read an example dictionary file
#'
icpsr_sas_rename <- function(file, to_lower = c("short", "long", "both")[3]) {
  # read in the sas file.  It is just an ASCII file.
  temp <- read_lines(file)

  label_format <- temp %>% str_which("SAS LABEL STATEMENT") + 1
  label_format_end <- temp %>% str_which("USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS") - 1

  temp <- temp[label_format:label_format_end]

  # keep only the lines with an '=' sign
  #
  temp <- temp[temp %>% str_which("=")]


  # split on '='

  temp <- temp %>% str_split_fixed("=", n = 2)

  short <- temp[,1] %>% str_trim()
  long <-  temp[,2] %>% str_remove_all("'") %>% str_trim()


  if(to_lower %in% c("both", "short")) short <- short %>% str_to_lower()
  if(to_lower %in% c("both", "long")) long <- long %>% str_to_lower()

  out <- short
  names(out) <- long
  out

}



#' @title icpsr_manifest_history
#' @description Returns a list of historical changes to the data.
#' @param download_folder is download folder that has `ICPSR_[####]` for the folder name from using `iscpsr_download.R`. Defaults to `NULL`.
#' If `NULL`, the user can select the folder.
#' @param md_list defaults to `TRUE`. If `TRUE` then the function prints a md bulleted list of the version history. If `FALSE`, then a vector is returned with each item being a version not on a specific date.
#' @param manifest_file_append is the text to append to the value from the `download_folder` variable. Defaults to '-manifest.txt'
#' @return
#' @export
icpsr_manifest_history <- function(download_folder = NULL, md_list = TRUE, manifest_file_append = "-manifest.txt") {
  # reutrn file paths to read in data
  # filepaths, File description, has data .tsv, has data .txt, has setup.sas
  #
  if(is.null(download_folder)) download_folder <- choose.dir()

  pnumber <- download_folder %>% str_extract("[0-9]+")
  file <- str_c(pnumber, manifest_file_append)
  temp <- read_lines(path(download_folder,file))

  begin_d <- temp %>% str_which("Version History") + 1
  end_d <- length(temp) - 1

  text <- temp[begin_d:end_d] %>%
    str_c(collapse = " ") %>%
    str_trim()

  notes <- text %>%
    str_split( "[0-9]{4}-[0-9]{2}-[0-9]{2}") %>%
    unlist() %>%
    .[-1]

  dates <- text %>%
    str_extract_all( "[0-9]{4}-[0-9]{2}-[0-9]{2}") %>%
    unlist()

  out <- str_c(dates, notes, sep = ": ")


  if (md_list == FALSE)
    {
    return(out)
    } else (md_list == TRUE)
    {

    str_c("- ", out) %>%
      str_c(collapse = "\n") %>%
      cat();

    }


}

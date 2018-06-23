#' @title icpsr_manifest_description
#' @description Returns the study description paragraph.
#' @param download_folder is download folder that has `ICPSR_[####]` for the folder name from using `iscpsr_download.R`. Defaults to `NULL`.
#' If `NULL`, the user can select the folder.
#' @param manifest_file_append is the text to append to the value from the `download_folder` variable. Defaults to '-manifest.txt'
#' @param md_marks allows the user to add bold `(**)` or italics `(*)` to the front and back of the output.
#' @return
#' @export
icpsr_manifest_description <- function(download_folder = NULL, manifest_file_append = "-manifest.txt", md_marks = "*") {
  # reutrn file paths to read in data
  # filepaths, File description, has data .tsv, has data .txt, has setup.sas
  #
  if(is.null(download_folder)) download_folder <- choose.dir()

  pnumber <- download_folder %>% str_extract("[0-9]+")
  file <- str_c(pnumber, manifest_file_append)
  temp <- read_lines(path(download_folder,file))


  begin_d <- temp %>% str_which("File Manifest") + 1
  end_d <- temp %>% str_which("Details on the version history can be found below the file listings") -1

  out <- temp[begin_d:end_d] %>%
    str_c(collapse = " ") %>%
    str_trim()


  str_c(md_marks,out,md_marks)

}



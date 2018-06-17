#' @title recode_all
#' @description moves through a list object created by `icpsr_sas_recode()` and recodes all columns
#' @param dat is the data set
#' @param y is the output from `icpsr_sas_recode()`
#' @export
recode_all <- function(dat, y){
  x <- names(y)

  x <- x[x %in% colnames(dat)]

  for (i in seq_along(x)){
    new_values <- recode(dat[,x[i]][[1]], !!!y[[x[i]]], .default = "missing")

    dat <- dat %>% mutate(!!x[i] := new_values)

  }
  dat

}

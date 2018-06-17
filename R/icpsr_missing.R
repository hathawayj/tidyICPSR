#' @title icpsr_missing
#' @description Changes the missing values to NA that would code to text descriptions in numeric variables
#' @param column is the column that needs the missing values replaced.
#' @param missing_values are the numbers that map to missing
#' @export
icpsr_missing <- function(column, missing_values = c(-8,-5,-4,-3,-2,-1)) {
  ifelse(column %in% missing_values, NA, column)
}

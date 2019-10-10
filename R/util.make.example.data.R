#'Make Example Data Turns a data.frame into example data generating code. These
#'code snippets are use in function examples and tests. By default the first
#'five rows are used.
#'@param data.sample must be a data.frame
#'
#'@return A text object
#'
#'@export
#'
#' @examples
#' data("trees")
#' my.data <- trees
#' util.make.example.data(my.data)
#'
util.make.example.data <- function(data.sample, rows.to.use = 5){
  # Get the stats
  num.of.cols <- ncol(data.sample)
  column.names <- colnames(data.sample)

  num.of.rows <- nrow(data.sample)
  # Set the number of rows to use
  if(num.of.rows > rows.to.use){ rows.to.use.checked <- rows.to.use }

  data.sample.working <- head(data.sample, n = rows.to.use.checked)

  row.names.to.use <- row.names(data.sample.working)

  my.working.row <- ""
  my.set.of.rows <- ""
  # Create the list structure as nested loops
  for(my.row.index in 1:rows.to.use.checked ) {

    for(my.col.index in 1:num.of.cols){
      my.element <- paste( column.names[my.col.index], "=",
                           data.sample.working[my.row.index,my.col.index], sep ="")
     #my.working.row <- paste( my.element, sep = "," )
      my.working.row[[my.col.index]] <-  my.element

    #cat(row.names.to.use[my.row.index],"=","\n"  )

  } # rows
    my.row.name <- row.names.to.use[my.row.index]
    my.set.of.rows[[my.row.name]] <- list(my.working.row[[my.col.index]])
  } # cols
}

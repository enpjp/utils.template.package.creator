#'Post Package Setup
#'
#' This function does the final setup of the newly created package.
#' No parameters are required.
#'
#'

#'
#'@return post.package
#'@export post.package
#'

post.package <- function() {

  usethis::use_roxygen_md()
  devtools::document()
  usethis::use_pipe()

 # To help with the workflow we need a sub directory in inst as a working space.
 # This is the <package name>.inst.dev and needs to be added to .git ignore and
 # .buildignore. The syntax is fussy so best to use these functions.

 # usethis::use_package("devtools")
 # usethis::use_package("usethis")
}

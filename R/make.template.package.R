#' Make Template Package
#'
#' @param set.my.name  string with user name
#' @param set.package.name  string with user name
#'
#' @return make.template.package
#' @export make.template.package
#'

make.template.package <- function(set.my.name,set.package.name) {
 #options(full_name = set.my.name)
  nice.name <- make.names(set.package.name)
  # Create the new package
  usethis::create_package(nice.name, open = FALSE)
  # Create a first markdown template with the package name
  usethis::use_rmarkdown_template(template_name = nice.name)
  # Add data-raw
  usethis::use_data_raw
  # Add inst/extdata
  relative.path.name <-  paste("inst",
                               .Platform$file.sep,
                               "extdata",
                               sep = "")

  usethis::use_directory(relative.path.name, ignore = FALSE)
  # Make the package into a git repository
  usethis::use_git(message = "Initial commit")
 # To help with the workflow we need a sub directory in inst as a working space.
 # This is the <package name>.inst.dev and needs to be added to .git ignore and
 # .buildignore. The syntax is fussy so best to use these functions.
  relative.path.name <-  paste("inst",
                               .Platform$file.sep,
                               nice.name,
                                   ".inst.dev",
                                   sep = "")
  usethis::use_directory(relative.path.name, ignore = TRUE)
  usethis::use_git_ignore(relative.path.name)
  # Update description. You can set defaults
  usethis::use_description()

  # Add a licence
  usethis::use_mit_license(set.my.name)



 # usethis::use_package("devtools")
 # usethis::use_package("usethis")
}

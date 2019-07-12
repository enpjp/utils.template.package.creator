#' Make Template Package
#'
#' @param set.my.name  string with user name
#' @param set.package.name  string with user name
#'
#' @return make.template.package
#' @export make.template.package
#'

make.template.package <- function(set.my.name,set.package.name) {
 options(full_name = set.my.name)
  # Create the new package
  usethis::create_package(set.package.name, open = FALSE)
  # Create a first markdown template with the package name
  usethis::use_rmarkdown_template(template_name = set.package.name)
  # Add data-raw
  usethis::use_data_raw
  # Make the package into a git repository
  usethis::use_git(message = "Initial commit")
 # To help with the workflow we need a sub directory in inst as a working space.
 # This is the <package name>.inst.dev and needs to be added to .git ignore and
 # .buildignore. The syntax is fussy so best to use these functions.
  relative.path.name <-  file.path("inst/",
                                   set.package.name,
                                   ".inst.dev",
                                   fsep = .Platform$file.sep)
  usethis::use_directory(relative.path.name, ignore = TRUE)
  usethis::use_git_ignore(relative.path.name)



 # usethis::use_package("devtools")
 # usethis::use_package("usethis")
}

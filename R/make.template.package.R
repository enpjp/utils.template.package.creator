#'Make Template Package
#'
#'This function does all the hard work when setting up a new template package.
#'It creates a new RStudio template that may be used as a basis for a reproducible
#'and reusable analysis.
#'
#'
#'@param set.my.name  string with user name
#'@param set.package.name  string with package name
#'
#'@return make.template.package
#'@export make.template.package
#'

make.template.package <- function(set.my.name,set.package.name) {
  this.package.name <- c("utils.template.package.creator")
 #options(full_name = set.my.name)
  nice.name <- make.names(set.package.name)
  # Create the new package
  usethis::create_package(nice.name, open = FALSE)


  my.working.project <- fs::path(getwd(),nice.name)
  usethis::proj_set( my.working.project)
  usethis::use_mit_license(set.my.name)
 # usethis::use_roxygen_md()


  # Create a first markdown template with the package name
  #usethis::use_rmarkdown_template(template_name = nice.name)
  # We will use this package template to create the skeleton.
  # This will have to be done in several stages
  # First create the .yml file in the correct place
  template.name <- paste("template-",nice.name, sep="")
  template.path.name  <-  fs::path(nice.name,"inst",
                               "rmarkdown",
                               "templates",
                               template.name
                               )
  fs::dir_create(template.path.name)
  # update template name

  template_source <- fs::path_package(package = this.package.name,"inst",
                                      "templates","rmarkdown-template.yml")
  # skeleton path name
 skeleton.path.name  <-  fs::path("inst",
                                   "rmarkdown",
                                  "templates",
                                   template.name
  )


usethis::with_project( my.working.project,
  usethis::use_template("rmarkdown-template.yml",
                    save_as = fs::path(skeleton.path.name,
                                    "template", ext= "yml"),
                              data = list(template_name = nice.name,
                              template_description = "Edit this description",
                              template_create_dir = FALSE),
                                    package = this.package.name
                                    )
)


  # Now add the Rmarkdown template

# skeleton path name
markdown.path.name  <-  fs::path(nice.name,"inst",
                                 "rmarkdown",
                                 "templates",
                                 template.name,
                                 "skeleton"

)

# Create the path
fs::dir_create(markdown.path.name)
# Update the path name

markdown.path.name  <-  fs::path("inst",
                                 "rmarkdown",
                                 "templates",
                                 template.name,
                                 "skeleton"

)

# Now create the skeleton file
usethis::with_project( my.working.project,
  usethis::use_template("rmarkdown-template.Rmd",
                        save_as = fs::path(markdown.path.name,
                                        "skeleton", ext = "Rmd"),
                                        package = this.package.name
                      )
# End use with project
)


  # Add inst/extdata
  relative.path.name <-  fs::path(nice.name,"inst",
                               "extdata")
  fs::dir_create(relative.path.name)

  # Add inst dev path
  dev.name <- paste(nice.name, ".inst.dev", sep = "")
  relative.path.name <-  fs::path(nice.name,"inst",
                                  "dev", dev.name)
  fs::dir_create(relative.path.name)

  usethis::use_build_ignore(fs::path("inst", "dev", dev.name))
  usethis::use_git_ignore(fs::path("inst", "dev", dev.name))

 # To help with the workflow we need a sub directory in inst as a working space.
 # This is the <package name>.inst.dev and needs to be added to .git ignore and
 # .buildignore. The syntax is fussy so best to use these functions.

 # usethis::use_package("devtools")
 # usethis::use_package("usethis")
}

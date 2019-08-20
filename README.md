# utils.template.package.creator
Makes template frameworks

## Background
This package supplies R commands to simplify the creation of R Studio templates that follow the principles originally developed by Paul Palmer. The basic idea is to extend the requirements of reproducible analysis into **reusable** templates that embody tools that will work for data from different sources. The practical realisation supplies skeleton templates that will load data from multiple files supplied in a **data-raw** directory.

Many files are presented in a human readable **wide-format**, often as spreadsheets. This is not a problem as these files may be parsed and transformed into the **long format** which forms the basis of most R analysis using code suggestions within the template. Multiple files in long-format that have common columns may be easily combined into a single convenient data object for reuse in downstream analysis.

## Loading this package

'utils.template.package.creator' is available from Github at:

https://github.com/enpjp/utils.template.package.creator 

### Before you start

This package is currently designed to work with RStudio which can be downloaded from:
https://www.rstudio.com/products/rstudio/download/

If you have not updated R in a while update all your installed packages. This may take a while so get it to update all.

     update.packages(ask = FALSE)

## Creating your template package

You will need to install and load devtools to work on your package. Using the console in RStudio enter the following commands:

     install.packages("devtools", "roxygen2")
     library(devtools)

And finally this package:

     install_github("enpjp/utils.template.package.creator")

We are now ready to create the basic package. First use the RStudio session menu to switch to the directory where you would like to create the package. The enter the following command:

    library(utils.template.package.creator)
    make.template.package("Your name", "New package name")

You may now load the new package using the RStudio Open project menu. Reload devtools and roxygen2:

    library(devtools)
    library(roxygen2)
    library(utils.template.package.creator)

And run the post package set up command in the consule window

    post.package()
    
If all has gone to plan there will be no errors and you may check the package with:

    check()
    document()
    
The first template will be visible in the new file from template menu.
file >> new file >> R markdown.. >> From Template
    

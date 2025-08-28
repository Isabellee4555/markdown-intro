# Load source files -------------------------------------------------------

source("src/utils.R")
source("src/parameters.R")


# Presentation ------------------------------------------------------------

rmarkdown::render("programs/intro.rmd",
                  output_dir = "reports/",
                  output_file = "Rmarkdown_introduction_report.docx",
                  output_format = officedown::rdocx_document(
                    reference_docx = "src/template.docx"),
                  params = list(as_gt = FALSE),
                  knit_root_dir  = getwd())

rmarkdown::render("programs/intro.rmd",
                  output_dir = "reports/",
                  output_file = "Rmarkdown_introduction_report.html",
                  output_format = c("prettydoc::html_pretty"),
                  params = list(as_gt = TRUE),
                  knit_root_dir  = getwd())
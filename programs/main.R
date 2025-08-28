# Load source files -------------------------------------------------------

source("src/utils.R")
source("src/parameters.R")


# Presentation ------------------------------------------------------------

rmarkdown::render("programs/intro.rmd",
                  output_dir = "reports/",
                  output_file = "Rmarkdown_introduction_report.docx",
                  output_format = officedown::rdocx_document(
                    reference_docx = "src/template.docx"),
                  params = list(
                    as_gt = FALSE, 
                    cutoff_date = "2025-09-15", 
                    data_extract_date = "2025-08-15",
                    last_cutoff_date = "2025-03-24"
                    ),
                  knit_root_dir  = getwd())

rmarkdown::render("programs/intro.rmd",
                  output_dir = "reports/",
                  output_file = "Rmarkdown_introduction_report.html",
                  output_format = c("prettydoc::html_pretty"),
                  params = list(
                    as_gt = TRUE,
                    cutoff_date = "2025-09-15", 
                    data_extract_date = "2025-08-15",
                    last_cutoff_date = "2025-03-24"
                                ),
                  knit_root_dir  = getwd())
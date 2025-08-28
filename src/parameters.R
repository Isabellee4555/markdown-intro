library(dplyr)
library(officedown)
library(prettydoc)
library(flextable)
library(gt)
library(DT)
library(plotly)
library(gtsummary)
library(labelled)


var_label_list <- list(
  id             = "Participant ID",
  age            = "Age (years)",
  sex            = "Sex",
  history_of_bp  = "History of blood pressure (self-reported/recorded)",
  blood_pressure = "Systolic blood pressure (mmHg)",
  ecog           = "ECOG status",
  race           = "Race",
  n_stage        = "Nodal stage",
  t_stage        = "Tumour stage"
)

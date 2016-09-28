## This script shows how to connect to bigquery from R
library(bigrquery)
# This flag can be used when you get authentication issues
options("httr_oob_default" = TRUE)
project <- "name_of_project"
sql <- "select variable from TABLE_DATE_RANGE(table_name_, TIMESTAMP('date1'), TIMESTAMP('date2'))"
query_exec(sql, project = project)

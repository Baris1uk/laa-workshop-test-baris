library(dplyr)
library(readr)
#library(tidyr)
#library(lubridate)
library(s3tools)
#library(devtools)
#library(aws.signature)

#devtools::install_github("moj-analytical-services/s3tools")

Movies <- s3tools::read_using(
  FUN = readr::read_csv,
  s3_path = "alpha-laa-workshop-test-baris/MoviesTEST.csv",
  guess_max = 1000000
)

year_category1 <- Movies %>% 
  dplyr::group_by(year) %>% 
  dplyr::summarise(Action_year = sum(Action), Animation_year = sum(Animation), Comedy_year = sum(Comedy), Drama_year = sum(Drama))

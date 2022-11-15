# libraries  -------------------------------------------------------------------
library(tidyverse)
library(rmarkdown)

# data -------------------------------------------------------------------------
data_file <- "Data_Di_Oral_Presentations_Peer-Review.tsv"
df <- read.delim(data_file, check.names = F, as.is=T, encoding="UTF-8")

# preparing loop ---------------------------------------------------------------
to_loop <- df %>% 
  select(BreakoutSession, Presenter) %>% 
  unique()

# loop -------------------------------------------------------------------------
for (i in 1:nrow(to_loop)) {
  rmarkdown::render("Di_Peer-Review_Results.Rmd", 
                    params = list(BreakoutSession = to_loop[i,1],
                                  Presenter = to_loop[i,2],
                                  data = data_file),
                    output_file = paste0("Breakout_", to_loop[i,1], "_Presenter_", to_loop[i,2], ".html"))
  
}

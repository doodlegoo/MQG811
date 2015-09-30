setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))  
  return( dataset)
  
  
}

numero1 <- function() {
  impact = setup()
  summary(impact)
}

numero2 <- function() {
  impact = setup()
  summary(impact)  
  
}

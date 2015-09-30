setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))  
  return( dataset)
  
  
}

numero1 <- function() {
  impactEchant = setup()
  impactPop = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo.sav", to.data.frame=TRUE))  
  print( summary(impactEchant$Region)/sum(table(impactEchant$Region)) )
  print( summary(impactPop$Region)/sum(table(impactPop$Region)) )
  
}

numero2 <- function() {
  impact = setup()
  summary(impact)  
  
}

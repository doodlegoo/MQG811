setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))  
  return( dataset)
  
  
}

numero1 <- function() {
  impactEchant = setup()
  impactPop = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo.sav", to.data.frame=TRUE))  
  propEchant = summary(impactEchant$Region)/sum(table(impactEchant$Region))
  propPop = summary(impactPop$Region)/sum(table(impactPop$Region))
  diffRegion1 = propEchant["Région 1"] - propPop["Région 1"]
  diffRegion2 = propEchant["Région 2"] - propPop["Région 2"]
  diffRegion3 = propEchant["Région 3"] - propPop["Région 3"]
  diffRegion4 = propEchant["Région 4"] - propPop["Région 4"]
  diffRegion5 = propEchant["Région 5"] - propPop["Région 5"]
  print(diffRegion1 )
  print(diffRegion2 )
  print(diffRegion3 )
  print(diffRegion4 )
  print(diffRegion5 )
}

numero2 <- function() {
  impact = setup()
  summary(impact)  
  
}

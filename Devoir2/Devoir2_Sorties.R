setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))  
  return( dataset)
  
  
}

numero1 <- function() {
  impactEchant = setup()
  impactPop = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo.sav", to.data.frame=TRUE))  
  freqEchant = summary(impactEchant$Region)
  freqPop =(summary(impactPop$Region)/ sum(table(impactPop$Region)) )* 900
  print("Frequence projetté de l'échantillon")
  print( freqEchant  )
  print( paste("Total", sum(freqEchant), sep = ": "))
  print("Frequence de la population")
  print (freqPop)
  print( paste("Total", sum(freqPop), sep = ": "))
  
  print ("Loi de Khi-deux")
  print ("Pour chaque région on obtient un écart de :")
  foobar = c()
  
  for (i in 1:length(freqEchant) ){
    foo = ((freqEchant[i]-freqPop[i])^2) / freqPop[i]
    foobar = c(foobar,foo)
  #  print(foo)
  }
  print(foobar)  
  print(paste("Total", sum(foobar),sep = ": "))
  print(" X^2 -> p=0,05 et k=4")
  print(qchisq(.95, df=4))
  
  
  
#  diffRegion1 = ((propEchant["Région 1"] - propPop["Région 1"])^2)/propPop["Région 1"]
#   print(diffRegion1)
#   diffRegion2 = ((propEchant["Région 1"] - propPop["Région 1"])^2)/propPop["Région 1"]
#   print(diffRegion1)
#   diffRegion3 = ((propEchant["Région 1"] - propPop["Région 1"])^2)/propPop["Région 1"]
#   print(diffRegion1)
#   diffRegion4 = ((propEchant["Région 1"] - propPop["Région 1"])^2)/propPop["Région 1"]
#   print(diffRegion1)
#   diffRegion5 = ((propEchant["Région 1"] - propPop["Région 1"])^2)/propPop["Région 1"]
#   print(diffRegion1)
  
}

numero2 <- function() {
  impact = setup()
  summary(impact)  
  
}

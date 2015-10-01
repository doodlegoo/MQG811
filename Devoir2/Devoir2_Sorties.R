setup <- function() {
  options(warn=-1)
  library(foreign)
  # dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE)) 
  dataset = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))
  return( dataset)
  
  
}

numero1 <- function() {
  impactEchant = setup()
<<<<<<< HEAD
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
  
=======
  # impactPop = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo.sav", to.data.frame=TRUE)) 
  impactPop = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir2/ImpactPromo.sav", to.data.frame=TRUE))
  propEchant = summary(impactEchant$Region)/sum(table(impactEchant$Region))
  propPop = summary(impactPop$Region)/sum(table(impactPop$Region))
  
  n1p1 = length(propEchant)* propEchant["Région 1"]
  
  
  
  diffRegion1 = abs(propEchant["Région 1"]- propPop["Région 1"])
  diffRegion2 = abs(propEchant["Région 2"] - propPop["Région 2"])
  diffRegion3 = abs(propEchant["Région 3"] - propPop["Région 3"])
  diffRegion4 = abs(propEchant["Région 4"] - propPop["Région 4"])
  diffRegion5 = abs(propEchant["Région 5"] - propPop["Région 5"])
  print(diffRegion1 )
  print(diffRegion2 )
  print(diffRegion3 )
  print(diffRegion4 )
  print(diffRegion5 )
>>>>>>> f567aca269abe44081368ba54cf2110bffd38cad
}

numero2 <- function() { 
  impactEchant = setup()
  oui = summary(impactEchant$Visite_site)["oui"]
  non = summary(impactEchant$Visite_site)["non"]
  if(impactEchant$Visite_site=="oui")
    print("lala")
  
}

setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE)) 
#    dataset = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))
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
}

numero2 <- function() { 
  impactEchant = setup()
  
  library(gmodels)
  Tableau<- CrossTable(impactEchant$Collections_speciales, impactEchant$Visite_site, prop.c = TRUE,
                       prop.r = FALSE, prop.t = FALSE, chisq=T, prop.chisq=F, expected = T, sresid=T,  format="SPSS") 
  
}
numero2a <- function() { 
  impactEchant = setup()
  
  library(gmodels)
  Tableau<- CrossTable(impactEchant$Collections_speciales, impactEchant$Visite_site, prop.c = TRUE,
                       prop.r = FALSE, prop.t = FALSE, chisq=T, prop.chisq=F, expected = T, resid=T) 

  chi <- Tableau$chisq$statistic
  k<-min(nrow(Tableau$t), ncol(Tableau$t))
  n<- sum(Tableau$t)
  V <- sqrt(chi/(n*(k-1)))
  print(paste("Le v de cramer",V,sep = "= "))
}  


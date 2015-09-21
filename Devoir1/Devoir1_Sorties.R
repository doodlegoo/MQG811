setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir1/Devoir1_Cirque.sav", to.data.frame=TRUE))
  return( dataset)
  
  
}

numero1 <- function() {
  cirque = setup()
  USAnombre =summary(cirque$Pays)["États-Unis"]
  totalPays = sum(table(cirque$Pays))
  USAprop = USAnombre / totalPays
  sortie <- c(USAnombre ,sum(table(cirque$Pays)) , USAprop*100)
  return(sortie)
}

numero2 <- function() {
  cirque = setup()
  t = table(cirque$Pays)
  confint(t)
  
  return ("Hello World")
  
  
}
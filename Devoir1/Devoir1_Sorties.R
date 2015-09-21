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
  a = 31.58
  s = 2
  n = length(cirque$Pays)
  error <- qnorm(0.90)*s/sqrt(n)
  left <- a-error
  right <- a+error
  sortie <- c(a,n,error, left, right)
  return (sortie)
  
  
}
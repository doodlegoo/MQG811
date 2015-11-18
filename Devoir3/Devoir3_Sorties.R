setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss(file.path(getwd(),"Devoir 3/Devoir3_Cirque.sav"), to.data.frame=TRUE))
#    dataset = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir2/ImpactPromo_900.sav", to.data.frame=TRUE))
  return( dataset)
  
options(warn=-1)
library(foreign)
  dataset = suppressWarnings(read.spss(file.path(getwd(),"Testing/Cirque.sav"), to.data.frame=TRUE))
return( dataset)



}

numero1 <- function() {
  cirque = setup()
  summary(cirque)
  
}

numero2 <- function() { 
  
}
numero2a <- function() { 

}  


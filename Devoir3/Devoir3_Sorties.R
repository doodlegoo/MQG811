setup <- function() {
  options(warn=-1)
  library(foreign)
  #dataset = suppressWarnings(read.spss(file.path(getwd(),"Devoir3/Devoir3_Cirque.sav"), to.data.frame=TRUE))
#  dataset = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir3/Devoir3_Cirque.sav", to.data.frame=TRUE))
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir3/Devoir3_Cirque.sav", to.data.frame=TRUE))
  return( dataset)

}

numero1 <- function() {
  cirque = setup()
  cirque2 = cirque[,c(19,6,7 ,18)]
  library(psych)
  describe(cirque2,fast=TRUE)
  
}

numero2 <- function(i) { 
  cirque = setup()
  library(ggplot2)
  if(i==1){
  g1<- qplot(cirque$NombreJoursVente,cirque$Billets ,
            data = cirque,
            geom= c("point","smooth"),
            method= "lm")
  
  print("Nb jour de vente - Billets")
  g1
  }else if(i==2){
    g2<- qplot(cirque$NbPerformances,cirque$Billets ,
              data = cirque,
              geom= c("point","smooth"),
              method= "lm")
    print("Nb de performances - Billets")
    g2
    }else if(i==3){
      g3<- qplot(cirque$Marketing,cirque$Billets ,
              data = cirque,
              geom= c("point","smooth"),
              method= "lm")
      print("Total marketing - Billets")
      g3
    }  
  
  
  
}
numero3 <- function() {
  cirque = setup()
  colnames(cirque)
  cirque2 = cirque[,c(9,16)]
  library(psych)
  describe(cirque2,fast=TRUE)
  
}

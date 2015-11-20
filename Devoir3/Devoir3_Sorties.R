setup <- function() {
  options(warn=-1)
  library(foreign)

  # Pour windows
  dataset = suppressWarnings(read.spss("Devoir3_Cirque.sav", to.data.frame=TRUE))

  # Pour l'interne
  #dataset = suppressWarnings(read.spss(file.path(getwd(),"/Devoir3/Devoir3_Cirque.sav"), to.data.frame=TRUE)) 
  
  # Pour Linux
#  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir3/Devoir3_Cirque.sav", to.data.frame=TRUE))

#  dataset = suppressWarnings(read.spss("~/Rstudio/STT811/mqg811/Devoir3/Devoir3_Cirque.sav", to.data.frame=TRUE))
  
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
statsDescPart2 <- function() {
  cirque = setup()
  colnames(cirque)
  cirque2 = cirque[,c(9,16)]
  library(psych)
  print("Statistiques descriptives")
  describe(cirque2,fast=TRUE)
  
}

correlation <- function(){
  cirque = setup()
  d <- data.frame(Billets=(cirque$Billets),
                  JourVente=(cirque$NombreJoursVente),
                  NbPerformance=(cirque$NbPerformances),
                  Marketing=(cirque$Marketing))
  print("Corrélation de pearson")
  cor(d) # get correlations (returns matrix)
}

correlation2 <- function(){
  cirque = setup()
  d <-data.frame(Billets=(cirque$Billets),
                 JourDeVente=cirque$NombreJoursVente,
                 NbPerformance=cirque$NbPerformances,
                 Orientation=cirque$LongTermOrientation,
                 Appreciation=cirque$AppreciationShow)
  print("Corrélation de pearson")
  cor(d) # get correlations (returns matrix)
}

stats <- function(){
  cirque = setup()
  require(ggplot2)
  require(car)
  require(fBasics)
#   VarDependante = cirque$Billets
#   if(i==1){
#     VarIndependante = cirque$NombreJoursVente
#     titre = "Nb de jour de vente - Billets"
#   }
#   if(i==2){
#     VarIndependante = cirque$NbPerformances
#     titre = "Nb de performances- Billets"
#   }
#   if(i==3){
#     VarIndependante = cirque$LongTermOrientation
#     titre = "Orientation long terme - Billets"
#   }
#   if(i==4){
#     VarIndependante = cirque$AppreciationShow
#     titre = "Appreciation du show - Billets"
#   }
#   print(titre)
#   
#   R = cor(VarDependante,VarIndependante)
#   print("R =")
#   print(R)
#   print("R-deux =")
#   print(R*R)
  VarIndependante = cirque$Billets
  #VarDependante = cirque$NombreJoursVente +cirque$NbPerformances+ cirque$LongTermOrientation+ cirque$AppreciationShow
  
  
  graph<- qplot(VarIndependante,cirque$NombreJoursVente +cirque$NbPerformances+ cirque$LongTermOrientation+ cirque$AppreciationShow ,
             data = cirque,
             geom= c("point","smooth"),
             method= "lm")
  

  #lm(VarIndependante ~ VarDependante, data = cirque)
  
  R2 =  0.5602
  print("R =")
  print(sqrt(R2))
  print("R-deux =")
  print(R2)
  table = lm(VarIndependante ~ cirque$NombreJoursVente +cirque$NbPerformances+ cirque$LongTermOrientation+ cirque$AppreciationShow , data = cirque)
  print("Récapitulatif des modèles et Coefficients")
  print(summary(table))
  print("Intervals de confiance pour les Coefficients")
  print(confint(table))
  print("ANOVA - ligne par ligne")
  print(summary(aov(table)))
  print(graph)
  print("VIF")
  print(vif(table))
  
  print("Test de normalité")
  
  table.res = resid(table)
  print(lillieTest(table.res))
  print(shapiro.test(table.res))
  
  g =plot(table.res/sd(table.res))
  abline(0, 0) 
  print(g)  
}


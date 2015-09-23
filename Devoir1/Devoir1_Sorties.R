setup <- function() {
  options(warn=-1)
  library(foreign)
  dataset = suppressWarnings(read.spss("/home/vincent/Github/mqg811/Devoir1/Devoir1_Cirque.sav", to.data.frame=TRUE))
  return( dataset)
  
  
}

numero1 <- function() {
  cirque = setup()
  USAnombre =summary(cirque$Pays)["États-Unis"]
  totalPays = sum(table(cirque$Pays))
  USAprop = USAnombre / totalPays
  sortie <- (USAprop*100)
  a = paste("Nombre de runs total", totalPays, sep = ": ")
  b = paste("Nombre de runs aux États-Unis", USAnombre, sep = ": ")
  print(a)
  print(b)
  sortie
}

numero2 <- function() {
  cirque = setup()
  p = 0.3158
  n = length(cirque$Pays)
  normale <- qnorm(0.90)
  
  error <- normale*sqrt(p*(1-p)/n)
  left <- p-error
  right <- p+error
  np = n*p
  n1p = n*(1-p)
  sortie <- c(p,n,np, n1p, left, right)
  names(sortie) = c("p", "n", "np", "n1p", "left", "right")
  return (sortie)
  
}

numero3 <- function() {
  cirque = setup()
  sortie <- mean(cirque$AppreciationShow) 
  return (paste("Moyenne", sortie, sep=" : ")) 
  
}
numero4 <- function() {
  cirque = setup()
  moyenne <- mean(cirque$AppreciationShow) 
  n = length(cirque$AppreciationShow)
  
  s = sd(cirque$AppreciationShow, na.rm = FALSE)
  precision <- 0.95
  student <- qt(precision, df = n-1)
  error <- student * s /sqrt(n)
  left = moyenne - error
  right = moyenne + error
  p = moyenne
  np = n*p
  n1p = n*(1-p)
  sortie <- c(moyenne,n,s,np, n1p, left, right)
  names(sortie) = c("moyenne", "n","s", "np", "n1p", "left", "right")
  
  return (sortie) 
  
}
numero5 <- function() {
  cirque = setup()
 
  NAnombre =summary(cirque$Continent)["Amérique du Nord"]
  n = sum(table(cirque$Continent))
  NAprop = NAnombre / n
  a = paste("Nombre de runs total", n, sep = ": ")
  b = paste("Nombre de runs en Amérique du Nord", NAnombre, sep = ": ")
  print(paste("Nombre de runs total", n, sep = ": "))
  print(paste("Nombre de runs en Amérique du Nord", NAnombre, sep = ": "))
  print(paste("Proportion échantillonnale en Amérique du Nord", NAprop, sep = ": "))
  cirque$AmeriqueN <- ifelse(cirque$Continent == "Amérique du Nord" , 1, 0) 
  
  #print(sum(cirque$AmeriqueN))
  t.test(cirque$AmeriqueN , mu=0.05 )
  
}
numero6 <- function() {
  cirque <- setup()
  moyenne <- mean(cirque$NbPerformances)
  print(paste("La moyenne du nombre de représentations par runs est de", moyenne, sep = " "))
  t.test(cirque$NbPerformances, mu=59, conf.level = 0.90 )
  
}


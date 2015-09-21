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
  sortie <- c(p,n,normale, error, left, right)
  names(sortie) = c("p", "n", "normale", "error", "left", "right")
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
  sortie <- c(moyenne,n,s,student, error, left, right)
  names(sortie) = c("moyenne", "n","s", "student", "error", "left", "right")
  
  return (sortie) 
  
}
numero5 <- function() {
  cirque = setup()
  return ("Numéro 5") 
  
}
numero6 <- function() {
  cirque = setup()
  return ("Numéro 6") 
  
}


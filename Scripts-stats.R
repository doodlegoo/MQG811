importSPSS  <- function() {
  library(foreign)
  db = file.choose()
  dataset = read.spss(db, to.data.frame=TRUE)
  return( dataset)
}
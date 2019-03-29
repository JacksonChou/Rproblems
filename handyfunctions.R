

##Rounding Function

round_any <- function(x, accuracy, f){
  if_else(x%%100 >= 50, ceiling(x/ accuracy) * accuracy,
          round(x/accuracy)*accuracy)}
          
          

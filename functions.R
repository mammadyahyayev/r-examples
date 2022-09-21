sum <- function(first_operand, second_operand) {
  return (first_operand + second_operand)
}

sum(5, 7)
sum(33, 46)

divide <- function(first_operand, second_operand) {
  return(first_operand / second_operand)
}

divide(5, 0) # prints INF (means Infinity)


# we can change the order of parameter passing
divide(20, 10) #prints 2
divide(second_operand = 20, first_operand = 10) # prints 0.5




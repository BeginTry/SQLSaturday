horse_power <- 240
body_style <- "Wagon"
miles_per_gallon <- 44.5

class(horse_power)
class(body_style)
class(miles_per_gallon)


horse_power <- 240L
class(horse_power)

#Use is.*() functions to determine class
is.integer(miles_per_gallon)
is.numeric(miles_per_gallon)


#Use as.*() functions for class coercion
miles_per_gallon <- as.integer(44.5)
miles_per_gallon
class(miles_per_gallon)

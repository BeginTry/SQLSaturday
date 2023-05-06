#Use the c() function (combine) to create a vector.
some_letters <- c("a", "b", "c", "d")
some_letters

#Element must be the same class.
some_data <- c("a", "b", 7.5, 25L)
some_data

#Include labels for vector elements
geography <- c("City" = "Orlando", "State" = "Florida", "ZipCode" = "32801")
geography

#Get vector names (labels)
names(geography)

#Set vector names (labels)
names(geography) <- c("City", "ST", "Zip")
names(geography)

#Vector math
jersey_numbers <- c(00L, 3L, 32L, 33L, 44L)
jersey_numbers + 3
jersey_numbers * 5

#Subsetting
jersey_numbers[1]
jersey_numbers[3]
jersey_numbers[c(1,3)]
c(TRUE, TRUE, TRUE, FALSE, TRUE)

jersey_numbers[c(TRUE, TRUE, TRUE, FALSE, TRUE)]
jersey_numbers > 30
jersey_numbers[jersey_numbers > 30]

#Aggregations
sum(jersey_numbers)
min(jersey_numbers)
max(jersey_numbers)
mean(jersey_numbers)

name <- c("Larry Bird","Robert Parish","Dennis Johnson","Cedric Maxwell","Gerald Henderson","Kevin McHale","Danny Ainge","M.L. Carr")
position <- c("PF", "C", "SG", "SF", "PG", "PF", "SG", "SF")
starter <- c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE,FALSE)
jersey <- c(33L, 00L, 3L, 31L, 43L, 32L, 44L, 30L)

#Pass the vectors as arguments to data.frame() 
Celtics <- data.frame(name, position, starter, jersey)
#Names of the columns are taken from the variable names of the vectors.
Celtics

head(Celtics)
tail(Celtics)

#Subsetting
#What is Cedric Maxwell's jersey number?
Celtics[4, 4]
Celtics[4, "jersey"]

#Select a "column" by variable name or index number.
Celtics[, "position"]
Celtics[, 2]
class(Celtics[, 2])

#Select an observation by row number.
Celtics[3,]

#Select variables (columns) 3 and 4 for observations (rows) 5 and 6
Celtics[c(5,6), c(3, 4)]

#Select name and position for observations (rows) 1 and 2
Celtics[c(1,2), c("name", "position")]

Celtics$name

#Create a vector...
points <- c(24.2, 19.0, 13.2, 11.9, 11.6, 18.4, 5.4, 3.1)
#...add it as a new column of variables.
Celtics$Points <- points
Celtics

#Try to add an observation/row.
new_row <- data.frame("Quinn Buckner", "PG", FALSE, 28, 4.1)
#Note: names must match!
Celtics <- rbind(Celtics, new_row)

#Sync the names.
names(new_row) <- names(Celtics)
Celtics <- rbind(Celtics, new_row)
Celtics




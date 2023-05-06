#sequences
1:10 #Vector of integers from 1 to 10

matrix(data = 1:18, nrow = 3)

#cbind() function creates a matrix by combining vectors as columns. 
cbind(1:3, 1:3, 4:6, 10:12)

#rbind() function creates a matrix by combining vectors as rows.
rbind(1:3, 1:3, 4:6, 10:12)

points_scored_by_quarter <- rbind(c(2,2,6,0), 
                                  c(12,7,6,4), 
                                  c(7,3,4,0), 
                                  c(2,2,3,2), 
                                  c(6,9,2,4))
points_scored_by_quarter

#Add column names and row names
colnames(points_scored_by_quarter) <- c("1st", "2nd", "3rd", "4th")
rownames(points_scored_by_quarter) <- c("Perkins", "Garnett", "Pierce", "Rondo", "Allen")
points_scored_by_quarter

#Subsetting
points_scored_by_quarter[4,3] #by row, col index position
points_scored_by_quarter["Garnett", "1st"] #by row, col names

points_scored_by_quarter[1,] #by row
points_scored_by_quarter[, "4th"] #by col




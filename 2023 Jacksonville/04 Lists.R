#Create a list. Elements can be different classes--there is no coercion.
team <- list("Boston", "Celtics", 17)
#Output is notably different from that of a vector.
#Note the double square brackets.
team

#Set the names of a list.
names(team) <- c("City", "Nickname", "Championships")

#Double brackets are replaced with names.
#Note the leading $ character.
team

#subsetting
team[1]
team$Nickname


#List of lists.
division <- list(Name = "Atlantic", Teams = 5L, Conference = "Eastern",
            list(City = "Boston", Nickname = "Celtics", Championships = 17),
            list(City = "New York", Nickname = "Knicks", Championships = 2),
            list(City = "Philadelphia", Nickname = "76ers", Championships = 1),
            list(City = "Brooklyn", Nickname = "Nets", Championships = 0),
            list(City = "Totonto", Nickname = "Raptors", Championships = 0)
)
division
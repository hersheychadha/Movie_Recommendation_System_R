library(readr)
library(stringr)

#For the movies dataset
movies <- read_csv("archive/movies.dat")
names(movies) <- c('bleh')
movies[c('MovieID', 'Title','Genre')] <- str_split_fixed(movies$bleh,'::',3)
movies <- movies[c('MovieID', 'Title','Genre')]


#For the ratings dataset
ratings <- read_csv("archive/ratings.dat")
names(ratings) <- c('bleh')
ratings[c('UserID','MovieID','Rating','Timestamp')] <- str_split_fixed(ratings$bleh,'::',4)
ratings <- ratings[c('UserID','MovieID','Rating','Timestamp')]

#for user demographic
users <- read_csv("archive/users.dat")
names(users) <- c('bleh')
users[c('UserID','Gender','Age','Occupation','Zip-code')] <- str_split_fixed(users$bleh,'::',5)
users <- users[c('UserID','Gender','Age','Occupation','Zip-code')]

movies <- movies[-3734,]
movies$Year<-substr(movies$Title,nchar(as.character(movies$Title))-4,nchar(as.character(movies$Title))-1)
movies$Title<-paste0(substr(movies$Title,1,nchar(as.character(movies$Title))-6))


ans<-find_by_title(movies$Title[[278]])
ans$Runtime[[1]]

bleh = function(col, output){
  ans<-find_by_title(col[2])

  print(ans)
}

new_col<- apply(movies, 1, bleh)


write.csv(users,"users.csv", row.names = FALSE)


#summary(users)

#table(users$Age)

#library(dplyr)
library(omdbapi)
#games<-search_by_title("Pocahontas", year_of_release=1995)

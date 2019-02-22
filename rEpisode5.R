# R episode 5 code

#################
# don't forget to start with a PULL
# git pull origin master
# git push origin master

# re-read your datafile
cats <- read.csv(file="data/feline-data.csv")

# adding a column
# first make a vector (all one type!)
age <- c(2,3,5)
# then 'bind' the vector to a column in your data frame
cbind(cats, age)

# intentional error: too many observations!
age <- c(2, 3, 5, 12)
cbind(cats, age)

#adding a row
# another intentional error. But this one is a only warning
# and the row gets added, except for the coat.
# this error introduces Factors
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)

# What's a factor?
# they're stored as integers -- but they can change!
typeof(cats$coat)
str(cats$coat)

# you can see all your levels(options) for a vector
levels(cats$coat)

# so to add a row, if there's to be a new value in a vector columns,
# first you need to add that value as a possibility:
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell")
# now you can add your rows
cats <- rbind(cats, list("tortoiseshell", 3.3, TRUE, 9))

# alternately, you can force the vector column to be a list instead
cats$coat <- as.character(cats$coat)
str(cats)

#removing rows
# call the dataframe minus a row
cats[-4, ]

# you can ignore a set of rows by putting row numbers in a vector
cats[c(-4,-5), ]

# and ignore 'NA's
na.omit(cats)

# the previous 2 lines is just calling them.  
# it's not changing the dataframe.
# you need to reassign your values:
cats <- na.omit(cats)

# removing columns
cats[,-4]

#now would be a good time to save your work
# git push origin master


# drop?
drop <- names(cats) %in% c("age")
#drop is a logical vector with 3 nulls
#but that line drops the column

# as long as 'drop' is set, this line also drops the columns
cats[,!drop]

# put 'age' column back in with 4 values
cbind(cats, age)

# appending to a dataframe
# bind 2 dataframes togethers (or one to itself)
cats <- rbind(cats, cats)

# row numbers are actually names.
# you can reset them. set to NULL, and the get re-sequenced
rownames(cats) <- NULL


# #################
# challenge
# #################

#generic sequence
df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)

#specific answer
#wrong
challenge <- data.frame(id = c("firstname", "lastname", "luckynum"),
                 x = 1:3,
                 y = c('Jon', 'Jabłoński', 13),
                 stringsAsFactors = FALSE)

# also wrong 
challenge <- data.frame(firstname = 'Jon',
                        lastname = 'Jabłoński',
                        luckynum = 13,
                        stringsAsFactors = FALSE)
challenge <- rbind(challenge, 'Kim', 'Uher', 5)


# right!
challenge <- data.frame(firstname = 'Jon',
                        lastname = 'Jabłoński',
                        luckynum = 13,
                        stringsAsFactors = FALSE)
kim <- list('Kim', 'Uher', 5)
pam <- list('Pam', 'Kunz', 7839)

challenge <- rbind(challenge, kim)
challenge <- rbind(challenge, pam)
coffee <- (TRUE)
cbind(challenge, coffee)


# #################
# realistic example
# #################

# get the gapminder
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read.csv("data/gapminder_data.csv")

#examine it
str(gapminder)
summary(gapminder$country)
typeof(gapminder$year)
# remember factors?
typeof(gapminder$country)
str(gapminder$country)
# how big?
length(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
# variable names
colnames(gapminder)

# challenge: dim(cats)?

# look at the beginning
head(gapminder)
tail(gapminder)



cats

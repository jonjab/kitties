# make a toy dataset
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0,3.2), 
                   likes_string = c(1, 0, 1))

#and write it out to our repo

write.csv(x = cats, file = "data/feline-data.csv", row.names = FALSE)

# you can call out data in a column using frame$column_name
cats$weight

# this one looks different because it's a factor
# levels list is sorted
cats$coat

# we can do math on the columns
# Say we discovered that the scale weighs two Kg light:
cats$weight + 2

# that doesn't actually change the column values
cats$weight

# paste let's you format output
paste("My cat is", cats$coat)

# sometimes your math doesn't make sense
cats$weight + cats$coat

# read in a new kitty data file and take a look at
# the weight

cats <- read.csv(file="data/feline-data_v2.csv")
typeof(cats$weight)

# intentional error: you can't do math on this anymore
cats$weight + 2

# put the original file back into cats
cats <- read.csv(file="data/feline-data.csv")

# break.  at this point there's a Vector digression

# make a vector and take a look at it
# default datatype is logical
my_vector <- vector(length = 3)
my_vector

# declase data types when you create a vector
another_vector <- vector(mode='character', length=3)
another_vector

# examine data types with the structure command
str(another_vector)
str(cats$weight)

# I didn't copy out all of the datatypes and their
# description commands



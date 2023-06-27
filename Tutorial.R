library(dplyr)   #loads the dplyr library 
dim(starwars)    # shows the dimension of the starwars data frame  

starwars           # displays the data frame   

# filter works on rows (Choose)   
starwars2= starwars %>% filter(    #filters the data frame by certain conditions 
  skin_color == "light", homeworld == "Tatooine"     #keeps only rows where skin_color is "light" and homeworld is "Tatooine"
)
starwars2= starwars[starwars$skin_color == "light"& starwars$eye_color=="brown", ]  
starwars2= starwars[starwars$skin_color== "light" & starwars$eye_color== "brown", ]  

# Arrange rows with arrange() Reorder     
starwars %>% arrange(mass)      #orders the rows by the mass column

#Use desc() to order a column in descending order:  
starwars %>% arrange(desc(mass))  #orders the rows by the mass column in descending order

#Slice  
#Choose rows using their position with slice()       
starwars %>% slice(1:3 & 4:5)     #keeps only rows 1 through 3 and 4 through 5
starwars %>% slice_head(n = 65)   #keeps only the first 65 rows
starwars %>% slice_tail(n = 23)   #keeps only the last 23 rows 
slice_tail(starwars, n = 5)      #keeps only the last 5 rows

# slice sample   
# Choose any rows    
slice_sample(starwars, n=12)      #randomly chooses 12 rows
Choose certain propration of rows
slice_sample(starwars, prop = .1)  #randomly chooses 10% of the rows

#is.na 
is.na(starwars$height) # If the answer is false he will write false  
!is.na(starwars$height) # If the answer is True he will write True
starwars %>% filter(!is.na(height))   #keeps only rows where height is not missing

# slice_min() and slice_max() select rows with highest or lowest values of a variable.
starwars %>% filter(!is.na(height))%>%   
  slice_max(height, n = 4)    #keeps the 4 rows with the highest height
starwars %>% filter(!is.na(height)) %>%  
  slice_min(height, n = 5)   #keeps the 5 rows with the lowest height

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
starwars %>% select(height, mass)    #keeps only the height and mass columns

starwars %>% select(!(height: gender))  #keeps all columns except height through gender

starwars %>% select(ends_with("color")) #keeps only columns ending in "color" 
starwars %>% select(starts_with("dg"))  #keeps only columns starting with "dg"
starwars %>% select(home_world = homeworld)   #renames the homeworld column to home_world
starwars %>% rename(home_world = homeworld)   #renames the homeworld column to home_world
colnames(starwars)   #shows the column names 
names(starwars)      #shows the column names
starwars %>% mutate(heighper100= height/100) # isnot obvious   #creates a new column heighper100 by dividing height by 100
starwars %>% mutate(heighper100 = height/100)%>%  
  select(heighper100, everything())   #keeps the new heighper100 column and all other columns 
# If you only want to keep the new variables, use .keep = "none":
starwars %>% mutate(heighper100 = height/100, .keep = "none")   #keeps only the new heighper100 column 

#na.rm remove missing values or not
starwars %>% summarise(height = mean(height, na.rm = TRUE))  #calculates the mean of height removing missing values
install.packages("tidyverse") 
library(tidyverse) 
install.packages("dplyr") 
install.packages("ggplot") 
library(dplyr) 
library(ggplot2)


download.file("https://ndownloader.figshare.com/files/2292169","Data/portal_data_joined.csv")

#Upload data into R 
Surveys <- read.csv("Data/portal_data_joined.csv")

#see if data uploaded

View(Surveys)

Surveys

#Inspect the data head(Surveys)

str(Surveys) sum(Surveys)

Surveys[1,1] Surveys[1,6] head_surveys <- Surveys[1:6, ] Surveys[1:10,] Surveys[10:1]

Surveys["species_id"] Surveys[,"species_id"] Surveys[["species_id"]] Surveys$species_id

#Challenges ## 1. Surveys_200 <- Surveys[200, ] ## 2. # Saving n_rows to improve readability and reduce duplication n_rows <- nrow(Surveys) Surveys_last <- Surveys[n_rows, ] ## 3. Surveys_middle <- Surveys[n_rows / 2, ]

4.
Surveys_head <- Surveys[-(7:n_rows), ]

#Factors sex <- factor(c("male","female","female","male")) sex str(sex)

#Levels levels(sex) nlevels(sex)

#reordering sex <- factor(sex,levels=c("male","Female")) sex

str(sex)

#Converting Factors as.character(sex) str(sex) as.numeric(sex)

#converting factors where the level is numeric to a numeric vector is trickier year_fct <- factor(c(1990,1983,1977,1998,1990)) as.numeric(year_fct) as.numeric(as.character(year_fct)) #recommended way as.numeric(levels(year_fct))[year_fct]

#renaming factors plot(Surveys$sex)

#renaming missing information sex <- Surveys$sex head(sex) levels(sex) levels(sex)[1] <- "undeterminded" levels(sex) head(sex)

#challenge- rename F to felmae and M to male and put und. last and plot levels(sex)[2] <- "female" head(sex) levels(sex) [3] <- "male" sex <- factor(sex,levels = c("female","male","undeterminded")) sex plot(sex)

#stringsAsFactors=False #By default, columns that contain characters are coerced into factors #to keep columns as characters #read.csv() and read.table() have an argument stringsAsFactors=FALSE #then convert columns that requires data type as factors

Surveys <- read.csv("Data/portal_data_joined.csv",stringsAsFactors = TRUE) str(Surveys) Surveys <- read.csv("Data/portal_data_joined.csv",stringsAsFactors = FALSE) str(Surveys)

#convert the column(plot-type) into a factor Surveys$plot_type <- factor(Surveys$plot_type) str(Surveys)

#inspect data frames to detect issues that may need to be cleaned, #like a letter in a number column

#Challenge country_climate <- data.frame( country=c("canada", "Panama", "South Africa", "Australia"), climate=c("Cold","hot","temperature","hot/temperature"), temperature=c(10,30,18,"15"), northern_hemispere=c(TRUE,TRUE,FALSE,"FALSE"), has_kangaroo=c(FALSE,FALSE,FALSE,1) )

country_climate str(country_climate)

#Formatting Dates str(Surveys) library(lubridate) my_date <- ymd("2015-01-01") str(my_date) my_date <- ymd(paste("2015","1","1",sep="-")) str(my_date)

#Create a character vector from the year,month,day columns of surveys using paste() paste(Surveys$year,Surveys$month,Surveys$day,sep="-") ymd(paste(Surveys$year,Surveys$month,Surveys$day,sep="-")) Surveys$date <- ymd(paste(Surveys$year,Surveys$month,Surveys$day,sep="-")) str(Surveys) summary(Surveys$date)

#investigate where missing values are coming from #id rows in data frame that are failing #extract columns"year,month,day from the records that have NA in new column date

is_missing_date <- is.na(Surveys$date) str(missing_dates) date_columns <- c("year","month","day") date_columns missing_dates <- Surveys[is_missing_date,date_columns] head(missing_dates)
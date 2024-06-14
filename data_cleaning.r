library(tidyverse)


snow <- read_csv("C:/Users/brand/Documents/GitHub/mpls-snow-emergency-data/raw-data/snow_data.csv")
emergencies <- read_csv("C:/Users/brand/Documents/GitHub/mpls-snow-emergency-data/cleaned_data/snow_emerg_exclud_missing_years.csv")
# MSP is missing snowfall data from the start of winter 2000 to the end of winter 2004
msp <- filter(snow, StationName == "MINNEAPOLIS ST. PAUL INTERNATIONAL AIRPORT, MN US")
umn <- filter(snow, StationName == "UNIVERSITY OF MN ST. PAUL, MN US")
lsaf <- filter(snow, StationName == "LOWER ST. ANTHONY FALLS, MN US")

# filter out the missing snowfall data for MSP
msp <- filter(msp, (Date < "2000-06-01") | (Date > "2004-06-01"))


ggplot(data = msp) +
  geom_point(mapping = aes(x = Date, y = SNOW))

ggplot(data = umn) +
  geom_point(mapping = aes(x = Date, y = SNOW))

ggplot(data = lsaf) +
  geom_point(mapping = aes(x = Date, y = SNOW))


temp <- filter(msp, (Date > "1999-01-01"), (Date < "2006-01-01"))
ggplot(data = temp) +
  geom_point(mapping = aes(x = Date, y = SNOW))


y_labels <- left_join(msp, emergencies)

# Weather Type removed
examples <- select(y_labels, c(PRCP, SNOW, SNWD, TMAX, TMIN, emerg_this_season, emergency))

head(no_weather_type)
matrix(head(no_weather_type))

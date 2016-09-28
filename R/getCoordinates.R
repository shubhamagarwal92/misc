# This R script can find geo-coordinates of cities and also calculate 
# the distance between the cities. 
# geoCode and earth.dist function over the internet

require(dplyr)
library(RCurl)
library(RJSONIO)

url <- function(address, return.call = "json", sensor = "false") {
  root <- "http://maps.google.com/maps/api/geocode/"
  u <- paste(root, return.call, "?address=", address, "&sensor=", sensor, sep = "")
  return(URLencode(u))
}
geoCode <- function(address,verbose=FALSE) {
  if(verbose) cat(address,"\n")
  u <- url(address)
  doc <- getURL(u)
  x <- fromJSON(doc,simplify = FALSE)
  if(x$status=="OK") {
    lat <- x$results[[1]]$geometry$location$lat
    lng <- x$results[[1]]$geometry$location$lng
    location_type  <- x$results[[1]]$geometry$location_type
    formatted_address  <- x$results[[1]]$formatted_address
    return(c(lat, lng,address))
    Sys.sleep(0.5)
  } else {
    return(c(NA,NA,address))
  }
}

# rampur = geoCode("rampur")
# bareilly = geoCode("bareilly")
cities = data.frame("name"=c("bareilly","delhi"))
# can also use geocode function in ggmap. much easier 
locations  <- data.frame(t(apply(cities,1, function(x) geoCode(x["name"]))))
names(locations) <- c("lat","lon","name")
locations$lat = as.numeric(as.character(locations$lat))
locations$lon = as.numeric(as.character(locations$lon))
earth.dist <- function (long1, lat1, long2, lat2){
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}

getGeoDistance = function(city1,city2,locations){
  lat1 = locations$lat[locations$name==city1]
  long1 = locations$lon[locations$name==city1]
  lat2 = locations$lat[locations$name==city2]
  long2 = locations$lon[locations$name==city2]
  dist = earth.dist(long1, lat1, long2, lat2)
  return(dist)
}

print(getGeoDistance("bareilly","delhi",locations))



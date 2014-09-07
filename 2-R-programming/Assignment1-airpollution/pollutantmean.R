pollutantmean <- function(directory, pollutant, id = 1:332) {
        tafla <- data.frame()
        for (i in id){
                tafla <- rbind(read.csv(paste(directory,"/",sprintf("%03d",i),".csv", sep="")), tafla)   
        }       
        print (round(mean(tafla[[pollutant]], na.rm=TRUE), digits = 3))          
}
complete <- function(directory, id = 1:332) {
        tafla <- data.frame()
        for (i in id){
                file <- read.csv(paste(directory,"/",sprintf("%03d",i),".csv", sep=""))
                nobs = sum(complete.cases(file))
                tafla <- rbind(tafla, c(i, nobs))
        }
        colnames(tafla) <- c("id", "nobs")
        print(tafla)
}
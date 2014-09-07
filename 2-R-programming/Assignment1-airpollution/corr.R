corr <- function(directory, threshold = 0) {
        filelist = list.files(directory,pattern="*.csv")
        utkoma <- vector('numeric')
        
        for (i in 1:length(filelist)){
                file <- read.csv(paste(directory,"/",filelist[i], sep=""))
                nobs = sum(complete.cases(file))
                
                if(nobs > threshold) {
                        file <- file[complete.cases(file),]
                        utkoma <- rbind(utkoma, cor(file$nitrate, file$sulfate))
                }
        }
        return(utkoma)
}
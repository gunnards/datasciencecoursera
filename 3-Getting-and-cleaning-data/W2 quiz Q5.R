if (!file.exists("data")) {
        dir.create("data")
}

# Question 4
# Download dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "./data/wksst8110.for", method = "curl")

fwreading <- read.fwf("./data/wksst8110.for", skip = 4, 
                      widths = c(12,7,4,9,4,9,4,9,4))

sum(fwreading[4])

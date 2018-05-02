library(XLConnect)
library(xlsx)
library(dplyr)
library(RMySQL)
library(readxl)
library(ggplot2)
library(data.table)
  Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
Sys.setlocale("LC_COLLATE", "English")
options(encoding="UTF-8")
sale.ex <- read.csv2("sales_data_sample.csv", quote = c("\"",","),
                    
                    row.names = NULL, 
                    header = TRUE,
                    stringsAsFactors = FALSE)

sale.ex <- fread(input = "sales_data_sample.csv")

sale.ex$TERRITORY[is.na(sale.ex$TERRITORY)] <- "" #Replace NA values with ""

country.ex <- sale.ex %>% distinct(COUNTRY)
cityset <- sale.ex %>% group_by(YEAR_ID,CITY,COUNTRY) %>% summarise(sum_sale = sum(SALES))

cityset$YEAR_ID <- factor(cityset$YEAR_ID)

i <- 1
cntcity <- nrow(country.ex)

for(i in i:cntcity)
{
coun <- country.ex[i,]

plottest <- cityset %>% filter(COUNTRY %in% coun) %>% ggplot(.,aes(y=sum_sale,x=YEAR_ID,group = CITY,color = CITY))+geom_line()+geom_point()+labs(x = "Year", y = "Sales Amount (Baht)", title = coun)

filenm <- paste("Sales Report City - ",coun,".png", sep = "")
# plottest
ggsave(plottest,filename = filenm)

}
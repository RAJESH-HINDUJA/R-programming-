# Installing "rvest package" and importing/loading
install.packages("rvest")
library(rvest)

# Reading the page
iphone<-read_html("https://www.amazon.in/s?k=iphone&s=price-desc-rank&qid=1694600637&ref=sr_st_price-desc-rank&ds=v1%3Ab9QwG2N39gopjOZ4l8wL95OajBp%2Fyo237%2BTeLOv3k")
print(iphone) 

# Getting the details
iphone %>% html_nodes(".a-size-medium") %>% html_text()

titles<- iphone %>% html_nodes(".a-size-medium.a-color-base.a-text-normal") %>% html_text()

ratings<- iphone %>% html_nodes(".a-row.a-size-small") %>% html_text()

current_price<- iphone %>% html_nodes(".a-price-whole") %>% html_text()

price<- iphone %>% html_nodes(".a-offscreen") %>% html_text()

bank_discount<- iphone %>% html_nodes(".a-truncate") %>% html_text()

# Binding
phones<- cbind(titles,ratings,price,current_price,bank_discount)
View(phones)


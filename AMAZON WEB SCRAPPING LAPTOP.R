# Installing "rvest package" and importing/loading
install.packages("rvest")
library(rvest)

# Reading the page
amazon<-read_html("https://www.amazon.in/s?k=laptops&i=electronics&s=price-desc-rank&crid=NJAVIKNLVN5F&qid=1694601460&sprefix=%2Celectronics%2C168&ref=sr_st_price-desc-rank&ds=v1%3A4mCkno2D1ofOjhmzZwX7OmWS1F2c%2BE9orY3Pw%2FhXbfs")
print(amazon) 

# Getting the details
amazon %>% html_nodes(".a-size-medium") %>% html_text()

titles<- amazon %>% html_nodes(".a-size-medium") %>% html_text()

ratings<- amazon %>% html_nodes(".a-row.a-size-small") %>% html_text()

cost<- amazon %>% html_nodes(".a-price-whole") %>% html_text()

# Binding
product <- cbind(titles, ratings, cost)
View(product)

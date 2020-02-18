#Scarping data from webpage using the rvest library
library('rvest')


#Using the Indeed website 
url <- 'https://www.indeed.com/jobs?q=Big+data&l=San+Diego%2C+CA'

#Reading the HTML code from Indeed website
webpage <- read_html(url)
#get the job title
job_title <- webpage %>% 
  html_nodes(xpath = '//*[@data-tn-element = "jobTitle"]') %>%
  html_attr("title")
stringi::stri_trim_both() -> job_title 
print(job_title)

company_name <- webpage %>% 
  html_nodes(xpath = '//*[@class="company"]')  %>% 
  html_text() %>%
  stringi::stri_trim_both() -> company_name.name 
print(company_name)

summary <- webpage %>% 
  html_nodes(xpath = '//*[@class="summary"]')  %>% 
  html_text() %>%
  stringi::stri_trim_both() -> summary 
print(summary)

#Using the Indeed website 
url <- 'https://www.indeed.com/jobs?q=Big+data&l=San+Jose'

#Reading the HTML code from Indeed website
sj_job_title <- webpage %>% 
  html_nodes(xpath = '//*[@data-tn-element = "jobTitle"]') %>%
  html_attr("title")
stringi::stri_trim_both() -> sj_job_title 
print(sj_job_title)

url <- 'https://www.indeed.com/jobs?q=Big+data&l=San+francisco'

#Reading the HTML code from Indeed website
webpage <- read_html(url)
sf_job_title <- webpage %>% 
  html_nodes(xpath = '//*[@data-tn-element = "jobTitle"]') %>%
  html_attr("title")
stringi::stri_trim_both() -> sf_job_title 
print(sf_job_title)

setwd("/Users/snehalilawe/Desktop/Fall 2019/Big Data Analytics Pl-BDA594/Hmework/HW#2/JobsTitle")

write.table(job_title, file = "SandiegoJobs.txt")
write.table(sj_job_title, file = "SanJoseJobs.txt")
write.table(sf_job_title, file = "SanFranJobs.txt")
#these are the libraries used in the Word Cloud Tasks library(twitteR)
setwd("/Users/snehalilawe/Desktop/Fall 2019/Big Data Analytics Pl-BDA594/Hmework/HW#2")

library(tm)
library(wordcloud)
library(RColorBrewer)
library(NLP)
my_corpus = Corpus(DirSource("JobsTitle"))

tdm = TermDocumentMatrix(my_corpus,
                         control = list(removePunctuation = TRUE,
                                        removeNumbers = TRUE, tolower = TRUE))
# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE)
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)
# plot  jobs in R
wordcloud(dm$word, dm$freq, random.order=FALSE, random.color=FALSE, rot.per= 0.3, colors=brewer.pal(8, "Dark2"))
# save the image in png format – a PNG image Ming_Cloud.png will be created in the Working Directory
png("Jobs_title.png", width=12, height=8, units="in", res=1200) 
wordcloud(dm$word, dm$freq, random.order=FALSE, random.color=FALSE, rot.per= 0.3, colors=brewer.pal(8, "Dark2"))
# dev.off will save the output PNG file into the working folder 
dev.off()











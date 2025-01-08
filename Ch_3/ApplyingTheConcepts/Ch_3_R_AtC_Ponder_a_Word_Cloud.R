#### Ponder a Word Cloud ####
library(wordcloud)
library(RColorBrewer)
library(tidyverse)
spam_texts <- read_csv("spam_text_messages.csv")


wordcloud(words = spam_texts$word, freq = spam_texts$freq,
          colors = brewer.pal(6, "Dark2"))
from bs4 import BeautifulSoup as soup           ############### Used to get to scrape information from web pages. It sits atop an HTML or XML
from urllib.request import urlopen          ########## Used for opening a URL 

news_url="https://news.google.com/news/rss"
Client=urlopen(news_url)
xml_page=Client.read()
Client.close()

soup_page=soup(xml_page,"xml")
news_list=soup_page.findAll("item")
# print(news_list)
# Print news title, url and publish date
for news in news_list:
    print(news , "\n")
#   print(news.title.text)
#   print(news.link.text)
#   print(news.pubDate.text)
#   print("-"*60)
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
import time

# FireFox binary path (Must be absolute path)
# FIREFOX_BINARY = FirefoxBinary('/opt/firefox/firefox')

# FireFox Options
FIREFOX_OPTS = Options()
FIREFOX_OPTS.log.level = "trace"    # Debug
FIREFOX_OPTS.headless = True


class Scraper:
   def __init__(self):
       # self.DRIVER = webdriver.Firefox(firefox_binary=FIREFOX_BINARY)
       self.DRIVER = webdriver.Firefox(options=FIREFOX_OPTS)
 
   def scrape(self, link):
       try:
           self.DRIVER.get(link)
           time.sleep(5) # just in case
           html = self.DRIVER.page_source
 
           return html
 
       except Exception as e:
           print(e)
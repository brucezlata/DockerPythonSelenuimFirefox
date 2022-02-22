from scraper import Scraper

link = "www.bing.com"
pretty_html = Scraper().scrape(link)

print(pretty_html)
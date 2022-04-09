#!/usr/bin/env python3
from selenium import webdriver

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.firefox.options import Options
from selenium.common.exceptions import WebDriverException

def main():
    opts = Options()
    opts.headless = True
    bot = webdriver.Firefox(options=opts)
    bot.get('http://localhost:4040/inspect/http')
    url_xpath = '/html/body/div[2]/div/div/div/div/ul/li[1]/a'
    WebDriverWait(bot, 10).until(EC.element_to_be_clickable((By.XPATH, url_xpath)))
    url = bot.find_element_by_xpath(url_xpath).text
    print(url.partition('://')[2])
    bot.close()


if __name__ == '__main__':
    main()

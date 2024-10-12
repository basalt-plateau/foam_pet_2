

#/
#
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
#
#
import pathlib
from os.path import dirname, join, normpath
import sys
#
#\

driver = webdriver.Chrome ()
print ('driver')

driver.get("https://www.selenium.dev/selenium/web/web-form.html")
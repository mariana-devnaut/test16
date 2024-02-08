import os

from selenium import webdriver
from selenium.webdriver import FirefoxProfile
from selenium.webdriver.edge.options import Options
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service as FirefoxService
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.core.utils import ChromeType

class Browser:
    driver = None

    def __init__(self, context):
        global driver
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument("window-size=1920x1080")
        chrome_options.add_argument("--no-sandbox")
        #chrome_options.add_argument("--disable-dev-shm-usage")
        #chrome_options.add_argument("--headless")
        driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager(version='114.0.5735.90').install()), chrome_options=chrome_options)
    
        os.environ['Test Browser'] = 'Chrome'
        Browser.driver = driver
        driver.maximize_window()

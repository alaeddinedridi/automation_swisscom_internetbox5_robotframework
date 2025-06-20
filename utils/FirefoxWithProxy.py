from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.firefox.firefox_profile import FirefoxProfile
from robot.libraries.BuiltIn import BuiltIn
from SeleniumLibrary import SeleniumLibrary

class FirefoxWithProxy:
    def open_firefox_with_socks_proxy(self, url="http://example.com"):
        profile = FirefoxProfile()
        profile.set_preference("network.proxy.type", 1)
        profile.set_preference("network.proxy.socks", "localhost")
        profile.set_preference("network.proxy.socks_port", 8081)
        profile.set_preference("network.proxy.socks_version", 5)
        profile.set_preference("network.proxy.socks_remote_dns", True)

        options = FirefoxOptions()
        options.profile = profile
        options.binary_location = "/usr/bin/firefox"
        #options.add_argument('--headless')
        driver = webdriver.Firefox(options=options)

        # Register the driver with SeleniumLibrary
        seleniumlib = BuiltIn().get_library_instance("SeleniumLibrary")
        seleniumlib.register_driver(driver, alias=None)

        driver.get(url)
        return driver
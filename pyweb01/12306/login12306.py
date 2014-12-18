#coding:utf-8

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import time

def login(browser,user_info):

    username = browser.find_element_by_id("username")
    username.send_keys(user_info["username"])
    passwd = browser.find_element_by_id("password")
    passwd.send_keys(user_info["password"])
    rand_code = "var q=document.getElementById('randCode').focus()"
    browser.execute_script(rand_code)
    WebDriverWait(browser, 300).until(
            lambda the_driver: the_driver.find_element_by_id("i-okmypasscode1").is_displayed())
    loginSub = browser.find_element_by_id("loginSub")
    loginSub.click()


if __name__ == '__main__':

    user_info = {
            "username":"1234567",
            "password":"password"}

    url = "https://kyfw.12306.cn/otn/login/init"
    browser = webdriver.Firefox()
    browser.maximize_window()
    browser.implicitly_wait(30)
    browser.get(url)
    login(browser,user_info)


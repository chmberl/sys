#coding:utf-8

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
from selenium.webdriver.support.expected_conditions import element_to_be_clickable
from selenium.webdriver.support.expected_conditions import presence_of_all_elements_located
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import time

def select_passengers(browser,passengers):

    orders = browser.find_elements_by_css_selector("#normal_passenger_id>li")
    for order in orders:
        check = order.find_element_by_tag_name("input")
        if order.text in passengers and check.get_attribute('type') == 'checkbox' and not check.is_selected():
            check.click()
        elif check.get_attribute('type') == 'checkbox' and check.is_selected():
            check.click()


def select_seat(browser,passengers_info,passengers):

    ticketInfo_tr = browser.find_elements_by_css_selector("#ticketInfo_id>tr")
    ticketInfo_tr_p = zip(ticketInfo_tr,passengers)
    for tr_p in ticketInfo_tr_p:
        #passenger_name = tr.find_element_by_xpath("//td[4]/div/input").text
        seat_type = tr_p[0].find_element_by_xpath("//td[2]/select")
        seats = passengers_info[tr_p[1]]
        for seat in seats:
            try:
                Select(seat_type).select_by_value(seat)
                break
            except NoSuchElementException,e:
                print e
                pass

def randcode_focus_and_wait(browser):

    rand_code = "var q=document.getElementById('randCode').focus()"
    browser.execute_script(rand_code)
    WebDriverWait(browser, 300).until(
                lambda the_driver: the_driver.find_element_by_id("i-okmypasscode1").is_displayed())


def put_ticket_info_and_randcode(browser,passengers_info):

    passengers = sorted(passengers_info.keys())
    select_passengers(browser,passengers)
    select_seat(browser,passengers_info,passengers)
    randcode_focus_and_wait(browser)

if __name__ == '__main__':
    url="file:///Users/exit0/Downloads/abchtml"
    #url = 'file:///Users/exit0/Downloads/%E9%A2%84%E5%AE%9A.html'

    # O  —大写O  代表二等座
    # M  代表一等座
    # 9  代表商务座
    # 3  代表硬卧
    # 1  代表硬座
    # P  特等座
    # 4  软卧
    passengers_info = {
            u"张三":["M"],
            u"李四(学生)":["9","M"]
                }
    browser = webdriver.Firefox()
    browser.maximize_window()
    browser.implicitly_wait(30)
    browser.get(url)

    put_ticket_info_and_randcode(browser,passengers_info)

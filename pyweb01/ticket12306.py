#coding:utf-8

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import time

def fill_station_info(browser,city,stationType="fromStationText"):
    ''' 填写车站信息'''

    input_form = browser.find_element_by_id(stationType)
    webdriver.ActionChains(browser).move_to_element(input_form).perform()
    input_form.clear()
    input_form.send_keys(city)
    WebDriverWait(browser, 10).until(
            lambda the_driver: the_driver.find_element_by_id("panel_cities").is_displayed())
    cityline= browser.find_element_by_id("panel_cities").find_elements_by_tag_name("div")
    for city_handle in cityline:
        city_name = city_handle.text.strip()
        if not cmp(city_name,city):
            city_handle.click()
            break

def fill_date_info(browser,ticketDate="2015-02-19",trainType="train_date"):
    '''填写购票日期'''

    train_date = browser.find_element_by_id(trainType)
    train_date.send_keys(ticketDate)
    iframe = browser.find_element_by_xpath("/html/body/div[contains(@style,'position: absolute')]/iframe")
    browser.switch_to_frame(iframe)
    dpTitle = browser.find_element_by_id("dpTitle")
    inputs_left = dpTitle.find_elements_by_xpath("//div[contains(@style,'float:left')]/input")
    m_input = inputs_left[0]
    y_input = inputs_left[1]
    ticket_date_list = ticketDate.split("-")
    y_input.send_keys(ticket_date_list[0])
    m_input.send_keys(ticket_date_list[1])
    td_days = browser.find_elements_by_class_name("Wselday")
    td_days += browser.find_elements_by_class_name("Wday")
    td_days += browser.find_elements_by_class_name("Wwday")
    for day in td_days:
        if day.text.zfill(2) == ticket_date_list[2]:
            day.click()
            break
    browser.switch_to_default_content()

def search_ticket(browser,searchButtonId="a_search_ticket"):
    '''点击查询按钮'''

    a_search_ticket = browser.find_element_by_id(searchButtonId)
    a_search_ticket.click()


def fill_info_and_search_ticket(browser,stationInfo,ticketDate,searchButtonId="a_search_ticket"):

    fill_station_info(browser,stationInfo["fromStationText"],stationInfo["stationType"][0])
    fill_station_info(browser,stationInfo["toStationText"],stationInfo["stationType"][1])
    fill_date_info(browser,ticketDate[0])
    search_ticket(browser,searchButtonId)

if __name__ == '__main__':

    stationInfo={
        "stationType":["fromStationText","toStationText"],
        "fromStationText":u"深圳",
        "toStationText":u"杭州"}
    ticketDate = ["2015-02-19"]
    searchButtonId="query_ticket"
    url = 'https://kyfw.12306.cn/otn/leftTicket/init'

    browser = webdriver.Firefox()
    browser.maximize_window()
    browser.implicitly_wait(30)
    browser.get(url)

    fill_info_and_search_ticket(browser,stationInfo,ticketDate,searchButtonId)


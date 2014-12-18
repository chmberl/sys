#coding:utf-8

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import time
import searchTicket
import login12306
import orderTicket

if __name__ == '__main__':

    url = 'https://kyfw.12306.cn/otn/login/init'
    # 用户登录信息
    user_info = {
            "username":"t65251997",
            "password":"1027CHENZHANG"
                }

    # 购票车站信息
    stationInfo={
            "stationType":["fromStationText","toStationText"],
            "fromStationText":u"深圳",
            "toStationText":u"长沙"}

    # 乘车人信息,座位类型（可多选）
    # O  —大写O  代表二等座
    # M  代表一等座
    # 9  代表商务座
    # 3  代表硬卧
    # 1  代表硬座
    # P  特等座
    # 4  软卧
    passengers_info =  {
            u"张博良":["O","M"],
            #u"李四(学生)":["9","3","1"]
                }
    # 乘车日期 目前只支持2015年2月份,如日期大于预售期,则为预售期最后一天
    ticketDate = ["2015-02-19"]

    browser = webdriver.Firefox()
    browser.maximize_window()
    browser.implicitly_wait(60)
    browser.get(url)

    login12306.login(browser,user_info)
    searchTicket.fill_info_and_search_ticket(browser,stationInfo,ticketDate)

    # 循环次数
    count = 200
    query_id = "query_ticket"

    result = searchTicket.circulate_search_ticket(browser,query_id,count)
    if result:
        order.put_ticket_info_and_randcode(browser,passengers_info)
    #browser.find_element_by_id("show_more").click()


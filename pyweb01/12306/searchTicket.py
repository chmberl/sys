#coding:utf-8

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
from selenium.webdriver.support.expected_conditions import element_to_be_clickable
from selenium.webdriver.support.expected_conditions import presence_of_all_elements_located
from selenium.webdriver.common.by import By
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

    a_search_ticket = element_to_be_clickable((By.ID,searchButtonId))(browser)
    a_search_ticket.click()

def fill_info_and_search_ticket(browser,stationInfo,ticketDate,searchButtonId="a_search_ticket"):

    fill_station_info(browser,stationInfo["fromStationText"],stationInfo["stationType"][0])
    fill_station_info(browser,stationInfo["toStationText"],stationInfo["stationType"][1])
    fill_date_info(browser,ticketDate[0])
    search_ticket(browser,searchButtonId)

def circulate_search_ticket(browser,searchButtonId,count):

    trainum_text = browser.find_element_by_id("trainum").text
    while count :
        queryLeftTable = browser.find_element_by_id("queryLeftTable")
        a_list = presence_of_all_elements_located((By.TAG_NAME,"a"))(queryLeftTable)
        if len(a_list) == int(trainum_text):
            search_ticket(browser,searchButtonId)
            time.sleep(2)
            #fill_info_and_search_ticket(browser,stationInfo,ticketDate,searchButtonId)
        else:
            #过滤车票类型或不过滤
            #result = query_all_ticket_type(browser)
            result = traverse_query_table(browser)
            if result:
                return result
        count -= 1
    return False

def query_all_ticket_type(browser):
    order_links = browser.find_elements_by_css_selector("#queryLeftTable>tr>td>a")
    for link in order_links:
        link.click()
        return True
    return False

def traverse_query_table(browser):
    '''遍历查询结果，检查是否有符合指定车票类型的车次'''

    queryTable_tr = browser.find_elements_by_css_selector("#queryLeftTable>tr")
    length = len(queryTable_tr)
    x_list = [i for i in range(length) if i % 2 == 0]
    for j in x_list:
        tr_a_list = queryTable_tr[j].find_elements_by_tag_name("a")
        if len(tr_a_list) < 2 :
            continue
        if not partital_ticket_type(queryTable_tr[j]):
            continue
        br = queryTable_tr[j].find_element_by_xpath("//td[@class='no-br']/a")
        br.click()
        return True
    return False

def partital_ticket_type(queryTable_tr):
    '''查询时过滤车票类型

        2    SWZ_   商务座
        3    TZ_    特等座
        4    ZY_    一等座
        5    ZE_    二等座
        6    GR_    高级软卧
        7    RW_    软卧
        8    YW_    硬卧
        9    RZ_    软座
        10   YZ_    硬座
        11   WZ_    无座
        12   QT_    其他
        例：
        需检查是否含有硬座票
        yz ＝queryTable_tr.find_element_by_xpath("//td[10]").text
        yz_ticket = yz in no_ticket
        if not yz_ticket:
            return False
    '''

    ze = queryTable_tr.find_element_by_xpath("//td[5]").text
    yw = queryTable_tr.find_element_by_xpath("//td[8]").text
    yz = queryTable_tr.find_element_by_xpath("//td[10]").text
    no_ticket = ("--",u"无")
    #if ze in no_ticket and yw in no_ticket and yz in no_ticket:

    ze_ticket = ze in no_ticket
    yw_ticket = yw in no_ticket
    yz_ticket = yz in no_ticket
    if not (ze_ticket and yw_ticket and yz_ticket):
        return False
    return True


if __name__ == '__main__':

    stationInfo={
        "stationType":["fromStationText","toStationText"],
        "fromStationText":u"广州",
        "toStationText":u"武汉"}
    ticketDate = ["2015-02-12"]
    searchButtonId="query_ticket"
    url = 'https://kyfw.12306.cn/otn/leftTicket/init'

    browser = webdriver.Firefox()
    browser.maximize_window()
    browser.implicitly_wait(30)
    browser.get(url)

    fill_info_and_search_ticket(browser,stationInfo,ticketDate,searchButtonId)
    circulate_search_ticket(browser,searchButtonId,5)


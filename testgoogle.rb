require 'selenium-webdriver'
require 'watir'

caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps ['acceptInsecureCerts'] = true

driver = Selenium::WebDriver.for(:firefox, desired_capabilities: caps)
browser = Watir::Browser.new(driver)

browser.goto 'google.com'
browser.text_field(title: 'Search').set 'Cheese!!'
browser.button(name: 'btnK').click

puts browser.title
# => 'Hello World! - Google Search'
browser.quit


#browser.get "http://www.google.com"
#element = browser.find_element :name => "q"
#element.send_keys "Cheese!"
#element.submit

#p "Page title is #{browser.title}"
#wait = Selenium::WebDriver::Wait.new(:timeout => 100)
#wait.until {browser.title.downcase.start_with? "Cheese!" }
#p "Page title is #{browser.title}"
#browser.quit

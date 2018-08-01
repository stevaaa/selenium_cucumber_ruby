require 'rubygems'
require 'selenium-webdriver'

Before do
    @driver = Selenium::WebDriver.for :chrome
		@driver.manage.timeouts.implicit_wait = 30
		@driver.manage.timeouts.script_timeout = 30
		@driver.manage.timeouts.page_load = 30
		@searchresult=SearchResult.new(@driver)
		@home=Home.new(@driver)
		@login=Login.new(@driver)
		@page=Page.new(@driver)
		@itemdetails=ItemDetails.new(@driver)
end

After do
    @driver.quit
end

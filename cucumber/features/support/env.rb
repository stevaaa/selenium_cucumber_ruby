Before do
    @driver = Selenium::WebDriver.for :chrome
		@driver.manage.timeouts.implicit_wait = 30
		@driver.manage.timeouts.script_timeout = 30
		@driver.manage.timeouts.page_load = 30
end

After do
    @driver.quit
end

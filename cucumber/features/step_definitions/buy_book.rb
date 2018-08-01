require 'selenium-webdriver'
require "watir"

Given /I open "(.*?)"/ do |site|
	@home.openSite (site)
end

When /I search for "(.*?)"/ do |keyword|
	@page.searchByKeyword(keyword)
end

And /I open the first book/ do
	element = @driver.find_element :xpath => '//*[@id="result_0"]/div/div/div/div[2]/div[2]/div[1]/a/h2'
	element.click
end

And /I select the paperback edition/ do
	element = @driver.find_element :xpath => '//*[@id="a-autoid-0-announce"]'
	element.click
end

And /I add the first book to shopping cart/ do
	@itemdetails.getCurrentItemTitle
	@itemdetails.addToShoppingCart
end

And /I will go to the cart/ do
	@page.goToMyCart
end

Then /I should see the book in my shopping cart/ do
	bookName = @driver.find_element :xpath => '//*[@id="activeCartViewForm"]/div[2]/div/div[4]/div/div[1]/div/div/div[2]/ul/li[1]/span/a/span'
	 $bookTitle.include?(bookName.text)
	 @driver.save_screenshot ("screenshot.png")
end

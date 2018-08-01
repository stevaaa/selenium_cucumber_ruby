require 'selenium-webdriver'
require "watir"

Given /I open "(.*?)"/ do |site|
	openSite(site)
end

When /I search for "(.*?)"/ do |keyword|
	searchByKeyword(keyword)
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
	getCurrentItemTitle
	addToShoppingCart
end

And /I will go to the cart/ do
	element = @driver.find_element :id => "hlb-view-cart"
	element.click
end

Then /I should see the book in my shopping cart/ do
	bookName = @driver.find_element :xpath => '//*[@id="activeCartViewForm"]/div[2]/div/div[4]/div/div[1]/div/div/div[2]/ul/li[1]/span/a/span'
	 @bookTitle.include?(bookName.text)
end


def openSite(site)
		@driver.get site
	end

def searchByKeyword(keyword)
	searchKeyword = @driver.find_element :id => "twotabsearchtextbox"
	searchKeyword.clear
	searchKeyword.send_keys keyword
	element = @driver.find_element :class =>"nav-search-submit"
	element.click
end

def getCurrentItemTitle
	@bookTitle = @driver.find_element(:id => "productTitle").text
end

def addToShoppingCart
	element = @driver.find_element :name => "submit.add-to-cart"
	element.click
end

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
	goToMyCart
end

Then /I should see the book in my shopping cart/ do
	bookName = @driver.find_element :xpath => '//*[@id="activeCartViewForm"]/div[2]/div/div[4]/div/div[1]/div/div/div[2]/ul/li[1]/span/a/span'
	 @bookTitle.include?(bookName.text)
	 @driver.save_screenshot ("screenshot.png")
end


def openSite(site)
		@driver.get site
	end

def searchByKeyword(keyword)
	searchKeyword = findElementBy("id", "twotabsearchtextbox")
	searchKeyword.clear
	searchKeyword.send_keys keyword
	clickElementBy("class", "nav-search-submit")
end

def getCurrentItemTitle
	@bookTitle = findElementBy("id", "productTitle").text
end

def addToShoppingCart
	clickElementBy("name", "submit.add-to-cart")
end

def goToMyCart
	clickElementBy("id", "hlb-view-cart")
end

def findElementBy (type, value)
    if type=="class"
        element=@driver.find_element :class => value
    elsif type=="css"
        element=@driver.find_element :css => value
    elsif type=="id"
        element=@driver.find_element :id => value
    elsif type=="link"
        element=@driver.find_element :link => value
    elsif type=="name"
        element=@driver.find_element :name => value
    elsif type=="partial_link"
        element=@driver.find_element :partial_link_text => value
    elsif type=="tag"
        element=@driver.find_element :tag_name => value
    elsif type=="xpath"
        element=@driver.find_element :xpath => value
    else
        p "incorrect selector type"
    end
end

def clickElementBy (type, value)
    findElementBy(type, value).click
end

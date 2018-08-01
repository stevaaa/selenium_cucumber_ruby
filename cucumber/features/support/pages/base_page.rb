# encoding: utf-8

class Page

	def initialize(driver)
		@driver = driver
	end

	def searchByKeyword(keyword)
		searchKeyword = findElementBy("id", "twotabsearchtextbox")
		searchKeyword.clear
		searchKeyword.send_keys keyword
		clickElementBy("class", "nav-search-submit")
	end

	def getCurrentItemTitle
		$bookTitle = findElementBy("id", "productTitle").text
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

	def waitForJsOrAjax
		sleep(10)
	end

end

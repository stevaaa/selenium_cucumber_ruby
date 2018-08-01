Feature:
In order to purchase it later
As a consumer
I want to add a book to my shopping cart

@single
Scenario:
	Given I open "http://www.amazon.com"
	When I search for "The Lean Startup"
	And I open the first book
	And I select the paperback edition
	And I add the first book to shopping cart
	And I will go to the cart
	Then I should see the book in my shopping cart

@multiple
Scenario Outline: Consumer can add a book to shopping cart
	Given I open "http://www.amazon.com"
	When I search for "<book>"
	And I open the first book
	And I select the paperback edition
	And I add the first book to shopping cart
	And I will go to the cart
	Then I should see the book in my shopping cart
	Examples:
	|	book							|
	|	The Lean Startup 	|
	|	Steve Jobs				|

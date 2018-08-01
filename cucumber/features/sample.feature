Feature: 
    In order to check the search result
    As a cheese lover
    I want to search on Google and check the browser title

    Scenario: Verify the title to contain the keyword
        Given I opened "http://www.google.com"
        When I search a "Cheese!"
        Then I should see the browser title has "Cheese! - Google"
 
 
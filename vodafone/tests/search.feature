Feature: search

  Scenario Outline:customer can search product in stock and choose it's color
    Given Vodafone eShop website opened
    And   User login using "<msisdn>" and "<password>"
    When  enter search "<Keyword>" in search bar
    And   click on the "<suggestion>" form suggestion list
    And   click on  "<brand>"


    Examples:
      | msisdn     | password |Keyword    |suggestion                |brand|
      | msisdn     | password | samsung   |   Samsung in Smart Phones| Oppo|

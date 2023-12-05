Feature: search
#
#  Scenario Outline:user can log in to Eshop site from vodafone
#    Given Vodafone eShop website opened
#    And   User login using "<msisdn>" and "<password>"
#
#    Examples:
#      | msisdn       | password |
#      | 01011765365  | Heb@2013 |

  Scenario Outline:customer can search product in stock and choose it's color
    Given Vodafone eShop website opened
    When  enter search "<Keyword>" in search bar
    And   click on the "<suggestion>" form suggestion list

    Examples:
      |Keyword     |suggestion                |
      | samsung    |   Samsung in Smart Phones|

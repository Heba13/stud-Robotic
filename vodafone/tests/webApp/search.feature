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
    And   click on brand "<brand>"
    And   select the version"<version>"
    And   select color of the product "<color>" and check if the product out of stock "<status>"

    Examples:
      |Keyword     |suggestion                |brand|version                         |color      |status |
      | samsung    |Samsung in Smart Phones   |Oppo |   OPPO Smart Phone A98 (5G)    |BLACK      | false |
      | samsung    |Samsung in Smart Phones   |Oppo |   OPPO Smart Phone A98 (5G)    |Dreamy Blue|  true |
@Cards @regression 
Feature: Cards
  As a user, I want to be able to request and verify physical and virtual cards

  Background: The login loads correctly and goes to card request section
    Given The login loads correctly and goes to card request section

  @positive @temp_test
  Scenario Outline: Request valid virtual card
    When The users wants a new card
    And The user types card name
    And The user types card allowance
    And The user selects the card responsible
    And The user selects "<card>" card 
    And The user click request card button
    And The user see a success notification message
    Then The user verify the newly added card
    Examples:
        | card |
        | virtual |

  @negative 
  Scenario Outline: Request invalid card - Name
    When The users wants a new card
    And The user types card allowance
    And The user selects the card responsible
    And The user selects "<card>" card 
    And The user click request card button
    Then The user should see an error displayed below the input related to card information
    Examples:
        | card |
        | virtual |
  
  @negative
  Scenario Outline: Request invalid card - Allowance
    When The users wants a new card
    And The user types card name
    And The user selects the card responsible
    And The user selects "<card>" card 
    And The user click request card button
    Then The user should see an error displayed below the input related to allowance
    Examples:
        | card |
        | virtual |

  @negative
  Scenario Outline: Request invalid card - Responsible
    When The users wants a new card
    And The user types card allowance
    And The user types card name
    And The user selects "<card>" card 
    And The user click request card button
    Then The user should see an error displayed below the input related to card information
    Examples:
        | card |
        | virtual |

  @positive
  Scenario Outline: Block a valid virtual card
    When The users wants a new card
    And The user types card name
    And The user types card allowance
    And The user selects the card responsible
    And The user selects "<card>" card 
    And The user click request card button
    And The user see a success notification message
    And The user blocks the recently added card - "<reason>"
    Then The users verify the card is blocked
    Examples:
        | card | reason |
        | virtual | Card Lost |
        | virtual | Card Stolen |
        | virtual | Pending Query |
        | virtual | Card Consolidation |
        | virtual | Card Inactive |
        | virtual | PIN Tries Exceeded |
        | virtual | Suspected Fraud |
        | virtual | Card Replacement |
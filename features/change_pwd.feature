@change_pwd @regression
Feature: Change password
  As a user, I want to be able to change my password

@positive 
Scenario: Succesfully change the password of the account
    Given The users log in with specific user
    When The user clicks profile button to go to account configurations
    And The user types the current password
    And The user types the new password
    And The user types the new password to confirm
    And The user click update password button
    And The user logs out
    And The user try to log in with old credentials
    And The user log in with new credentials
    And The user clicks profile button to go to account configurations
    Then The user restores the old password

@negative 
Scenario: Leave empty field when changing password - Current password
    Given The users log in with specific user - negative
    When The user clicks profile button to go to account configurations
    And The user types the new password
    And The user types the new password to confirm
    And The user click update password button
    Then The user validates the required fields

@negative
Scenario: Leave empty field when changing password - New password
    Given The users log in with specific user - negative
    When The user clicks profile button to go to account configurations
    And The user types the current password
    And The user types the new password to confirm
    And The user click update password button
    Then The user validates the required fields

@negative
Scenario: Leave empty field when changing password - Confirm password
      Given The users log in with specific user - negative
    When The user clicks profile button to go to account configurations
    And The user types the current password
    And The user types the new password
    And The user click update password button
    Then The user validates the required fields

@negative
Scenario: Invalid value - Wrong current password
    Given The users log in with specific user - negative
    When The user clicks profile button to go to account configurations
    And The user types wrong current password
    And The user types the new password
    And The user types the new password to confirm
    And The user click update password button
    Then The user validates the required fields

@negative
Scenario: Invalid value - Short new password
    Given The users log in with specific user - negative
    When The user clicks profile button to go to account configurations
    And The user types the current password
    And The user types short new password
    And The user click update password button
    Then The user validates the required fields

@negative
Scenario: Invalid value - Different confirm password
    Given The users log in with specific user - negative
    When The user clicks profile button to go to account configurations
    And The user types the current password
    And The user types the new password
    And The user types different password confirmation
    And The user click update password button
    Then The user validates the required fields
@login @regression
Feature: Login
  As a user, I want to be able to login to use login page of Tuily.

  Background: I open the login page
    Given I Open the login page

  @positive
  Scenario: Login with valid data - email
    When I login with valid email
    Then I should get access to my account

  @negative
  Scenario: Login with invalid data - email
    When I login with invalid email
    Then Tuily validates that the inserted data is invalid and display a notification

  @negative
  Scenario: Validate forgot password link
    When The user click the recover account link
    Then The recover password page loads

  @negative
  Scenario: Validate Register account button
    When The user click the Register button
    Then The Register account page loads
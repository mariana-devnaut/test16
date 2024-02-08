@forgot_pwd @regression
Feature: Forgot password
  As a user, I want to be able to recover my password

  Background: The login loads correctly and goes to recover account section
    Given The login loads correctly and goes to recover account section

  @positive
  Scenario: Succesfully complete the onboarding process
    When The user types the email
    And The user click recover password button
    Then Tuily displays a notification and sign up page is loaded


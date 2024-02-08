@signup @regression
Feature: Sign Up
  As a user, I want to be able to login to use login page of Tuily.

  Background: I open the login page
    Given I open the login page for signup

  @positive
  Scenario: The user tries to create a valid account
    When The login loads correctly
    And The user type the first name
    And The user type the last name
    And The user type the email
    And The user type a password
    And The user accept the terms and conditions
    And The users accepts the personal data handling agreement
    And The users accepts the digital sign agreement
    And The users clicks Create account button
    Then Tuily creates a new account and displays onboarding page

  @negative
  Scenario: The user leaves empty the first name field
  When The login loads correctly
  And The user type the last name
  And The user type the email
  And The user type a password
  And The user accept the terms and conditions
  And The users accepts the personal data handling agreement
  And The users accepts the digital sign agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error

@negative
Scenario: The user leaves empty the last name field
  When The login loads correctly
  And The user type the first name
  And The user type the email
  And The user type a password
  And The user accept the terms and conditions
  And The users accepts the personal data handling agreement
  And The users accepts the digital sign agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error

@negative
Scenario: The user leaves empty the email field
  When The login loads correctly
  And The user type the first name
  And The user type the last name
  And The user type a password
  And The user accept the terms and conditions
  And The users accepts the personal data handling agreement
  And The users accepts the digital sign agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error

@negative
Scenario: The user leaves empty the password field
  When The login loads correctly
  And The user type the first name
  And The user type the last name
  And The user type the email
  And The user accept the terms and conditions
  And The users accepts the personal data handling agreement
  And The users accepts the digital sign agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error

@negative
Scenario: The user doesn't accept the terms and conditions
  When The login loads correctly
  And The user type the first name
  And The user type the last name
  And The user type the email
  And The user type a password
  And The users accepts the personal data handling agreement
  And The users accepts the digital sign agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error

@negative
Scenario: The user doesn't accept the personal data handling agreement
  When The login loads correctly
  And The user type the first name
  And The user type the last name
  And The user type the email
  And The user type a password
  And The user accept the terms and conditions
  And The users accepts the digital sign agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error

@negative
Scenario: The user doesn't accept the digital signature agreement
  When The login loads correctly
  And The user type the first name
  And The user type the last name
  And The user type the email
  And The user type a password
  And The user accept the terms and conditions
  And The users accepts the personal data handling agreement
  And The users clicks Create account button
  Then Tuily displays an error message with a validation error
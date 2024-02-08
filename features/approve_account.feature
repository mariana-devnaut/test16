@approve_account
Feature: Approve account
  As a Admin, I want to be able to complete the Account Approvals process

  Background: The user creates an account and start the onboarding process
    Given The user creates an account and start the onboarding process


  @positive
  Scenario: Succesfully complete the onboarding process
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name to approve
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the phone number
    And The user types the billing email
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a valid RUT file
    And The user uploads a valid comercial file
    And The user uploads a valid composition file
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    And The user finish the onboarding process
    And The user logs out
    And I log in with a valid email as an admin






@onboarding  @regression
Feature: Onboarding
  As a user, I want to be able to complete the onboarding process

  Background: The user creates an account and start the onboarding process
    Given The user creates an account and start the onboarding process

  @positive
  Scenario: Succesfully complete the onboarding process
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
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
    Then The user finish the onboarding process

@negative
Scenario: Leave empty field in onboarding step 1 - Company name
    When The onboarding page loads correctly
    And The user types the admin email
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
    Then Validation is displayed and user stays in onboarding page
    And The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 1 - Comercial name
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
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
    Then Validation is displayed and user stays in onboarding page
    And The user should see an error displayed below the input

@negative
Scenario: Leave empty field in onboarding step 1 - Nit
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types the web page
    And The user types the phone number
    And The user types the billing email
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    Then Validation is displayed and user stays in onboarding page
    And The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 1 - Phone Number
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    Then Validation is displayed and user stays in onboarding page

@negative 
Scenario: Leave empty field in onboarding step 1 - Neighborhood
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the zip code
    And The user continues to the next step
    Then Validation is displayed and user stays in onboarding page
    And The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 1 - Street name
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    Then Validation is displayed and user stays in onboarding page

@negative 
Scenario: Leave empty field in onboarding step 1 - Zip code
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user continues to the next step
    Then Validation is displayed and user stays in onboarding page
    And The user should see an error displayed below the input

@negative
Scenario: Leave empty field in onboarding step 1 - billing email
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    Then Validation is displayed and user stays in onboarding page
    And The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 - RUT
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a valid comercial file
    And The user uploads a valid composition file
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative
Scenario: Leave empty field in onboarding step 3 - comercial file
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a valid RUT file
    And The user uploads a valid composition file
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 - composition file
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a valid RUT file
    And The user uploads a valid comercial file
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 - first month bank statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 - second month bank statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 - third month bank statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 -  2 years old financial statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input


@negative 
Scenario: Leave empty field in onboarding step 3 - 1 years old financial statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative 
Scenario: Leave empty field in onboarding step 3 - current year financial statement 
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input

@negative @onboarding_fer
Scenario: Leave empty field in onboarding step 3 -income statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    Then The user should see an error displayed below the input

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - RUT
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a invalid RUT file - "<type>"
    And The user uploads a valid comercial file
    And The user uploads a valid composition file
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative
Scenario Outline:Invalid file upload in onboarding step 3 - comercial file
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a valid RUT file
    And The user uploads a invalid comercial file - "<type>"
    And The user uploads a valid composition file
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - composition file
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user skip to the third step
    And The user uploads a valid RUT file
    And The user uploads a valid comercial file 
    And The user uploads a invalid composition file - "<type>"
    And The user uploads a valid first month bank statement file
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - first month bank statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid first month bank statement file - "<type>"
    And The user uploads a valid second month bank statement file
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - second month bank statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid second month bank statement file - "<type>"
    And The user uploads a valid third month bank statement file
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - third month bank statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid third month bank statement file - "<type>"
    And The user uploads a valid 2 years old financial statement file
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - 2 years old financial statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid 2 years old financial statement file - "<type>"
    And The user uploads a valid 1 years old financial statement file
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - 1 years old financial statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid 1 years old financial statement file - "<type>"
    And The user uploads a valid current year financial statement file
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative
Scenario Outline:Invalid file upload in onboarding step 3 - current year financial statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid current year financial statement file - "<type>"
    And The user uploads a valid income statement file
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |

@negative 
Scenario Outline:Invalid file upload in onboarding step 3 - income statement
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
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
    And The user uploads a invalid income statement file - "<type>"
    Then The user should see an error displayed below the input
    Examples:
        | type |
        | png  |
        | mov  |
        | docx |


@negative
Scenario: Leave empty field in onboarding step 2 - requester name
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user clear the requester form
    And The user types the requester first last name
    And The user types the requester document number
    And The user types the requester phone number
    And The user skip to the third step
    Then The user should see an error displayed below the input

@negative
Scenario: Leave empty field in onboarding step 2 - requester firt last name
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user clear the requester form
    And The user types the requester name
    And The user types the requester document number
    And The user types the requester phone number
    And The user skip to the third step
    Then The user should see an error displayed below the input

@negative
Scenario: Leave empty field in onboarding step 2 - requester document number
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user clear the requester form
    And The user types the requester name
    And The user types the requester first last name
    And The user types the requester phone number
    And The user skip to the third step
    Then The user should see an error displayed below the input

@negative
Scenario: Leave empty field in onboarding step 2 - requester phone number
    When The onboarding page loads correctly
    And The user types the admin email
    And The user types the company legal name
    And The user types the comercial name
    And The user types a valid nit
    And The user types the web page
    And The user types the billing email
    And The user types the phone number
    And The user types the street name
    And The user types the street crossing
    And The user types the additional info
    And The user types the neighborhood
    And The user types the zip code
    And The user continues to the next step
    And The user clear the requester form
    And The user types the requester name
    And The user types the requester first last name
    And The user types the requester document number
    And The user skip to the third step
    Then The user should see an error displayed below the input

    
@invite_people @regression
Feature: Invite people
  As a user, I want to be able to invite new users with a defined role

  Background: The login loads correctly and goes to people section
    Given The login loads correctly and goes to people section

  @positive
  Scenario Outline: Succesfully invite a new user with different roles
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    Then The users sends the email
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |
        | admin  |  foreign_national_id  |
        | employee  |  passport  |
        | card_manager  |  national_id  |

  @negative
  Scenario Outline: Leave empty field in invite user form - name
    When The users want to add a person
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @negative
  Scenario Outline: Leave empty field in invite user form - last name
    When The users want to add a person
    And The user types the new user name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @negative @test1
  Scenario Outline: Leave empty field in invite user form - email
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @negative
  Scenario Outline: Leave empty field in invite user form - role
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @negative
  Scenario Outline: Leave empty field in invite user form - cellphone
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @negative
  Scenario Outline: Leave empty field in invite user form - type of id
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user types the new user id number
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |
  
  @negative
  Scenario Outline: Leave empty field in invite user form - id number
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The users click send email button
    Then The user should see an error displayed below the input in invite people form
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @positive
  Scenario Outline: Accept invitation from the user
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users sends the email
    And The user accept the invitation
    And The user type a password
    And The user accept the terms and conditions
    And The users accepts the personal data handling agreement
    And The users accepts the digital sign agreement
    And The users clicks Create account button
    Then Homepage and title should be displayed
    Examples:
        | role | type_of_id |
        | bookkeeping  |  national_id  |

  @positive
  Scenario Outline: Verify default role
    When The users want to add a person
    Then Verify role default value - "<role>"
    Examples:
        | role |
        | Employee |

  @datadriven
  Scenario Outline: Edit people invitation
    When The users want to add a person
    And The user types the new user name
    And The user types the new user last name
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the new user id number
    And The users sends the email
    And The user goes to edit page
    And The user types the custom user name - "<name>"
    And The user types the custom user last name - "<last_name>"
    And The user types the custom user id number - "<id_number>"
    And The user click edit button
    Then Verify scenario result - "<scenario>"
    Examples:
        | role | type_of_id | name | last_name | id_number | scenario |
        | bookkeeping  |  national_id  | goodname | lastname | 123456789 | success |
        | bookkeeping  |  national_id  | name@!.- | lastname | 123456789 | error |
        | bookkeeping  |  national_id  | goodname | lastname@!.- | 123456789 | error |
        | bookkeeping  |  national_id  | goodname | lastname | 12345.@#$ | error |
        | bookkeeping  |  national_id  | empty | lastname | 123456789 | error |
        | bookkeeping  |  national_id  | goodname | empty | 123456789 | error |
        | bookkeeping  |  national_id  | goodname | lastname | empty | error |

  @negative
  Scenario Outline: Verify invalid values in people invitation
    When The users want to add a person
    And The user types the custom user name - "<name>"
    And The user types the custom user last name - "<last_name>"
    And The user types the new user email
    And The user selects "<role>" as the role for the user
    And The user types the new user cellphone
    And The user selects "<type_of_id>" as the type of id for the user
    And The user types the custom user id number - "<id_number>"
    And The users click send email button
    Then Verify scenario result - "<scenario>"
    Examples:
        | role | type_of_id | name | last_name | id_number | scenario |
        | bookkeeping  |  national_id  | name@!.- | lastname | 123456789 | error |
        | bookkeeping  |  national_id  | goodname | lastname@!.- | 123456789 | error |
        | bookkeeping  |  national_id  | goodname | lastname | 12345.@#$ | error |

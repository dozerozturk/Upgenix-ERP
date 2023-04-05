@smoke @login
Feature: UPGENIX app login feature

  #User Story : As a user, I should be able to log in so that I can land on homepage.
  #Acceptance Criteria:

  #AC1- Users can log in with valid credentials (We have 5 types of users but will test only 2 user: PosManager, SalesManager)
  #AC2- "Wrong login/password" should be displayed for invalid (valid username-invalid password and invalid username-valid password) credentials
  #AC3- "Please fill out this field" message should be displayed if the password or username is empty
  #AC4- User should see the password in bullet signs by default
  #AC5- Verify if the ‘Enter’ key of the keyboard is working correctly on the login page.


  Background: for the scenario for this feature file, user is expected to be on the login page
    Given user is on the UPGENIX login page

  @UPG10-346
  Scenario Outline:  Login functionality verification
    When user enters username "<username>"
    And user enters password "<password>"
    And user clicks on the Login button
    Then user is on the Inbox page

    Examples: users valid credentials to be use in this scenario
      | username                | password     |
      | salesmanager75@info.com | salesmanager |
      | salesmanager57@info.com | salesmanager |
      | posmanager75@info.com   | posmanager   |
      | posmanager57@info.com   | posmanager   |

  @UPG10-347
  Scenario Outline: "Wrong login/password" message should be displayed for
  valid username and invalid password
    When user enters username "<username>"
    And user enters password "<password>"
    And user clicks on the Login button
    Then user should see Wrong login or password message

    Examples:
      | username                | password     |
      | salesmanager75@info.com | Salesmanager |
      | salesmanager57@info.com | salesManager |
      | posmanager75@info.com   | Posmanager   |
      | posmanager57@info.com   | posManager   |

  @UPG10-406
  Scenario Outline: "Wrong login/password" message should be displayed for
  invalid username and valid password
    When user enters username "<username>"
    And user enters password "<password>"
    And user clicks on the Login button
    Then user should see Wrong login or password message

    Examples:
      | username                  | password     |
      | wrongName@info.com        | salesmanager |
      | salesmanager250@info.com  | salesmanager |
      | posmanager100500@info.com | posmanager   |
      | 1409809184@info.com       | posmanager   |

  @UPG10-349
  Scenario Outline: "Please fill out this field" notification message should be displayed
  in absence of user
    When user enters username "<username>"
    And user enters password "<password>"
    And user clicks on the Login button
    Then user should get - (Please fill out this field.) warning message

    Examples:
      | username              | password     |
      |                       | salesmanager |
      | posmanager75@info.com |              |


  @UPG10-350
  Scenario: User should see bullet signs instead of actual password characters
    When user "posmanager75@info.com" enters password "posmanager"
    Then user should see the password in bullet signs by default

  @UPG10-354 @search
  Scenario: Verify if the ‘Enter’ key of the keyboard is working correctly on the login page.
    When user "salesmanager15@info.com" enters password "salesmanager"
    And press (Enter) key
    Then user is on the Inbox page

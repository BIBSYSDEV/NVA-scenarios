# encoding: utf-8
# language: en

Feature: Login and log out

  # Note: this scenario assumes that the test user has revoked consent for the NVA application 
  # in Feide (https://idp.feide.no/simplesaml/module.php/feide/)
  # Note that the Test App stack needs to be registered in Feide/Dataoporten
  # Note that the Test User needs to be registered in Units LDAP
  # Note that concurrency issues must be managed in some way because a user/app may be in use in multiple stacks at the same time
  Scenario: A user logs in with Feide for the first time
    Given that the user is on the start page
    When they click on the log-in button
    And they are redirected to Feide
    And they enter their valid credentials
    And they approve the sharing of data with the NVA application regarding
        | Username            |
        | E-mail address      |
        | Real name           |
        | Affiliation         |
        | Organization number |
    Then they are redirected back to the NVA application
    And they see their login details in the navigation bar
      
  Scenario: A user logs in with Feide not for the first time
    Given that the user is on the start page
    When they click on the log-in button
    And they are redirected to Feide
    And they enter their valid credentials
    Then they are redirected back to the NVA application
    And they see their login details in the navigation bar

  Scenario: A user is already authenticated with Feide (single sign on)
    Given that the user is already authenticated with Feide
    When they navigate to the start page
    And they click on the log-in button
    And they are redirected to Feide
    And they click on the identity they wish to proceed with in the Feide interface
    Then they are redirected back to the NVA application
    And they see their login details in the navigation bar
    
  Scenario: A user logs in and views their user details
    Given that the user is logged in
    When they click their user details in the navigation bar
    And they select Profile
    Then they see details of their
        | User name                    |
        | Real name                    |
        | Institutional association    |
        | Role(s)                      |
        | Group                        |
        | E-mail                       |
        | Applications                 |

  Scenario: A user logs out
    Given that the user is already logged in
    When they click their login details in the navigation bar
    And they click Log out
    Then they are logged out of the system

# encoding: utf-8
# language: en

Feature: Login and log out

  Scenario: A user logs in with Feide
    Given that the user is on the start page
    When they click on the log-in button
    And they enter their valid credentials
    Then they are logged in
    And they see their login details in the navigation bar

  Scenario: A user is already authenticated with Feide
    Given that the user is already authenticated with Feide
    When they navigate to the start page
    Then they see their login details in the navigation bar

  Scenario: A user logs in and views their user details
    Given that the user is logged in
    When they click their user button
    Then they see details of their
        | User name                    |
        | Real name                    |
        | Institutional association(s) |
        | Role(s)                      |

  Scenario: A user logs out
    Given that the user is already logged in
    When they click the log-out button
    Then they are logged out of the system

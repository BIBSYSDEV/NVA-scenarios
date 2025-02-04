Feature: Local Project Manager reports KBS data

  Scenario: Notification of KBS reporting
    Given a user logged in as Local Project Manager
    And their Project is marked for KBS reporting
    And local KBS data is not yet reported
    And the reporting period is still open
    Then the user should recieve a notification

  Scenario: Report local number of inclusions for given period
    Given a user logged in as Local Project Manager
    And their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to report local number of inclusions for the given period
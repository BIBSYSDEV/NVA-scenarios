Feature: Project Manager reports KBS data

  Scenario: Notification of KBS reporting
    Given a user logged in as Project Manager
    And their Project is marked for KBS reporting
    And KBS data is not yet reported
    And the reporting period is still open
    Then the user should recieve a notification

  Scenario: Report number of inclusions for given period
    Given a user logged in as Project Manager
    And their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to report number of inclusions for the given period

  Scenario: Edit number of inclusions for given period
    Given a user logged in as Project Manager
    And their Project is marked for KBS reporting
    And the reporting period is still open
    And number of inclusions is already reported
    Then the user should be able to edit the number of inclusions for the given period

  Scenario: Report first inclusion date
    Given a user logged in as Project Manager
    And their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to report the first inclusion date for the Project

  Scenario: Report last inclusion date
    Given a user logged in as Project Manager
    And their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to report the last inclusion date for the Project

  Scenario: See number of inclusions from Local Project Managers
    Given a user logged in as Project Manager
    And their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to see a list of Local Project Managers and their inclusion numbers
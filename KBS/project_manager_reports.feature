Feature: Project Manager reports KBS data

  Background:
    Given a user is logged in as Project Manager

  Scenario: Notification of KBS reporting
    Given their Project is marked for KBS reporting
    And KBS data is not yet reported
    And the reporting period is still open
    Then the user should recieve a notification

  Scenario: Report number of inclusions for given period
    Given their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to report number of inclusions for the given period

  Scenario: Edit number of inclusions for given period
    Given their Project is marked for KBS reporting
    And the reporting period is still open
    And number of inclusions is already reported
    Then the user should be able to edit the number of inclusions for the given period

  Scenario: Report first and last inclusion date
    Given their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to report the first inclusion date for the Project
    And the user should be able to report the last inclusion date for the Project

  Scenario: See number of inclusions from Local Project Managers
    Given their Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to see a list of Local Project Managers and their inclusion numbers
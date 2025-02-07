Feature: Local Project Manager reports KBS data

  Background:
    Given a user logged in as Local Project Manager

  @ignore("not_a_requirement_for_mvp")
  Scenario: Notification of KBS reporting
    When their Project is KBS Reportable
    And local KBS data is not yet reported
    And the reporting period is open
    Then they should recieve a notification

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Local Project Manager should be provided

  Scenario: Save local number of inclusions for given period
    When their Project is KBS Reportable
    And the reporting period is open
    Then they should be able to save local number of inclusions for the given period

  Scenario: Inclusion number should only be zero or a positive integer
    When changing local number of inclusions
    Then only non-negative integers should be allowed

  Scenario: Should be able to save inclusion number for their local project
    When their Project is KBS Reportable
    Then they should be able to save inclusion number for their local project

  Scenario: Should not be able to save inclusion number for another local project
    When their Project is KBS Reportable
    Then they should not be able to save inclusion number for another local project

  Scenario: Should not be able to save KBS metadata other than their local inclusion number
    When their Project is KBS Reportable
    Then they should only be able to save their local inclusion number
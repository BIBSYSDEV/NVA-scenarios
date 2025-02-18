Feature: Local Project Manager reports KBS data

  Background:
    Given a user logged in as Local Project Manager

  @ignore("not_a_requirement_for_mvp")
  Scenario: Notification of KBS reporting
    Given their Project is a KBS Project
    And local KBS Metadata is not yet reported
    And the Reporting Period is open
    When they log in
    Then they receive a notification

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Local Project Manager are returned

  Scenario: Report Local Recruitment Number for given Reporting Period
    Given their Project is a KBS Project
    And the Reporting Period is open
    When they report Local Recruitment Number
    Then Local Recruitment Number for the period is saved

  Scenario Outline: Only zero or a positive integer allowed input for Local Recruitment Number
    When the user reports Local Number of Inclusions as a <Value>
    Then they receive <Response>

    Examples:
      | Value            | Response |
      | positive integer | success  |
      | zero             | success  |
      | negative integer | error    |

  Scenario: Can report Recruitment Number for their local project
    Given their Project is a KBS Project
    When they report Recruitment Number for their local project
    Then Local Inclusion Number for their local project is updated

  Scenario: Cannot report Recruitment Number for another local project
    Given their Project is a KBS Project
    When they report Recruitment Number for another local project
    Then they are denied

  Scenario: Cannot report KBS metadata other than their Local Recruitment Number
    Given their Project is a KBS Project
    When they report KBS Metadata other than their Local Recruitment Number
    Then they are denied
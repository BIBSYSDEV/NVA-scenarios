Feature: Local Project Manager reports KBS data

  Background:
    Given a user logged in as Local Project Manager

  @ignore("not_a_requirement_for_mvp")
  Scenario: Notification of KBS reporting
    Given their Project is KBS Reportable
    And local KBS Metadata is not yet reported
    And the Reporting Period is open
    When they log in
    Then they receive a notification

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Local Project Manager are provided

  Scenario: Report Local Number of Inclusions for given Reporting Period
    Given their Project is KBS Reportable
    And the Reporting Period is open
    When they report Local Number of Inclusions
    Then Local Number of Inclusions for the period is saved

  Scenario Outline: Local Number of Inclusions should only be zero or a positive integer
    When the user reports Local Number of Inclusions as a <Value>
    Then they receive <Response>

    Examples:
      | Value            | Response |
      | positive integer | success  |
      | zero             | success  |
      | negative integer | error    |

  Scenario: Should be able to report inclusion number for their local project
    Given their Project is KBS Reportable
    When they report inclusion number for their local project
    Then Local Inclusion Number for their local project is updated

  Scenario: Should not be able to report inclusion number for another local project
    Given their Project is KBS Reportable
    When they report inclusion number for another local project
    Then they are denied

  Scenario: Should not be able to report KBS metadata other than their local inclusion number
    Given their Project is KBS Reportable
    When they report KBS Metadata other than their Local Inclusion Number
    Then they are denied
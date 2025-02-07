Feature: Project Manager reports KBS data

  Background:
    Given a user is logged in as Project Manager

  Scenario: Notification of KBS reporting
    When their Project is KBS Reportable
    And KBS data is not yet reported
    And the reporting period is open
    Then they should recieve a notification

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Project Manager should be provided

  Scenario: Save number of inclusions for given period
    When their Project is KBS Reportable
    And the reporting period is open
    Then they should be able to save number of inclusions for the given period

  Scenario: Inclusion number should only allow zero or a positive integer
    When reporting local number of inclusions
    Then only non-negative integers should be allowed

  Scenario Outline: Report inclusion date
    When their Project is KBS Reportable
    And the reporting period is open
    Then the user should be able to report the <Type> inclusion date

    Examples:
      | Type  |
      | First |
      | Last  |

  Scenario: First inclusion date cannot be after last inclusion date
    Given last inclusion date set
    When reporting first inclusion date
    Then a date after last inclusion date is not allowed

  Scenario: Last inclusion date cannot be before first inclusion date
    Given first inclusion date set
    When reporting last inclusion date
    Then a date before first inclusion date is not allowed

  Scenario: Last inclusion date cannot be in a future year
    When reporting last inclusion date
    Then a date in a future year is not allowed

  Scenario Outline: Inclusion date should not be restricted to REK/CTIS Approval period
    When reporting <Type> inclusion date
    Then it should not be restrictied to a date between the start and end of an REK/CTIS Approval period

    Examples:
      | Type  |
      | First |
      | Last  |

  Scenario Outline: Inclusion date should not be restricted to Project period
    When reporting <Type> inclusion date
    Then it should not be restrictied to a date between the start and end of the Project period

    Examples:
      | Type  |
      | First |
      | Last  |

  Scenario: See number of inclusions from Local Project Managers
    When their Project is KBS Reportable
    And the reporting period is open
    Then they should be able to see Local Project Managers and their inclusion numbers

  Scenario: Should not be able to edit inclusion numbers of Local Project Managers
    When local inclusion numbers are reported
    Then they should not be able to change the local inclusion numbers
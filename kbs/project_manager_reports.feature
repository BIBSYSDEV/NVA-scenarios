Feature: Project Manager reports KBS data

  Background:
    Given a user is logged in as Project Manager

  Scenario: Notification of KBS reporting
    Given their Project is a KBS Project
    And KBS Metadata is not yet reported
    And the Reporting Period is open
    When they log in
    Then they receive a notification

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Project Manager are returned

  Scenario: Report Recruitment Number for given Reporting Period
    Given their Project is a KBS Project
    And the Reporting Period is open
    When they report Recruitment Number
    Then Recruitment Number for the period is saved

  Scenario Outline: Only zero or a positive integer allowed input for Recruitment Number
    When the user reports Recruitment Number as a <Value>
    Then they receive <Response>

    Examples:
      | Value            | Response |
      | positive integer | success  |
      | zero             | success  |
      | negative integer | error    |

  Scenario Outline: Report Recruitment Date
    Given their Project is a KBS Project
    And the Reporting Period is open
    When the user reports <Recruitment Date>
    Then <Recruitment Date> is saved

    Examples:
      | Recruitment Date       |
      | First Recruitment Date |
      | Last Recruitment Date  |

  Scenario: First Recruitment Date cannot be after Last Recruitment Date
    Given Last Recruitment Date set
    When the user reports First Recruitment Date as a date after Last Recruitment Date
    Then they receive an error

  Scenario: Last Recruitment Date cannot be before First Recruitment Date
    Given First Recruitment Date set
    When the user reports Last Recruitment Date as a date before First Recruitment Date
    Then they receive an error

  Scenario: Last Recruitment Date cannot be in a future year
    When the user reports Last Recruitment Date as a date in a future year
    Then they receive an error

  Scenario Outline: Recruitment date should not be restricted to REK/CTIS Approval period
    When reporting <Recruitment Date> outside of an REK/CTIS Approval period
    Then the date is saved

    Examples:
      | Recruitment Date       |
      | First Recruitment Date |
      | Last Recruitment Date  |

  Scenario Outline: Recruitment date should not be restricted to Project period
    When reporting <Recruitment Date> outside of the Project Period
    Then the date is saved

    Examples:
      | Recruitment Date       |
      | First Recruitment Date |
      | Last Recruitment Date  |

  Scenario: See Local Recruitment Numbers from Local Project Managers
    Given their Project is a KBS Project
    And the Reporting Period is open
    When they request Local Recruitment Numbers
    Then Local Project Managers and their Local Recruitment Numbers are returned

  Scenario: Should not be able to edit Recruitment Numbers of Local Project Managers
    When the user edits Local Recruitment Numbers
    Then they are denied

  Scenario Outline: When a Project Manager changes fields such that the Project is no longer eligible for KBS reporting, then it is no longer a KBS Project
    Given a KBS Project
    When the user changes <Field> to a non-KBS-complicit value
    Then it is no longer a KBS Project
    And the user is alerted
    And KBS Metadata is deleted

    Examples:
      | Field                  |
      | Health Project Type    |
      | Approval from REK/CTIS |
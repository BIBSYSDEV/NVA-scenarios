Feature: Project Manager reports KBS data

  Background:
    Given a user is logged in as Project Manager

  Scenario: Notification of KBS reporting
    Given their Project is KBS Reportable
    And KBS Metadata is not yet reported
    And the Reporting Period is open
    When they log in
    Then they receive a notification

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Project Manager are provided

  Scenario: Report Number of Inclusions for given Reporting Period
    Given their Project is KBS Reportable
    And the Reporting Period is open
    When they report Number of Inclusions
    Then Number of Inclusions for the period is saved

  Scenario Outline: Number of Inclusions should only be zero or a positive integer
    When the user reports Number of Inclusions as a <Value>
    Then they receive <Response>

    Examples:
      | Value            | Response |
      | positive integer | success  |
      | zero             | success  |
      | negative integer | error    |

  Scenario Outline: Report Inclusion Date
    Given their Project is KBS Reportable
    And the Reporting Period is open
    When the user reports <Inclusion Date>
    Then <Inclusion Date> is saved

    Examples:
      | Inclusion Date       |
      | First Inclusion Date |
      | Last Inclusion Date  |

  Scenario: First Inclusion Date cannot be after Last Inclusion Date
    Given Last Inclusion Date set
    When the user reports First Inclusion Date as a date after Last Inclusion Date
    Then they receive an error

  Scenario: Last Inclusion Date cannot be before First Inclusion Date
    Given First Inclusion Date set
    When the user reports Last Inclusion Date as a date before First Inclusion Date
    Then they receive an error

  Scenario: Last Inclusion Date cannot be in a future year
    When the user reports Last Inclusion Date as a date in a future year
    Then they receive an error

  Scenario Outline: Inclusion date should not be restricted to REK/CTIS Approval period
    When reporting <Inclusion Date> outside of an REK/CTIS Approval period
    Then the date is saved

    Examples:
      | Inclusion Date       |
      | First Inclusion Date |
      | Last Inclusion Date  |

  Scenario Outline: Inclusion date should not be restricted to Project period
    When reporting <Inclusion Date> outside of the Project Period
    Then the date is saved

    Examples:
      | Inclusion Date       |
      | First Inclusion Date |
      | Last Inclusion Date  |

  Scenario: See Local Number of Inclusions from Local Project Managers
    Given their Project is KBS Reportable
    And the Reporting Period is open
    When they request Local Number of Inclusions
    Then Local Project Managers and their local inclusion numbers are provided

  Scenario: Should not be able to edit inclusion numbers of Local Project Managers
    When the user edits local inclusion numbers
    Then they are denied

  Scenario Outline: When a KBS Reportable Project changes fields such that it no longer comply with KBS requirements it is no longer a KBS Reportable Project
    Given a KBS Reportable Project
    When the user changes <Field> to a non-KBS-complicit value
    Then it is no longer a KBS Reportable Project
    And the user is alerted
    And KBS Metadata is deleted

    Examples:
      | Field                  |
      | Health Project Type    |
      | Approval from REK/CTIS |
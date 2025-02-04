Feature: Evaluating KBS candidates

  Scenario Outline: Project satisfies KBS requirements
    Given a Project is active
    And has an approval from either REK or CTIS
    And is of Health Project Type <Type>
#    And marked as not a candidate/last inclusion date is from a previous period
    Then the Project should be listed as a KBS candidate

    Examples:
      | Type                 |
      | Other clinical study |
      | Drug study           |

  Scenario: Notification of KBS candidate
    Given a user logged in as Project Manager
    And at least one of their Projects is listed as a KBS candidate
    Then the user is notified that they must decide if the Project is Reportable

  Scenario: See a list of KBS candidates
    Given a user logged in as Project Manager
    And at least one of their Projects is listed as a KBS candidate
    Then a list of their KBS candidates should be available

  Scenario: Mark candidate for KBS reporting
    Given a user logged in as Project Manager
    And their Project is a KBS candidate
    Then the user should be able to decide if the Project should report for KBS

  Scenario: Undo KBS reporting decision
    Given a user logged in as Project Manager
    And the user has decided if their Project should report for KBS
    And the reporting period is still open
    Then the user should be able to undo the decision
    And KBS related data for that period should be deleted
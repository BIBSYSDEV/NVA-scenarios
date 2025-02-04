Feature: Evaluating KBS Candidates

  Scenario Outline: Project satisfies KBS requirements
    Given a Project is active
    And has an approval from <Approval Authority>
    And is of Health Project Type <Type>
#    And marked as not a candidate/last inclusion date is from a previous period
    Then the Project should be listed as a KBS Candidate

    Examples:
      | Type                 | Approval Authority |
      | Other clinical study | REK                |
      | Other clinical study | CTIS               |
      | Other clinical study | REK and CTIS       |
      | Drug study           | REK                |
      | Drug study           | CTIS               |
      | Drug study           | REK and CTIS       |

  Scenario: Notification of KBS Candidate
    Given a user logged in as Project Manager
    And at least one of their Projects is listed as a KBS Candidate
    Then the user is notified that they must decide if the Project is Reportable

  Scenario: See a list of KBS candidates
    Given a user logged in as Project Manager
    When the user requests all of their KBS candidates
    Then all KBS Candidates where the user is Project Manager should be provided

  Scenario: Mark candidate for KBS reporting
    Given a user logged in as Project Manager
    And their Project is a KBS Candidate
    Then the user should be able to decide if the Project is Reportable

  Scenario: Undo KBS Reportable decision
    Given a user logged in as Project Manager
    And the user has decided if their Project is Reportable
    And the given reporting period is open
    Then the user should be able to undo the decision
    When the user undoes the decision
    Then KBS related data for that Project for the given period should be deleted
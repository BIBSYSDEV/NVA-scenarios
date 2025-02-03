Feature: Evaluating KBS candidates

  Scenario: Project satisfies KBS requirements
    Given a Project is active
    And has an approval from either REK or CTIS
    And is of Health Project Type "Other clinical study" or "Drug study"
#    And marked as not a candidate/last inclusion date is from a previous period
    Then the Project should be listed as a KBS candidate

  Scenario: Notification of KBS candidate
    Given a user logged in as Project Manager
    And some of their Projects is listed as a KBS candidate
    Then the user should recieve a notification

  Scenario: See a list of KBS candidates
    Given a user logged in as Project Manager
    And some of their Projects are KBS candidates
    Then a list of thier KBS candidates should be available

  Scenario: Mark candidate for KBS reporting
    Given a user logged in as Project Manager
    And their Project is a KBS candidate
    Then the user should be able to decide if the Project should report for KBS

  Scenario: Undo KBS reporting decision
    Given a user logged in as Project Manager
    And the user has decided if their Project should report for KBS
    And the reporting period is still open
    Then the user should be able to undo the decision
    And eventual KBS related data for that period should be deleted
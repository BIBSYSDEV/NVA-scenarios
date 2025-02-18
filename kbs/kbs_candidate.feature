Feature: Evaluating KBS Candidates

  Scenario Outline: Project satisfies requirements to be a KBS Candidate (REK)
    Given a Reporting Period
    When a Project is a Health Project Type <Type>
    And has an active Approval from REK during the period
    And Last Recruitment Date is not set
    Then the Project is a KBS Candidate

    Examples:
      | Type                 |
      | Other clinical study |
      | Drug study           |

  @ignore("until_CTIS_is_integrated")
  Scenario Outline: Project satisfies requirements to be a KBS Candidate (CTIS)
    Given a Reporting Period
    When a Project is a Health Project Type <Type>
    And has an active Approval from CTIS during the period
    And Last Recruitment Date is not set
    Then the Project is a KBS Candidate

    Examples:
      | Type                 |
      | Other clinical study |
      | Drug study           |

  Scenario: Project is not eligible for KBS reporting when of wrong Health Project Type
    Given a Reporting Period
    When a Project is not a Health Project Type "Other clinical study" or "Drug study"
    Then the Project is not a KBS Candidate

  Scenario: Project is not eligible for KBS reporting when no approval within period
    Given a Reporting Period
    When a Project has no active Approval from REK or CTIS during the Reporting Period
    Then the Project is not a KBS Candidate

  Scenario: Project is not eligible for KBS reporting when Last Recruitment Date is in a previous Reporting Year
    When a Project has a Last Recruitment Date from a previous Reporting Year
    Then the Project is not a KBS Candidate

  Scenario Outline: KBS Candidate Metadata changes so that it is no longer a KBS Candidate
    Given a KBS Candidate
    When <Field> changes to a non-KBS-complicit value
    Then it is no longer a KBS Candidate

    Examples:
      | Field                  |
      | Health Project Type    |
      | Approval from REK/CTIS |

  Scenario: When a Project has reported for KBS previously, it must still satisfy KBS requirements to be a KBS Candidate
    Given a Project that was a KBS Project previous Reporting Period
    When it changes fields such that it is no longer eligible for KBS reporting
    Then it is not a KBS Candidate

  Scenario: When a KBS Candidate becomes a KBS Project, it is no longer a KBS Candidate
    When a KBS Candidate becomes a KBS Project
    Then it is no longer a KBS Candidate

  Scenario: When a KBS Candidate is marked not to be a KBS Project, it is no longer a KBS Candidate
    When a KBS Candidate is marked to not be a KBS Project
    Then it is no longer a KBS Candidate

  Scenario: When a KBS Candidate is yet to be decided as a KBS Project for a previous Reporting Period, it should still be a KBS Candidate this period
    Given a Project still a KBS Candidate for previous Reporting Period
    When it is eligible for KBS reporting current period
    Then it is a KBS Candidate for current period

  Scenario: Notification of KBS Candidate
    Given a user logged in as Project Manager
    And their Project is a KBS Candidate
    When they log in
    Then they receive a notification

  Scenario: Get KBS Candidates where user is Project Manager
    Given a user logged in as Project Manager
    When they request KBS Candidates
    Then all KBS Candidates where they are Project Manager are returned

  Scenario: KBS Candidates where user is not Project Manager are not returned
    Given a user logged in as Project Manager
    When they request KBS Candidates
    Then KBS Candidates where they are not Project Manager are not returned

  Scenario: When user is not a Project Manager, no KBS Candidates are returned
    Given a user not Project Manager on any Project
    When they request KBS Candidates
    Then no KBS Candidates are returned

  Scenario: Mark KBS Candidate as a KBS Project when user is Project Manager
    Given a user logged in as Project Manager
    And a Project where they are Project Manager is a KBS Candidate
    When they mark the Project to be a KBS Project
    Then the Project is a KBS Project

  Scenario: Mark KBS Candidate as not a KBS Project when user is Project Manager
    Given a user logged in as Project Manager
    And a Project where they are Project Manager is a KBS Candidate
    When they mark the Project to not be a KBS Project
    Then the Project is not a KBS Project

  Scenario: Cannot mark KBS Candidate as a KBS Project when user is not Project Manager
    Given a user is not Project Manager on a Project
    And the Project is a KBS Candidate
    When they mark the Project to be a KBS Project
    Then they are denied

  Scenario: Cannot mark KBS Candidate as not a KBS Project when user is not Project Manager
    Given a user is not Project Manager on a Project
    And the Project is a KBS Candidate
    When they mark the Project not to be a KBS Project
    Then they are denied

  Scenario Outline: Undo KBS Project marking
    Given a user logged in as Project Manager
    And the given Reporting Period is open
    And their Project is <KBS Status>
    When they undo the marking
    Then the Project is a KBS Candidate

    Examples:
      | KBS Status        |
      | a KBS Project     |
      | not a KBS Project |

  Scenario: Delete KBS Metadata when a Project goes from KBS Project to KBS Candidate
    Given a KBS Project for a given Reporting Period
    When the project changes to a KBS Candidate
    Then the KBS Metadata for the period is deleted
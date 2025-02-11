Feature: Evaluating KBS Candidates

  Scenario Outline: Project satisfies requirements to be a KBS Candidate (REK)
    Given a Reporting Period
    When a Project is of Health Project Type <Type>
    And an active Approval from REK during the period
    And Last Inclusion Date is not set
    Then the Project is a KBS Candidate

    Examples:
      | Type                 |
      | Other clinical study |
      | Drug study           |

  @ignore("until_CTIS_is_integrated")
  Scenario Outline: Project satisfies requirements to be a KBS Candidate (CTIS)
    Given a Reporting Period
    When a Project is of Health Project Type <Type>
    And an active Approval from CTIS during the period
    And Last Inclusion Date is not set
    Then the Project is a KBS Candidate

    Examples:
      | Type                 |
      | Other clinical study |
      | Drug study           |

  Scenario: Project does not satisfy for KBS reporting when of wrong Health Project Type
    Given a Reporting Period
    When a Project is not of Health Project Type "Other clinical study" or "Drug study"
    Then the Project is not a KBS Candidate

  Scenario: Project does not satisfy for KBS reporting when no approval within period
    Given a Reporting Period
    When a Project has no active Approval from REK or CTIS during the Reporting Period
    Then the Project is not a KBS Candidate

  Scenario: Project does not satisfy for KBS reporting when Last Inclusion Date is in a previous Reporting Year
    When a Project has a Last Inclusion Date from a previous Reporting Year
    Then the Project is not a KBS Candidate

  Scenario: When a Project is not a KBS Candidate then it is not a KBS Candidate
    When a Project is not a KBS Candidate
    Then it is not a KBS Candidate

  Scenario Outline: When a KBS Candidate changes fields such that it no longer comply with KBS requirements it is no longer a KBS Candidate
    Given a KBS Candidate
    When <Field> changes to a non-KBS-complicit value
    Then it is no longer a KBS Candidate

    Examples:
      | Field                  |
      | Health Project Type    |
      | Approval from REK/CTIS |

  Scenario: When a Project has reported for KBS previously, it must still satisfy KBS requirements to be a KBS Candidate
    Given a Project that was KBS Reportable previous Reporting Period
    When it changes fields such that it no longer comply with KBS requirements
    Then it is not a KBS Candidate

  Scenario: When a KBS Candidate becomes KBS Reportable, it should no longer be a KBS Candidate
    When a KBS Candidate becomes KBS Reportable
    Then it is no longer a KBS Candidate

  Scenario: When a KBS Candidate is decided to not be KBS Reportable, it should no longer be a KBS Candidate
    When a KBS Candidate is decided to not be KBS Reportable
    Then it is no longer a KBS Candidate

  Scenario: When a KBS Candidate is yet to be decided as KBS Reportable for a previous Reporting Period, it should still be a KBS Candidate this period
    Given a Project still a KBS Candidate for previous Reporting Period
    When it satisfies for KBS reporting current period
    Then it is a KBS Candidate for current period

  Scenario: Notification of KBS Candidate
    Given a user logged in as Project Manager
    When their Project is a KBS Candidate
    Then they are notified that they must decide if it is KBS Reportable

  Scenario: Get KBS Candidates where user is Project Manager
    Given a user logged in as Project Manager
    When they request KBS Candidates
    Then all KBS Candidates where they are Project Manager are provided

  Scenario: Should not get KBS Candidates where user is not Project Manager
    Given a user logged in as Project Manager
    When they request KBS Candidates
    Then KBS Candidates where they are not Project Manager are not provided

  Scenario: Should not get KBS Candidates when user is not Project Manager
    Given a user not Project Manager on any Project
    When they request KBS Candidates
    Then no KBS Candidates are provided

  Scenario Outline: Decide if KBS Candidate is KBS Reportable when user is Project Manager
    Given a user logged in as Project Manager
    And a Project where they are Project Manager is a KBS Candidate
    When they decide that the Project is <KBS Status>
    Then the Project is <Status>

    Examples:
      | KBS Status         |
      | KBS Reportable     |
      | not KBS Reportable |

  Scenario Outline: Should not be able to decide if KBS Candidate is KBS Reportable when user is not Project Manager
    Given a user is not Project Manager on a Project
    And the Project is a KBS Candidate
    When they decide that the Project is <KBS Status>
    Then they are denied

    Examples:
      | KBS Status         |
      | KBS Reportable     |
      | not KBS Reportable |

  Scenario Outline: Undo KBS Reportable decision
    Given a user logged in as Project Manager
    And the given Reporting Period is open
    And their Project is <Old KBS Status>
    When they set status <New KBS Status>
    Then the Project is <New KBS Status>

    Examples:
      | Old KBS Status     | New KBS Status     |
      | KBS Reportable     | not KBS Reportable |
      | not KBS Reportable | KBS Reportable     |

  Scenario: Delete KBS Metadata when Project goes from KBS Reportable to not KBS Reportable
    When a KBS Reportable Project changes to a not KBS Reportable Project for a given Reporting Period
    Then the KBS Metadata for the period is deleted
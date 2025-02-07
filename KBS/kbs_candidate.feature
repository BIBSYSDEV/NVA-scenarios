Feature: Evaluating KBS Candidates

  Scenario Outline: Project satisfies requirements to be a KBS Candidate (REK)
    Given a Reporting Period
    When a Project is of Health Project Type <Type>
    And it has an active approval from REK in the reporting period
    And last inclusion date is not set
    Then the Project is a KBS Candidate

    Examples:
      | Type                 |
      | Other clinical study |
      | Drug study           |

  @ignore("until_CTIS_is_integrated")
  Scenario Outline: Project satisfies requirements to be a KBS Candidate (CTIS)
    Given a Reporting Period
    When a Project is of Health Project Type <Type>
    And it has an active approval from CTIS in the reporting period
    And last inclusion date is not set
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
    When a Project has no active approval from REK/CTIS in the reporting period
    Then the Project is not a KBS Candidate

  Scenario: Project does not satisfy for KBS reporting when last inclusion date is in a previous period/year
    When a Project has a last inclusion date from a previous period/year
    Then the Project is not a KBS Candidate

  Scenario: When a Project is not a KBS Candidate then it is not a KBS Candidate
    When a Project is not a KBS Candidate
    Then it is not a KBS Candidate

  Scenario Outline: When a KBS Candidate changes fields such that it no longer comply with KBS requirements it is no longer a KBS Candidate
    When a KBS Project changes to a non-KBS-complicit value of <Field>
    Then it is no longer a KBS Candidate

    Examples:
      | Field                  |
      | Health Project Type    |
      | Approval from REK/CTIS |

    # What about a KBS Project that changes fields such that it no longer comply with KBS requirements?

  Scenario: When a Project has reported for KBS previously, it must still satisfy KBS requirements to be a KBS Candidate
    Given a Project previously reported for KBS
    When it changes fields such that it no longer comply with KBS requirements
    Then it is not a KBS Candidate

  Scenario: When a KBS Candidate is decided to be Reportable, it should no longer be a KBS Candidate
    When a KBS Candidate is decided to be Reportable
    Then it is no longer a KBS Candidate for given period

  Scenario: When a KBS Candidate is decided to not be Reportable, it should no longer be a KBS Candidate
    When a KBS Candidate is decided to not be Reportable
    Then it is no longer a KBS Candidate for given period

  Scenario: When a KBS Candidate is yet to be decided as Reportable for a previous period, it should still be a KBS Candidate this period
    Given a Project was a KBS Candidate previous period
    When no decision whether it should be Reportable or not was made then
    Then it should still be considered to be a KBS Candidate this period

  Scenario: Notification of KBS Candidate
    Given a user logged in as Project Manager
    When their Project is a KBS Candidate
    Then they are notified that they must decide if the Project is Reportable

  Scenario: Get KBS candidates where user is Project Manager
    Given a user logged in as Project Manager
    When they request KBS candidates
    Then all KBS Candidates where they are Project Manager should be provided

  Scenario: Should not get KBS candidates where user is not Project Manager
    Given a user logged in as Project Manager
    When they request KBS candidates
    Then KBS Candidates where they are not Project Manager should not be provided

  Scenario: Should not get KBS candidates when user is not Project Manager
    Given a user not Project Manager on any Projects
    When they request KBS candidates
    Then no KBS Candidates should be provided

  Scenario Outline: Decide if KBS Candidate is Reportable when user is Project Manager
    Given a user logged in as Project Manager
    When a Project where they are Project Manager is a KBS Candidate
    Then they should be able to decide that the Project is <Status>

    Examples:
      | Status         |
      | Reportable     |
      | not Reportable |

  Scenario Outline: Should not be able to decide if KBS Candidate is Reportable when user is not Project Manager
    Given a user is not Project Manager on a Project
    When the Project is a KBS Candidate
    Then they should not be able to decide if the Project is <Status>

    Examples:
      | Status         |
      | Reportable     |
      | not Reportable |

  Scenario: Undo KBS Reportable decision
    Given a user logged in as Project Manager
    And the given reporting period is open
    When they have decided if their Project is Reportable
    Then they should be able to undo the decision

  Scenario: Delete KBS metadata when Projects goes from Reportable to not Reportable
    When a KBS Project goes from Reportable to not Reportable
    Then the Projects KBS metadata for the given period should be deleted
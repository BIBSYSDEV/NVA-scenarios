# Copied from https://sikt.atlassian.net/browse/NP-48230
Feature: NVI reporting

  Scenario: Self-report completion of "NVI Control and Approval"
    Given an NVI period is open,
    And all NVI candidates are resolved,
    When an Editor checks the <status> of the NVI period,
    And the status of their institution is displayed,
    Then the Editor can mark the "NVI Control and Approval" as "Done" for its institustion.

    Examples:
      | status             |
      | Departments        |
      | Candidate          |
      | Being checked      |
      | Approved           |
      | Rejected           |
      | Total number       |
      | Publication points |
      | Dispute            |

  Scenario: A System Administrator checks the status of the NVI period
    Given an NVI period is open,
    When a System Administrator inspects the NVI period,
    And the <status> of each participating institution is displayed,
    And it is clearly indicated which institutions have marked their status as "Done,"
    Then the System Administrator can choose to close the NVI period.

    Examples:
      | status             |
      | Institution        |
      | Candidate          |
      | Being checked      |
      | Approved           |
      | Rejected           |
      | Total number       |
      | Publication points |
      | Dispute            |
      | Done               |

  Scenario: A NVI period is closed
    Given an NVI period is open,
    When a System Administrator closes the NVI period,
    Then all NVI Control and Approval actions are disabled for institutions,
    And institutions can view the status of the registrations and the period,
    And the NVI period is marked as "closed" in the system.

  Scenario: NVI reported results are marked
    Given "A NVI period is closed",
    When a System Administrator closes the NVI period,
    Then all approved results in this period are marked as "NVI reported,"
    And secure copies of each result are stored for future reference.

  Scenario: The reported results are compiled into a published dataset
    Given "NVI reported results are marked",
    When a System Administrator closes the NVI period,
    Then descriptive metadata for all "NVI reported" results is compiled into a dataset,
    And a schema describing the dataset syntax is added as a seperate file,
    And the dataset is published in NVA by Sikt,
    And a publishing file request is created,
    And a DOI request is created.
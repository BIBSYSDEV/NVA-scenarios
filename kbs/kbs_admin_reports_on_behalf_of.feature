Feature: KBS Admin reports on behalf of (Local) Project Manager

  Background:
    Given a user logged in as KBS Admin

  Scenario: KBS Admin can mark that a KBS Candidate should report for KBS
    Given a KBS Candidate
    When the user marks the KBS Candidate as reportable
    Then the Project is a KBS Project
    And the Project is not a KBS Candidate

  Scenario: KBS Admin can mark that a KBS Candidate should not report for KBS
    Given a KBS Candidate
    When the user marks the KBS Candidate as not reportable
    Then the Project is not a KBS Project
    And the Project is not a KBS Candidate

  Scenario Outline: KBS Admin can provide missing KBS Metadata
    Given a KBS Project
    And the KBS Project has no value for <KBS Metadata>
    When the user edits the Project
    Then they can set a value for <KBS Metadata>

    Examples:
      | KBS Metadata             |
      | Recruitment Number       |
      | First Recruitment Date   |
      | Last Recruitment Date    |
      | Local Recruitment Number |

  Scenario Outline: KBS Admin can override KBS Metadata
    Given a KBS Project
    And the KBS Project has a value for <KBS Metadata>
    When the user edits the Project
    Then they can set a new value for <KBS Metadata>

    Examples:
      | KBS Metadata             |
      | Recruitment Number       |
      | First Recruitment Date   |
      | Last Recruitment Date    |
      | Local Recruitment Number |

  Scenario: KBS Admin cannot edit non KBS Metadata
    Given a KBS Project
    When the user edits the Project
    Then they cannot set new values for metadata unrelated to KBS reporting
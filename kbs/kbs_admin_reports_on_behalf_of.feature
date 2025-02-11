Feature: Report on behalf of (Local) Project Manager

  Background:
    Given a user logged in as KBS Admin

  Scenario Outline: KBS Admin should be able to decide if a Project is KBS Reportable
    Given a KBS Candidate
    When the user decide that the Project is <Status>
    Then the Project is <Status>

    Examples:
      | Status             |
      | KBS Reportable     |
      | not KBS Reportable |

  Scenario Outline: KBS Admin should be able to insert KBS Metadata
    Given a KBS Reportable Project
    When the user reports <KBS Metadata>
    Then <KBS Metadata> is saved

    Examples:
      | KBS Metadata            |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario Outline: KBS Admin should be able to override KBS Metadata
    Given a KBS Reportable Project
    And the Project Manager has reported <KBS Metadata>
    When the user reports <KBS Metadata>
    Then new <KBS Metadata> is saved

    Examples:
      | KBS Metadata            |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario: KBS Admin should not be able to edit non KBS Metadata
    Given a KBS Reportable Project
    When the user edits non KBS Metadata
    Then they are denied
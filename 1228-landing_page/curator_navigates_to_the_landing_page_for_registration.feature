Feature: Curator navigates to the Landing Page for Registration

  Scenario: Curator Approves a Publishing Request
    Given a Curator opens the Landing Page of a Registration
    And the Registration has a Publishing Request
    When they approve the Publishing Request
    Then the Registration is Published
    And all files are Published

  Scenario: Curator Rejects a Publishing Request
    Given a Curator opens the Landing Page of a Registration
    And the Registration has a Publishing Request
    When they reject the Publishing Request
    Then the Registration is "<RegistrationStatus>"
    And all files are "<FileStatus>"
    Examples:
      | Workflow                              | RegistrationStatus | FileStatus  |
      | Registrator can only publish metadata | Published          | Unpublished |
      | Only Curator can publish              | Draft              | Unpublished |

  Scenario: Curator Approves a DOI Request
    Given a Curator opens the Landing Page of a Registration
    And the Registration is Published
    And the Registration has a DOI Request
    When they approve the DOI Request
    Then the DOI is findable

  Scenario: Curator Rejects a DOI Request
    Given a Curator opens the Landing Page of a Registration
    And the Registration is Published
    And the Registration has a DOI Request
    When they reject the DOI Request
    Then the reserved DOI is removed from the Registration

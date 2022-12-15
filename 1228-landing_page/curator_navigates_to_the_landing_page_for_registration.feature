Feature: Curator navigates to the Landing Page for Registration

  Scenario: Curator Approves a Publishing Request
    Given a Curator opens the Landing Page of a Registration
    And the Registration has a Publishing Request
    When they approve the request
    Then the Registration is Published
    And all files are Published

  Scenario: Curator Rejects a Publishing Request
    Given a Curator opens the Landing Page of a Registration
    And the Registration has a Publishing Request
    When they reject the request
    Then the Registration is "<RegistrationStatus>"
    And all files are "<FileStatus>"
    Examples:
      | Workflow                              | RegistrationStatus | FileStatus  |
      | Registrator can only publish metadata | Published          | Unpublished |
      | Only Curator can publish              | Draft              | Unpublished |

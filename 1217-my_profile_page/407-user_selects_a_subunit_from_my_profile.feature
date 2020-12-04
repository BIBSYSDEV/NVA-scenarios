Feature: User selects a Subunit from My Profile

    @407
    Scenario: User selects a Subunit from My Profile
        Given user sees a Subunit from My Profile
        When they select a Subunit from the Subunit dropdown
        And they click on a subunit
        Then they see the new Institution and subunit in My Profile

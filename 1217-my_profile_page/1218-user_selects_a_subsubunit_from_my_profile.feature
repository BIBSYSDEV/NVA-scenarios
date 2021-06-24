Feature: User selects a Subsubunit from My Profile

    @test
    @1218
    Scenario: User selects a Subsubunit from My Profile
        Given user sees a Subsubunit from My Profile
        When they select a Subsubunit from the Subsubunit dropdown
        And they click Add
        Then they see the new Institution and Subunit and Subsubunit in My Profile

Feature: User sees a Subunit from My Profile

    @405
    Scenario: User sees a Subunit from My Profile
        Given User opens Add Institution from My Profile
        When they enter an Institution name
        And they select an Institution
        Then they see Subunit dropdown containing all the subunits at their Institution

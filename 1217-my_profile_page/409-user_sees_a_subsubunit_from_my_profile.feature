Feature: User sees a Subsubunit from My Profile

    @409
    Scenario: User sees a Subsubunit from My Profile
        Given they see a Subunit from My Profile
        When they click the Subunit dropdown
        Then they see a Subsubunit dropdown containing all the Subsubunits at their Subunit

Feature: User sees a Subsubunit from My Profile

    @409
    Scenario: User sees a Subsubunit from My Profile
        Given they see a Subunit from My Profile
        When they click the Subunit dropdown
        And they select a Subunit from the dropdown
        Then they see Subsubunit dropdown containing all the subsubunits for that subunit

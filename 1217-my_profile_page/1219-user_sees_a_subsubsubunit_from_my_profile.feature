Feature: User sees a Subsubsubunit from My Profile

    @1219
    Scenario: User sees a Subsubsubunit from My Profile
        Given they see a Subsubunit from My Profile
        And they select a Subsubunit from the Subsubunit dropdown
        And the see the Subsubsubunit dropdown
        When they click the Subsubsubunit dropdown
        Then they see a Subsubsubunit dropdown containing all the Subsubsubunits at their Subsubunit

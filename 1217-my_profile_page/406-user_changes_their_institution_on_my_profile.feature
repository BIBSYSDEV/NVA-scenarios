Feature: User changes their Institution on My Profile

    @406
    Scenario: User changes their Institution on My Profile
        Given that a User is logged in
        And they open My Profile
        And they see their Connected Institution
        When they click Edit Institution
        Then they see their Institution is selected inside the Institution dropdown
        And they see a Subunit dropdown with subunits for the selected Institution
        And they see a Save button
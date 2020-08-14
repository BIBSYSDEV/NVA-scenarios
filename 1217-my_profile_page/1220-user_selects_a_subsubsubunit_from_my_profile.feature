    @1220
    Scenario: User selects a Subsubsubunit from My Profile
        Given user sees a Subsubsubunit from My Profile
        When they select a Subsubsubunit from the Subsubsubunit dropdown
        And they click Save
        Then they see the Add Institution dialog is closed
        And they see the new Institution and Subunit and Subsubunit and Subsubsubunit in My Profile

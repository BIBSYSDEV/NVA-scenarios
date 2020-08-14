    @407
    Scenario: User selects a Subunit from My Profile
        Given user sees a Subunit from My Profile
        When they select a Subunit from the Subunit dropdown
        And they click Save
        Then they see the Add Institution dialog is closed
        And they see the new Institution and subunit in My Profile

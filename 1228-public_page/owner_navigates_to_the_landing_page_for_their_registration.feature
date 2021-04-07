Feature: Owner navigates to the Landing Page for their Registration

    @1231
    Scenario: Owner navigates to the Landing Page for their Published Registration without DOI
        Given that the Creator navigates to the Landing Page for Registration
        And they are the Owner of this Registration
        And the Registration has no DOI
        When they see the Status Bar
        Then they see buttons for "Request a DOI" and "Edit Registration"

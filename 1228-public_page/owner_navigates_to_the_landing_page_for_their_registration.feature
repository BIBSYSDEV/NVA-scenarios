Feature: Owner navigates to the Landing Page for their Registration

    @1231
    Scenario: Owner navigates to the Landing Page for their Published Registration without DOI
        Given that the Creator navigates to the Landing Page for a Registration
        And they are the Owner of the Registration
        And the Registration has no DOI
        When they see the Status Bar
        Then they see buttons for "Request a DOI" and "Edit Registration"

    Scenario: Owner navigates to the Landing Page for their Published Registration with validation errors
        Given that the Creator navigates to the Landing Page for a Registration
        And they are the Owner of the Registration
        When the Registration has validation errors
        Then they can see a list of all validation errors for the Registration
        And they can see a "Go back to schema" button
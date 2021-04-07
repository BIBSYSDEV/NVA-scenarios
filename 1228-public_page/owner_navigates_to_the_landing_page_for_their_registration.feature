Feature: Owner navigates to the Landing Page for their Registration

    @1231
    Scenario: Owner navigates to the Landing Page for their Published Registration without DOI
        Given that the Creator navigates to the Landing Page for a Registration
        And they are the Owner of the Registration
        And the Registration has no DOI
        When they see the Status Bar
        Then they see buttons for "Request a DOI" and "Edit Registration"

    Scenario: Owner navigates to the Landing Page for their Registration with Validation Errors
        Given that the Creator navigates to the Landing Page for a Registration
        And they are the Owner of the Registration
        And the Registration has Validation Errors
        When they see the Landing Page for the Registration
        Then they see a List of all Validation Errors for the Registration
        And they see a "Go back to schema" button

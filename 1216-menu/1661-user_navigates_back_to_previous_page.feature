Feature: User navigates back to previous page

    Scenario: User navigates back to previous page
        Given the user has navigated to any other page than home
        And they see a "Back" button
        When they click "Back"
        Then they are navigated back to their previous page
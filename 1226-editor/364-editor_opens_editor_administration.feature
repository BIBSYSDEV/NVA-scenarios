Feature: Editor opens Editor Administration

    @364
    Scenario: Editor opens Editor Administration
        Given that the user is logged in as Editor
        When they click the menu item Editor Administration
        Then they see the page Editor Administration
        And they see a field for Email
        And they see a Save Button that is enabled

    @xxx
    Scenario Outline: Editor sees fields for Vocabulary settings
        Given that the user is logged in as Editor
        And they click the menu item Editor
        And they see the Editor page
        When they see settings for "<Vocabulary>"
        Then they can toggle setting for "Default"
        And they can toggle setting for "Active"
        Examples:
            | Vocabulary    |
            | HRCS Activity |
            | HRCS Category |
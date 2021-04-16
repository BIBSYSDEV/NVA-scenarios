Feature: Editor opens Editor Administration

    @364
    Scenario: Editor opens Editor Administration
        Given that the user is logged in as Editor
        When they click the menu item Editor Administration
        Then they see the page Editor Administration
        And they see a field for Email
        And they see a Save Button that is enabled

    @2445
    Scenario Outline: Editor sees fields for Vocabulary settings
        Given Editor opens Editor Administration
        And they see Vocabulary settings
        Then they can set "<Vocabulary>" to be one of:
            | Disabled |
            | Allowed  |
            | Default  |
        And they see a Save Button
        Examples:
            | Vocabulary    |
            | HRCS Activity |
            | HRCS Category |
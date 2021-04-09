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
        And they see settings for Vocabularies
        Then they can set "<Vocabulary>" to be one of:
            | Disabled |
            | Allowed  |
            | Default  |
        And they see a Save Button
        Examples:
            | Vocabulary    |
            | HRCS Activity |
            | HRCS Category |

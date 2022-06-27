Feature: Editor decide on institutions Vocabulary settings

    In order to enable Registrators to use vocabulary
    As an Editor
    I want to see supported Vocabularys

    In order to enable Registrators to use vocabulary
    As an Editor
    I want to activate or hide supported Vocabularys

    Background:
        Given a logged in Editor

    @TEST_NP-4156
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

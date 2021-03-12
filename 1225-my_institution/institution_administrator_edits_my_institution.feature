Feature: Institution Administrator edits My Institution

    @360
    Scenario: Institution Administrator opens My Institution
        Given that the user is logged in as Institution Administrator
        When they click the menu item My Institution
        Then they see the My Institution page
        And they see fields:
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | Archive name                  |
            | Vocabularies                  |
        And they see the Save button

    @361
    Scenario: Institution Administrator edits My Institution
        Given that the user is logged in as Institution Administrator
        And they click the menu item My Institution
        And they see the My Institution page
        When they edit fields:
            | Display name       |
            | Short display name |
            | Archive name       |
            | Vocabularies       |
        And they click Save
        Then they see a Notification that the changes were saved

    @xxx
    Scenario Outline: Institution Administrator see fields for Vocabularies
        Given that the user is logged in as Institution Administrator
        And they click the menu item My Institution
        And they see the My Institution page
        When they see fields for "<Vocabulary>"
        Then they can toggle value for "Default"
        And they can toggle value for "Active"
        Examples:
            | Vocabulary    |
            | HRCS Activity |
            | HRCS Category |

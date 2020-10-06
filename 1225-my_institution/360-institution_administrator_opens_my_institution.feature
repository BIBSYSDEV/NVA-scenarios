Feature: Institution Administrator opens My Institution

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
        And they see the Save button
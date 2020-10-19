Feature: Institution Administrator edits My Institution

    @361
    Scenario: Institution Administrator edits My Institution
        Given that the user is logged in as Institution Administrator
        And they click the menu item My Institution
        When they edit fields:
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | Archive name                  |
            | Feide Organization ID         |
        And they click Save
        Then they see a Notification that the changes were saved

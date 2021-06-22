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
            | ROR ID                        |
        And they see the Save button

    @361
    Scenario: Institution Administrator edits My Institution
        Given Institution Administrator opens My Institution
        When they edit fields:
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | Archive name                  |
        And they click Save
        Then they see a Notification that the changes were saved

    @362
        Scenario: Institution Administrator views the Institutional Portal
        Given Institution Administrator opens My Institution
        When they visit the Institutional Portal
        Then they see the web address in their web browser is the CName + .nva.unit.no
        And they see the page title is the same as the Display Name on My Institution

    @575
    Scenario: Institution Administrator uploads a new Logo
        Given Institution Administrator opens My Institution
        When they click Upload Logo
        And they select an image from their computer
        And they click OK
        Then they see the Logo on My Institution page

Feature: Institution Administrator edits My Institution

    @TEST_NP-4147
    @test
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

    @TEST_NP-4146
    @test
    @361
    Scenario: Institution Administrator edits My Institution
        Given that the user is logged in as Institution Administrator
        And they click the menu item My Institution
        And they see the My Institution page
        When they edit fields:
            | Display name       |
            | Short display name |
            | Archive name       |
        And they click Save
        Then they see a Notification that the changes were saved

    @TEST_NP-4149
    @575
    Scenario: Institution Administrator uploads a new Logo
        Given Institution Administrator opens My Institution
        When they click Upload Logo
        And they select an image from their computer
        And they click OK
        Then they see the Logo on My Institution page
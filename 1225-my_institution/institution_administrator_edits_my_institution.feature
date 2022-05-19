Feature: Institution Administrator edits My Institution

    @TEST_NP-4147
    @test
    @360
    Scenario: Institution Administrator opens My Institution
        Given that the user is logged in as Institution Administrator
        When they click the menu item Basic Data
        And they click the menu item My Institution
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
        And they open My Institution
        When they edit fields:
            | Display name       |
            | Short display name |
            | Archive name       |
        And they click Save
        Then they see a Notification that the changes were saved

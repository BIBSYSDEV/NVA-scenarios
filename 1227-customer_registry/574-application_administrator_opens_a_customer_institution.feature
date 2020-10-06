Feature: Application Administrator opens a Customer Institution

    @574
    Scenario Outline: Application Administrator opens a Customer Institution
        Given that the user is logged in as Application Administrator
        When they open a Customer Institution
        Then they see fields:
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | Feide Organization ID         |
        And they see the Save button
        And they can add and remove Institution Administrator(s)

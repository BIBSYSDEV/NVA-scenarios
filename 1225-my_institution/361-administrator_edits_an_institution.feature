    @361
    Scenario: Administrator edits an Institution
        Given Administrator opens My Institution
        When they edit the fields
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | CNAME                         |
            | Institution DNS               |
        And they check Publications must be approved by Curator checkbox
        And they upload a new Logo
        Then they see a notification that the information was saved
        And they can visit the Institutional Portal

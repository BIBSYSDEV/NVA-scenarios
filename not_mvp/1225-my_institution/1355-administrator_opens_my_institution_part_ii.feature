Feature: Administrator opens My Institution (Part II)

    @1355
    Scenario: Administrator opens My Institution (Part II)
        Given that the user is logged in as Administrator
        When they click the menu item My Institution
        Then they see the My Institution page
        And they see fields:
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | CNAME                         |
            | Institution DNS               |
        And they see a button to Upload Logo
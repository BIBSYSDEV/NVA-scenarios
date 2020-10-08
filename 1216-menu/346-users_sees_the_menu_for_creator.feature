Feature: User sees the menu for Creator

    @346
    Scenario: User sees the menu for Creator
        Given that the user is logged in
        And they have the role of Creator
        When they look at any page in NVA
        Then they see a menu containing
            | My profile |
            | Log out    |
        And they see the buttons
            | New registration |
            | My registrations |
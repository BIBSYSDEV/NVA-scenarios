Feature: User sees the menu for Editor

    @349
    Scenario: User sees the menu for Editor
        Given that the user is logged in
        And they have the role of Editor
        When they look at any page in NVA
        Then they see a menu containing
            | My profile            |
            | Editor administration |
            | Log out               |
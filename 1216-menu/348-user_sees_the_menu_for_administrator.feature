Feature: User sees the menu for Institution-admin

    @348
    Scenario: User sees the menu for Institution-admin
        Given that the user is logged in
        And they have the role of Institution-admin
        When they look at any page in NVA
        Then they see a menu containing
            | My user profile |
            | Users           |
            | My institution  |
            | Log out         |

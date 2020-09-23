Feature: User sees the menu for Curator

    @347
    Scenario: User sees the menu for Curator
        Given that the user is logged in
        And they have the role of Curator
        When they look at any page in NVA
        Then they see a menu containing
            | My Profile  |
            | My Worklist |
            | Log Out     |
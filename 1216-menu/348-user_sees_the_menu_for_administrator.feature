    @348
    Scenario: User sees the menu for Administrator
        Given that the user is logged in
        And they have the role of Administrator
        When they look at any page in NVA
        Then they see a menu containing
            | My Profile          |
            | User administration |
            | My Institution      |
            | Log Out             |

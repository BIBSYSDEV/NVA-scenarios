Feature: User sees a menu when logged in

    @345
    Scenario: User sees a menu when logged in
        Given that the user is logged in
        And they have no NVA role
        When they look at any page in NVA
        Then they see a menu containing
            | My profile |
            | Log out    |

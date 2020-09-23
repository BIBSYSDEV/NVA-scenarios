Feature: User sees non-logged-in menu

    @344
    Scenario: User sees non-logged-in menu
        Given that the user is not logged in
        When they look at any page in NVA
        Then they see the Log in button

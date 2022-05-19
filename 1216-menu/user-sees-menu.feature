Feature: User sees menu

    @TEST_NP-4102
    @test
    @344
    Scenario: Unauthenticated User sees menu
        Given that the User is not logged in
        When they look at any page in NVA
        Then they see the Log in Button
        And they see the Language selector

    @TEST_NP-4100
    @test
    @345
    Scenario: User without any role sees menu
        Given that the user is logged in
        And they have no NVA role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My user profile |
            | Log out         |
        And they see the Language selector

    @TEST_NP-4103
    @test
    @346
    Scenario: User sees the menu for Creator
        Given that the user is logged in
        And they have the "Creator" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My Registrations |
            | My user profile  |
            | Log out          |
        And they see Menu items:
            | New Registration |
            | Messages         |
        And they see the Language selector

    @TEST_NP-4099
    @test
    @347
    Scenario: User sees the menu for Curator
        Given that the user is logged in
        And they have the "Curator" Role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My user profile |
            | Log out         |
        And they see Menu items:
            | Worklist |
            | Messages |
        And they see the Language selector

    @TEST_NP-4101
    @test
    Scenario: User sees the menu for Institution-admin
        Given that the user is logged in
        And they have the "Institution-admin" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | Users           |
            | My user profile |
            | Log out         |
        And they see Menu items:
            | Basic data |
        And they see the Language selector

    @TEST_NP-4105
    Scenario: User sees the menu for Editor
        Given that the user is logged in
        And they have the "Editor" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | Editor          |
            | My user profile |
            | Log out         |
        And they see the Language selector

    @TEST_NP-4104
    @test
    Scenario: User sees the menu for Application administrator
        Given that the user is logged in
        And they have the "App-admin" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My user profile |
            | Log out         |
        And they see Menu items:
            | Basic data |
        And they see the Language selector

Feature: User sees menu

    @test
    @344
    Scenario: Unauthenticated User sees menu
        Given that the User is not logged in
        When they look at any page in NVA
        Then they see the Log in Button
        And they see the Language selector

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

    @test
    @346
    Scenario: User sees the menu for Creator
        Given that the user is logged in
        And they have the "Creator" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My user profile |
            | Log out         |
        And they see Menu items:
            | New Registration |
            | My Registrations |
            | My Messages      |
        And they see the Language selector

    @test
    @347
    Scenario: User sees the menu for Curator
        Given that the user is logged in
        And they have the "Curator" Role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My worklist     |
            | My user profile |
            | Log out         |
        And they see Menu items:
            | My messages |
        And they see the Language selector

    @test
    @348
    Scenario: User sees the menu for Institution-admin
        Given that the user is logged in
        And they have the "Institution-admin" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | My institution  |
            | Users           |
            | My user profile |
            | Log out         |
        And they see the Language selector

    @349
    Scenario: User sees the menu for Editor
        Given that the user is logged in
        And they have the "Editor" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | Editor administration |
            | My user profile       |
            | Log out               |
        And they see the Language selector

    @test
    @350
    Scenario: User sees the menu for Application administrator
        Given that the user is logged in
        And they have the "App-admin" role
        When they look at any page in NVA
        Then they see a Dropdown Menu with items:
            | Institutions    |
            | My user profile |
            | Log out         |
        And they see the Language selector

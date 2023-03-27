Feature: User opens a Resarch Profile from a Landing Page for Publication

    @TEST_NP-4124
    @test
    Scenario: User opens a Research Profile from a Landing Page for Publication
        Given the User views a Landing Page for a Publication
        When they click a Contributor
        Then they see the Contributor's Resarch Profile page

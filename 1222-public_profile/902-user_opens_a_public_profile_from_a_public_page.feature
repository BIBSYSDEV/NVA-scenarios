Feature: User opens a Public Profile from a Public Page for Publication

    @902
    Scenario: User opens a Public Profile from a Public Page for Publication
        Given the Creator publishes Publication
        When they click a Contributor
        Then they see the Contributor's public profile page

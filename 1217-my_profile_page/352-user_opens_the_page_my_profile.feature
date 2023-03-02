Feature: User opens the page My Profile

  Background:
    Given a User has logged in
    And the User opens My Profile

    @TEST_NP-4108
    @test
    @352
    Scenario: User opens the page My Profile
        When they select User profile
        Then they see their Profile page which includes information for
            | Real name     |
            | Feide ID      |
            | Email         |
            | ORCID         |
            | Roles         |
            | Organizations |
            | Language      |

    Scenario: User view Resources where they are a validated contributor
        When the User selects Registrations
        Then the User see their Registrations

        And the User may filter on following
            | Draft                |
            | For approval         |
            | Published            |
            | Contributor          |
            | Former registrations |
            | Age of registrations |

    Scenario: User view Resources under work
        When the User selects the Draft filter under Registrations
        Then the User see registrations that is not Published

    Scenario: User view Resources in Publication workflow
        When the User selects the For approval filter under Registrations
        Then the User see registrations that is in the Publication workflow

    Scenario: User view Published Resources
        When the User selects the Published filter under Registrations
        Then the User see registrations that is Published

    Scenario: User view Resources where they are a validated contributor
        When the User selects the Contributor filter under Registrations
        Then the User see registrations where thay are a validated contributor

    @DoNotImplementYet
    Scenario: User view Resources where they are former owners
        When the User selects the Former registrations under Registrations
        Then the User see registrations that thay have owned

    Scenario: User view Resources from a spesific age
        Given the default age is 2 years from current date
        When the User selects some filters under Registrations
        And delimits the registrations to a spesific age
        Then the User see validated registrations

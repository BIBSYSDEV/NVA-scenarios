Feature: Creator navigates to the Reference tab and selects Reference type "Contribution to journal"

    @274
    Scenario: Creator navigates to the Reference tab and selects Reference type "Contribution to journal"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        Then they see a list of subtypes:
            | Journal article      |
            | Short communication  |
            | Letter to the Editor |
            | Book review          |
            | Editorial            |
            | Corrigendum          |
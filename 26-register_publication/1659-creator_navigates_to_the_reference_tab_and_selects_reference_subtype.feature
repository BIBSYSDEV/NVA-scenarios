Feature: Creator navigates to the Reference tab and selects Reference subtype

    @1625
    Scenario: Creator navigates to the Reference tab and selects Reference subtype
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select one of Reference subtypes:
            | Short communication  |
            | Letter to the Editor |
            | Book review          |
            | Editorial            |
        Then they see mandatory fields:
            | Search box for Journal |
        And they see optional fields:
            | DOI            |
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
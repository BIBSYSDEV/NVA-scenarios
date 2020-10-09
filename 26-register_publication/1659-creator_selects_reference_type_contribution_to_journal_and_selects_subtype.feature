Feature: Creator selects Reference type Contribution to journal and selects subtype

    @1659
    Scenario: Creator sees fields related to Reference subtypes for "Contribution to journal"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select one of Reference subtypes:
            | Short communication  |
            | Letter to the Editor |
            | Book review          |
            | Editorial            |
        Then they see fields:
            | Search box for Journal |
            | DOI                    |
            | Volume                 |
            | Issue                  |
            | Pages from             |
            | Pages to               |
            | Article number         |
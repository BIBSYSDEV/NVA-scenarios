Feature: Creator selects Reference type Contribution to journal and selects subtype

    Scenario: Creator sees fields for Reference subtypes for "Contribution to journal"
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

    Scenario: Creator sees that fields are validated for Reference subtypes for "Contribution to journal"
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select one of Reference subtypes:
            | Short communication  |
            | Letter to the Editor |
            | Book review          |
            | Editorial            |
        And they enter "asd" in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Required field" error messages for fields:
            | Search box for Journal |
        And they can see "Invalid format" error message for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
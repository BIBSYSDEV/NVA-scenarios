Feature: Creator selects Reference type Contribution to journal and selects subtype Journal article

    Scenario: Creator sees fields for Reference subtype "Journal article"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Journal article"
        And they see fields:
            | Search-box for Journal |
            | DOI                    |
            | Volume                 |
            | Issue                  |
            | Pages from             |
            | Pages to               |
            | Article number         |
            | Peer reviewed          |

    Scenario: Creator sees that fields for Reference subtype "Journal article" are validated
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Journal article"
        And they enter "asd" in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Required field" error message for fields:
            | Search box for Journal |
        And they can see "Invalid format" error message for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
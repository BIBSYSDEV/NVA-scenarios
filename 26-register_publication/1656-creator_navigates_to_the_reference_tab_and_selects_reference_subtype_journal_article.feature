Feature: Creator navigates to the Reference tab and selects Reference subtype "Journal article"

    @1625
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Journal article"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Journal article"
        Then they see mandatory fields:
            | Search-box for Journal |
            | Peer reviewed          |
        And they see optional fields:
            | DOI            |
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
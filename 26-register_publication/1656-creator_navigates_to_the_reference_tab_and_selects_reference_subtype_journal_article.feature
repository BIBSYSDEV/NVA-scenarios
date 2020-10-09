Feature: Creator navigates to the Reference tab and selects Reference subtype "Journal article"

    @1625
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Journal article"
        Given that a Creator navigates to the Reference tab
        And they have selected "Contribution to journal" as Reference type
        When they select "Journal article" as Reference Subtype
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
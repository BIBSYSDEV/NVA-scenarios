Feature: Creator navigates to the Reference tab and selects Reference subtype "Corrigendum"

    @1625
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Corrigendum"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Corrigendum"
        Then they see mandatory fields:
            | Search box for "Journal article" |
        And they see optional fields:
            | DOI            |
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        And they see a disabled field for Journal based on selected Journal article
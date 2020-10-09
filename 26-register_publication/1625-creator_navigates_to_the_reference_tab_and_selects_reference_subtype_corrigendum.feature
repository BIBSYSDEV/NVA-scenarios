Feature: Creator selects Reference type Contribution to journal and selects subtype Corrigendum

    Scenario: Creator can see fields related to Reference subtype "Corrigendum"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Corrigendum"
        Then they see fields:
            | Search box for "Journal article" |
            | DOI                              |
            | Volume                           |
            | Issue                            |
            | Pages from                       |
            | Pages to                         |
            | Article number                   |
        And they see a disabled field for Journal based on selected Journal article

    Scenario: Creator see that fields for "Corrigendum" subtype are validated
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Corrigendum"
        When they save Publication without entering any data for "Corrigendum"
        Then they can see error messages for mandatory fields:
            | Search box for "Journal article" |
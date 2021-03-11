Feature: Creator selects Reference type Other publication and selects subtype Other publication

    @1633
    Scenario: Creator selects Reference type "Other publication" and selects subtype "Other publication"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Resource Type tab
        And they select the Reference type "Other publication"
        And they select the subtype "Other publication"
        Then they see fields
            | Original version            |
            | Search box for Published in |
            | Search box for Publisher    |
            | Pages from                  |
            | Pages to                    |
            | Total number of pages       |

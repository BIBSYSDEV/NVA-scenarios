Feature: Creator selects Reference type Other publication and selects subtype Feature article

    @1669
    Scenario: Creator selects Reference type "Other publication" and selects subtype "Feature article"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Other publication"
        And they select the subtype "Feature article"
        Then they see fields
            | Original version            |
            | Search box for Published in |
            | Volume                      |
            | Issue                       |
            | Pages from                  |
            | Pages to                    |

Feature: Creator selects Reference type "Other publication" and selects subtype "Map"

    @1631
    Scenario: Creator selects Reference type "Other publication" and selects subtype "Map"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Other publication"
        And they select the subtype "Map"
        Then they see fields
            | Search box for Publisher |
            | DOI                      |
            | Volume                   |
            | Issue                    |
            | Pages from               |
            | Pages to                 |
            | Original version         |
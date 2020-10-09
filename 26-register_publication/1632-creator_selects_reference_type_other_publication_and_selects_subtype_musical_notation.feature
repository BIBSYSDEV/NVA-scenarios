Feature: Creator selects Reference type Other publication and selects subtype Musical notation

    @1632
    Scenario: Creator selects Reference type "Other publication" and selects subtype "Musical notation"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Other publication"
        And they select the subtype "Musical notation"
        Then they see fields
            | Search box for Publisher |
            | Original version         |
            | Pages from               |
            | Pages to                 |
            | ISMN                     |

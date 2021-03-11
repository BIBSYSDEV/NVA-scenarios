Feature: Creator navigates to the Resource Type tab and selects Reference type Other publication

    @1624
    Scenario: Creator navigates to the Resource Type tab and selects Reference type "Other publication"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Resource Type tab
        And they select the Reference type "Other publication"
        Then they see a list of subtypes:
            | Feature article   |
            | Map               |
            | Musical notation  |
            | Other publication |

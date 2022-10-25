Feature: Creator selects Resource type Other publication

    @TEST_NP-4066
    @1624
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Other publication"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Other publication"
        Then they see a list of subtypes:
            | Map               |
            | Other publication |

    @TEST_NP-4069
    @1631
    Scenario: Creator selects Resource type "Other publication" and selects subtype "Map"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Other publication"
        And they select the subtype "Map"
        Then they see fields:
            | Search box for Publisher |

    @TEST_NP-4068
    @1633
    Scenario: Creator selects Resource type "Other publication" and selects subtype "Other publication"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Other publication"
        And they select the subtype "Other publication"
        Then they see fields:
            | Original version            |
            | Search box for Published in |
            | Search box for Publisher    |
            | Pages from                  |
            | Pages to                    |
            | Total number of pages       |

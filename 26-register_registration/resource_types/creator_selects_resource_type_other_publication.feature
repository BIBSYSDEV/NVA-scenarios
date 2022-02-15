Feature: Creator selects Resource type Other publication

    @TEST_NP-4066
    @1624
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Other publication"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Other publication"
        Then they see a list of subtypes:
            | Feature article   |
            | Map               |
            | Musical notation  |
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
            | Original version         |

    @TEST_NP-4067
    @1632
    Scenario: Creator selects Resource type "Other publication" and selects subtype "Musical notation"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Other publication"
        And they select the subtype "Musical notation"
        Then they see fields:
            | Search box for Publisher |
            | Original version         |
            | Pages from               |
            | Pages to                 |
            | ISMN                     |

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

    @TEST_NP-4016
    @1669
    Scenario: Creator selects Resource type "Other publication" and selects subtype "Feature article"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Other publication"
        And they select the subtype "Feature article"
        Then they see fields:
            | Original version            |
            | Search box for Published in |
            | Volume                      |
            | Issue                       |
            | Pages from                  |
            | Pages to                    |

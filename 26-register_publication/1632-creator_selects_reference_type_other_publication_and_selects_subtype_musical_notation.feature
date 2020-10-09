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
            | DOI                      |
            | Volume                   |
            | Issue                    |
            | Pages from               |
            | Pages to                 |
            | ISMN                     |

        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select a Reference Type — Other publication
        And they select Publication Subtype
            | Musical notation |
        Then they see the Search box for "Publisher"
        And they see fields for
            | Original version |
            | Page from        |
            | Page to          |
            | ISMN             |


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

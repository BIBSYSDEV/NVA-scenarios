Feature: Creator selects Reference type Student thesis and selects subtype

    Scenario: Creator sees fields for Reference subtypes for "Student thesis"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Student thesis"
        And they select one of Reference subtypes:
            | Bachelor thesis    |
            | Master thesis      |
            | Doctoral thesis    |
            | Other student work |
        Then they see fields:
            | Search box for Publisher |
            | DOI                      |
            | Search box for Series    |

    Scenario: Creator sees that fields are validated for Reference subtypes for "Student thesis"
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Student thesis"
        And they select one of Reference subtypes:
            | Bachelor thesis    |
            | Master thesis      |
            | Doctoral thesis    |
            | Other student work |
        When they click the Save button
        Then they can see "Required field" error messages for fields:
            | Search box for Publisher |
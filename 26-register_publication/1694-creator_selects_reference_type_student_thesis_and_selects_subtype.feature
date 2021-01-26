Feature: Creator selects Reference type Student thesis and selects subtype

    Scenario Outline: Creator sees fields for Reference subtypes for "Student thesis"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Student thesis"
        And they select "<Subtype>":
        Then they see fields:
            | Search box for Publisher |
            | DOI                      |
            | Search box for Series    |

    Scenario Outline: Creator sees that fields are validated for Reference subtypes for "Student thesis"
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Student thesis"
        And they select "<Subtype>":
        When they click the Save button
        Then they can see "Required field" error messages for fields:
            | Search box for Publisher |

        Examples:
            | Subtype            |
            | Bachelor thesis    |
            | Master thesis      |
            | Doctoral thesis    |
            | Other student work |

Feature: Creator selects Resource type Degree

    @394
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Student thesis"
        Then they see a list of subtypes:
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Other student thesis |

    @1694
    Scenario Outline: Creator sees fields for Resource subtypes for "Student thesis"
        Given Creator begins registering a Registration in the Wizard with a Link
        When they navigate to the Resource Type tab
        And they select the Resource type "Student thesis"
        And they select the Subtype "<Subtype>":
        Then they see fields:
            | Search box for Publisher |
            | DOI                      |
            | Search box for Series    |
        Examples:
            | Subtype              |
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Other student thesis |

    Scenario Outline: Creator sees that fields are validated for Resource subtypes for "Student thesis"
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Student thesis"
        And they select the Subtype "<Subtype>":
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Publisher |
        Examples:
            | Subtype              |
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Other student thesis |

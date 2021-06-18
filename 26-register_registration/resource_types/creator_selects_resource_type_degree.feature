Feature: Creator selects Resource type Degree

    @394
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Student thesis"
        Then they see a list of subtypes:
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Other student thesis |

    @1694
    Scenario Outline: Creator sees fields for Resource subtypes for "Student thesis"
        Given Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
        When they select the Subtype "<Subtype>"
        Then they see fields:
            | Search box for Publisher |
            | DOI                      |
            | Total pages              |
        Examples:
            | Subtype              |
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Other student thesis |

    Scenario: Creator sees that fields are validated for Resource subtypes for "Student thesis"
        Given Creator sees fields for Resource subtypes for "Student thesis"
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Publisher |

    @2776
    Scenario: Creator sees series fields for Resource subtypes "Doctoral thesis"
        Given Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
        When they select the Subtype "Doctoral thesis"
        Then they see fields:
            | Search box for Series |
            | Series number         |

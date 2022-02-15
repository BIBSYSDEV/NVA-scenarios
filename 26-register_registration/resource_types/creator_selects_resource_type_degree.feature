Feature: Creator selects Resource type Degree

    @TEST_NP-4062
    @test
    @394
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Student thesis"
        Then they see a list of subtypes:
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Licentiate thesis    |
            | Other student thesis |

    @TEST_NP-4064
    @test
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

    @TEST_NP-4063
    @test
    Scenario: Creator sees that fields are validated for Resource subtypes for "Student thesis"
        Given Creator sees fields for Resource subtypes for "Student thesis"
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Publisher |

    @TEST_NP-4061
    @test
    @2776
    Scenario Outline: Creator sees series fields for Resource subtypes "Doctoral thesis" and "Licentiate thesis"
        Given Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
        When they select the Subtype "<DegreeType>"
        Then they see fields:
            | Search box for Series |
            | Series number         |
            | ISBN                  |
        Examples:
            | DegreeType        |
            | Doctoral thesis   |
            | Licentiate thesis |

Feature: Creator selects Resource type Report

    @test
    @393
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Report"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Report"
        Then they see a list of subtypes:
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |

    @test
    @1693
    Scenario Outline: Creator sees fields for Resource subtypes for "Report"
        Given Creator navigates to the Resource Type tab and selects Resource type "Report"
        When they select the Subtype "<Subtype>"
        Then they see fields:
            | Search box for Publisher |
            | ISBN                     |
            | Total number of pages    |
            | Search box for Series    |
            | Series number            |
        Examples:
            | Subtype              |
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |

    @test
    Scenario Outline: Creator sees that fields are validated for Resource subtypes for "Report"
        Given Creator sees fields for Resource subtypes for "Report"
        And they have selected the Subtype "<Subtype>"
        When they enter an invalid value in fields:
            | ISBN                  |
            | Total number of pages |
        Then they can see the "Invalid ISBN" error message
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Publisher |
        And they can see "Invalid format" error messages for fields:
            | Total number of pages |
        Examples:
            | Subtype              |
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |

Feature: Creator selects Resource type Report

    @393
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Report"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Report"
        Then they see a list of subtypes:
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |

    @1693
    Scenario Outline: Creator sees fields for Resource subtypes for "Report"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Report"
        And they select the Subtype "<Subtype>":
        Then they see fields:
            | Search box for Publisher |
            | ISBN                     |
            | Total number of pages    |
            | Search box for Series    |
        Examples:
            | Subtype              |
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |

    Scenario Outline: Creator sees that fields are validated for Resource subtypes for "Report"
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Report"
        And they select the Subtype "<Subtype>":
        And they enter an invalid value in fields:
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

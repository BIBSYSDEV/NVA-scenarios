Feature: Creator selects Reference type Report and selects subtype

    Scenario Outline: Creator sees fields for Reference subtypes for "Report"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Report"
        And they select the subtype "<Subtype>":
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


    Scenario Outline: Creator sees that fields are validated for Reference subtypes for "Report"
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Report"
        And they select the subtype "<Subtype>":
        And they enter an invalid value in fields:
            | ISBN                  |
            | Total number of pages |
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Publisher |
        And they can see the "Invalid ISBN" error message
        And they can see "Invalid format" error message for fields:
            | Total number of pages |
        Examples:
            | Subtype              |
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |

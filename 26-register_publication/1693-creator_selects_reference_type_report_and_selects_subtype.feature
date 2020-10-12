Feature: Creator selects Reference type Report and selects subtype

    Scenario: Creator sees fields for Reference subtypes for "Report"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Report"
        And they select one of Reference subtypes:
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |
        Then they see fields:
            | Search box for Publisher |
            | ISBN                     |
            | Total number of pages    |
            | Search box for Series    |

    Scenario: Creator sees that fields are validated for Reference subtypes for "Report"
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Report"
        And they select one of Reference subtypes:
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of report |
        And they enter "asd" in fields:
            | ISBN                  |
            | Total number of pages |
        When they click the Save button
        Then they can see "Required field" error messages for fields:
            | Search box for Publisher |
        And they can see "Invalid format" error message for fields:
            | ISBN                  |
            | Total number of pages |
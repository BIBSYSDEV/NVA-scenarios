Feature: Creator navigates to the Reference tab and selects Reference type Report

    Scenario: Creator navigates to the Reference tab and selects Reference type "Report"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Report"
        Then they see a list of subtypes:
            | Research report      |
            | Policy report        |
            | Working paper        |
            | Other type of Report |
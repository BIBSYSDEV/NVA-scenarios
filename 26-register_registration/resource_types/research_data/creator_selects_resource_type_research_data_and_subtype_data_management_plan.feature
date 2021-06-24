Feature: Creator selects Resource type Research Data and Subtype Data Management Plan

    Scenario: Creator sees fields for Data Management Plan
        Given Creator navigates to the Resource Type tab and selects Resource type "Research Data"
        When they select the Resource Subtype "Data Management Plan"
        And they see fields:
            | Publisher |

    Scenario: Creator sees fields for Data Management Plan subtype with associated Project
        Given Creator sees fields for Data Management Plan subtype
        When the Registration has an associated Project
        Then they see the associated Projects listed
        And they see a checkbox for each Financing of the associated Projects
        And they see a search field for related resources

    Scenario: Creator selects a related resource for a Data Management Plan
        Given Creator sees fields for Data Management Plan subtype with associated Project
        When they select a resource from the resource search field
        Then the selected resource is listed below
        And the selected resource has a Remove Button
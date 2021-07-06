Feature: Creator selects Resource type Research Data and Subtype Data Management Plan

    @2851
    Scenario: Creator sees fields for Data Management Plan subtype
        Given Creator navigates to the Resource Type tab and selects Resource type "Research Data"
        When they select the Resource Subtype "Data Management Plan"
        And they see fields:
            | Publisher |

    @2852
    Scenario: Creator sees fields for Data Management Plan subtype with associated Project
        Given Creator sees fields for Data Management Plan subtype
        When the Registration has an associated Project
        Then they see the associated Projects listed
        And they see a checkbox for each Financing of the associated Projects
        And they see a search field for related Registrations

    @xxx
    Scenario: Creator searches for related Registrations
        Given Creator sees fields for Data Management Plan subtype with associated Project
        When they enter a string in the search field
        Then they see a list of Registrations where the search matches either of the Registrations':
            | Title        |
            | Contributors |

    @2853
    Scenario: Creator selects a related Registration for a Data Management Plan
        Given Creator searches for related Registrations
        When they select a Registration from the search field
        Then the selected Registration is shown in list of related Registrations
        And the Registration has a Remove Button

Feature: Creator selects Resource type Research Data and Subtype Data Management Plan

    @2851
    Scenario: Creator sees fields for Data Management Plan subtype
        Given Creator navigates to the Resource Type tab and selects Resource type "Research Data"
        When they select the Resource Subtype "Data Management Plan"
        And they see fields:
            | Search for Publisher             |
            | Search for related Registrations |

    @2899
    Scenario: Creator searches for related Registrations
        Given Creator sees fields for Data Management Plan subtype
        When they enter a string in the Search for related Registrations field
        Then they see a list of Published Registrations where the search matches either of the Registrations':
            | Title        |
            | Contributors |

    @2853
    Scenario: Creator selects a related Registration for a Data Management Plan
        Given Creator searches for related Registrations
        When they select a Registration from the Search for related Registrations field
        Then the selected Registration is shown in list of related Registrations
        And they see the listed Registrations':
            | Title        |
            | Contributors |
        And each listed Registration has a Remove Button

    @2900
    Scenario: Creator sees fields for Data Management Plan subtype without associated Projects
        Given Creator sees fields for Data Management Plan subtype
        When the Registration doesn't have any associated Projects
        Then they see a message that the Registration must have an associated Project in order to add Financing

    @2852
    Scenario: Creator sees fields for Data Management Plan subtype with associated Project
        Given Creator sees fields for Data Management Plan subtype
        When the Registration has an associated Project
        Then they see a list with associated Projects
        And they see a checkbox for each Financing of the associated Projects

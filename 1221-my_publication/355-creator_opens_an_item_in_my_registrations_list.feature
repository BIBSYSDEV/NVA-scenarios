Feature: Creator opens an item in My Registratons list

    @test
    @355
    Scenario: Creator opens an item in My Registrations list
        Given that the user is logged in as Creator
        And is on the page My Registrations
        When they click Edit on an item
        Then they see the item is opened in the Wizard
        And they see the Description tab
        And they see fields:
            | Title                        |
            | Abstract                     |
            | Description                  |
            | Date published               |
            | Primary language for content |

    Scenario: Creator sees Validation Errors for Registration
        Given that the user is logged in as Creator
        And they are on the page My Registrations
        And they see a List of Registrations
        When they click Edit on a Registration
        And they see the Registration is opened in Edit Mode
        And they see the Registration has Validation Errors
        Then they see a List of all Validation Errors
        And they see that tabs with Validation Errors are marked with an Error Icon

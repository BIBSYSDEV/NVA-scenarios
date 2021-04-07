Feature: Creator opens an item in My Registratons list

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

    Scenario: Creator sees validation errors for Registration
        Given that the user is logged in as Creator
        And they are on the page My Registrations
        When they click Edit on a Registration
        And the Registration has validation errors
        Then they see a list of all validation errors
        And they see that tabs with validation errors are marked with an error icon
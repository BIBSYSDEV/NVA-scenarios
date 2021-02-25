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
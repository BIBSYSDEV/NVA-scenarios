Feature: Application Administrator adds an API Key

    @2334
    Scenario: Application Administrator adds an API Key for an Institution
        Given Application Administrator views an API Key Configuration for an Institution
        And they see a value for Name in Organization Registry
        And they see the section Access Rights with checkboxes:
            | Read          |
            | Create/Update |
            | Delete        |
        And they see the section Key is empty
        And they see the section Contact Persons with the "Add Person" Button
        When they click the "Save" Button
        Then they see a Notification that the API Key is saved
        And they see that the "Read" checkbox for Access Rights is checked
        And they see that the section Key has a "Show Key" Button
        And they see that the section Key has an "Inactive Key" Checkbox

    @2335
    Scenario: Application Administrator views an API Key for an Institution
        Given Application Administrator adds an API Key for an Institution
        When they click "Show Key"
        Then they see the Key
        And they see the "Copy Key" Button
        And they see the "Rotate Key" Button

    @2336
    Scenario: Application Administrator rotates an API Key for an Institution
        Given Application Administrator views an API Key for an Institution
        When they click "Rotate Key"
        Then they see that the Key has a new value
        And they see a Notification that the Key was rotated

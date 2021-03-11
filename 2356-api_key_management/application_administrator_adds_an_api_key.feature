Feature: Application Administrator adds an API key

    @2334
    Scenario: Application Administrator adds an API key for an Institution
        Given Application Administrator views an API Key Configuration for an Institution
        And they see a value for Name in Organization Registry
        And they see the section Access Rights with checkboxes:
            | Read          |
            | Create/Update |
            | Delete        |
        And they see the section Key is empty
        And they see the section Contact Persons with the "Add Person" Button
        When they click the "Save" Button
        Then they see a Notification that the API key is saved
        And they see that the "Read" checkbox for Access Rights is checked

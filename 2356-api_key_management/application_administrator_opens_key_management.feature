Feature: Application Administrator opens Key Management

    @2332
    Scenario: Application Administrator opens Key Management
        Given that the user is logged in as Application Administrator
        When they click the menu item Key Management
        Then they see the page Key Management
        And they see a table of all Keys related to all Institutions
        And they see fields:
            | Institution   |
            | Modified Date |
            | Access Rights |
            | Active        |
        And they see the "Create Key" Button is enabled
        And they see the "Open" Button is enabled for each Key
        And they see the "Delete" Button is enabled for each Key

    @2333
    Scenario: Application Administrator views an API Key Configuration for an Institution
        Given Application Administrator opens Key Management
        When they click the "Open" Button for an Institution
        Then they see the the page API Key Configuration for that Institution
        And they see sections:
            | Name in Organization Registry |
            | Access Rights                 |
            | Key                           |
            | Contact Persons               |
        And they see the "Save" Button is enabled

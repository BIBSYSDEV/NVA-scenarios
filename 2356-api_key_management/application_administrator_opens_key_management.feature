Feature: Application Administrator opens Key Management

    @TEST_NP-4206
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

    @TEST_NP-4215
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

    @TEST_NP-4216
    Scenario: Application Administrator views the Contact Persons section
        Given Application Administrator views an API Key Configuration for an Institution
        Then they see the Contact Persons section
        And they see a List of Contact Persons with fields:
            | Username |
            | Name     |
        And they see the "Remove User" Button for each Contact Person
        And they see the "New Contact Person" Button

    @TEST_NP-4219
    @2378
    Scenario: Application Administrator adds Contact Person to an API Key Configuration for an Institution
        Given Application Administrator views the Contact Persons section
        And they click the "New Contact Person" Button
        And they see the Search Box for Users connected to that Institution
        And they see the "Add Contact Person" Button
        When they Search and Select a User
        And they click the "Add Contact Person" Button
        Then they see the List of Contact Persons is updated with that User
        And they see a Notification that the User was added as a Contact Person
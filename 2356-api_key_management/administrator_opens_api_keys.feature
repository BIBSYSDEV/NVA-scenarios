Feature: Administrator opens API Keys

    @TEST_NP-4218
    @2337
    Scenario: Administrator opens API Keys for an Institution
        Given that the user is logged in as Administrator
        When they click the menu item API Keys
        Then they see the page API Keys
        And they see a table of all API Key Items related to their Institution
        And they see fields:
            | Modified Date |
            | Access Rights |
            | Active        |
        And they see the "More information" Button is enabled

    @TEST_NP-4207
    @2338
    Scenario: Administrator expands an API Key Item
        Given Administrator opens API Keys for an Institution
        When they click the "More information" Button
        Then they see sections:
            | Key             |
            | Contact Persons |
        And they see the "Save" Button is enabled

    @TEST_NP-4212
    Scenario: Administrator views the Key section
        Given Administrator expands an API Key Item
        Then they see the Key section
        And they see the "Show Key" Button

    @TEST_NP-4208
    Scenario: Administrator views the Contact Persons section
        Given Administrator expands an API Key Item
        Then they see the Contact Persons section
        And they see a List of Contact Persons with fields:
            | Username |
            | Name     |
        And they see the "Remove User" Button for each Contact Person
        And they see the "New Contact Person" Button

    @TEST_NP-4209
    @2339
    Scenario: Administrator views an API Key
        Given Administrator views the Key section
        When they click the "Show Key" Button
        Then they see the Key
        And they see the "Copy Key" Button
        And they see the "Rotate Key" Button

    @TEST_NP-4217
    @2340
    Scenario: Administrator rotates an API Key
        Given Administrator views an API Key
        When they click the "Rotate Key" Button
        Then they see that the Key has a new value
        And they see a Notification that the Key was rotated

    @TEST_NP-4213
    @2377
    Scenario: Administrator adds Contact Person to API Key Item
        Given Administrator views the Contact Persons section
        And they click the "New Contact Person" Button
        And they see the Search Box for Users connected to their Institution
        And they see the "Add Contact Person" Button
        When they Search and Select a User
        And they click the "Add Contact Person" Button
        Then they see the List of Contact Persons is updated with that User
        And they see a Notification that the User was added as a Contact Person
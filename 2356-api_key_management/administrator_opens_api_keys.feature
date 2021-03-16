Feature: Administrator opens API Keys

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

    @2338
    Scenario: Administrator expands an API Key Item
        Given Administrator opens API Keys for an Institution
        When they click the "More information" Button
        Then they see sections:
            | Key             |
            | Contact Persons |
        And they see the "Save" Button is enabled

    @2339
    Scenario: Administrator views an API Key
        Given Administrator expands an API Key item
        And they see the section Key with the "Show Key" Button
        When they click the "Show Key" Button
        Then they see the Key
        And they see the "Copy Key" Button
        And they see the "Rotate Key" Button

    @2340
    Scenario: Administrator rotates an API Key
        Given Administrator views an API Key
        When they click the "Rotate Key" Button
        Then they see that the Key has a new value
        And they see a Notification that the Key was rotated
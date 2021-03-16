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
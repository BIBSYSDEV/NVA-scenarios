Feature: User sees published Registrations

    @913
    Scenario: User sees published Registrations
        Given Creator opens the page My Registrations
        When they click Published Registrations in the navigation bar
        Then they see a list of all published Registrations with the fields
            | Title      |
            | Status     |
            | Created    |
        And they see list items with Status
            | Deleted   |
            | Published |
        And they see each list item has buttons
            | Show   |
            | Edit   |
            | Delete |
        And the they see the Edit button is enabled
        And the Delete button is enabled for Registrations not marked as Deleted
        And they see the navigation bar for Unpublished Registrations is enabled
        And they see the navigation bar for Published Registrations is selected

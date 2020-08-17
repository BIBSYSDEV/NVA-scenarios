    @364
    Scenario: Editor opens Editor Administration
        Given that the user is logged in as Editor
        When they click the menu item Editor Administration
        Then they see the page Editor Administration
        And they see a field for Email
        And they see a Save Button that is enabled

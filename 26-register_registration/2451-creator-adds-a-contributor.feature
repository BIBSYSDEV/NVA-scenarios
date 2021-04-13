Feature: Creator adds a Contributor

    Scenario: Creator opens the add Contributor Dialog
        Given Creator navigates to Contributors tab
        When they click "Add Contributor"
        Then they see the "Add Contributor" Dialog
        And they see a dropdown with Contributor types:
            # Note: Contributor types that are required for the actual Registration
            #       type can be omitted since they are covered by other Scenarios
            | Contact person |
            | Editor         |
            | Related person |
            | Researcher     |
            | Rights holder  |
            | Supervisor     |
            | Other          |
        And they see a "Close" Button
        And they see a "Create new Contributor" Button
        And they see a "Add me as Contributor" Button
        And they see a disabled "Add" Button

    Scenario: Creator selects a Contributor type
        Given Creator opens the add Contributor Dialog
        When they select a Contributor type
        Then they see a search field

    Scenario: Creator searches for a Contributor
        Given Creator selects a Contributor type
        When they enter a search term
        Then they see a list of Contributors matching the search term
        And they see a text with number of hits and the search term
        And they see previous Publications by the Contributors
        And they see the primary Institution for the Contributors

    Scenario: Creator selects a Contributor from search
        Given Creator searches for a Contributor
        When they click on a Contributor from the search result
        Then they see the "Add" Button is enabled

    Scenario: Creator adds a Contributor to the list of Contributors
        Given Creator selects a Contributor from search
        When they click the "Add" Button
        Then the Dialog is closed
        And the selected Contributor is added to the list of Contributors

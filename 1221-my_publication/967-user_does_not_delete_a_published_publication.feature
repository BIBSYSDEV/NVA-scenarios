Feature: User does not delete a published Publication

    @967
    Scenario: User does not delete a published Publication
        Given that the user is logged in as Creator
        And they open the My Publications page
        And they see the list of published Publications
        When they click Delete on an item
        And they see a confirmation pop-up asking to delete the Publication
        And they select No
        Then they see that the pop-up is closed

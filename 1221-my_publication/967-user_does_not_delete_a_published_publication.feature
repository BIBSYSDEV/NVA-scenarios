Feature: User does not delete a published Publication

    @967
    Scenario: User does not delete a published Publication
        Given that the user is logged in as Creator
        And they see the page My Publications
        And they click Published registrations in the navigation bar
        When they click Delete on an item
        And they se a confirmation pop-up asking to delete the Publication
        And they select No
        Then they see that the pop-up is closed

Feature: User deletes a published Publication

    @914
    Scenario: User deletes a published Publication
        Given that the user is logged in as Creator
        And they see the page My Publications
        And they click Published registrations in the navigation bar
        When they click Delete on an item
        And they see a confirmation pop-up asking to delete the Publication
        And they select Yes
        Then they see that the Publication is marked as deleted

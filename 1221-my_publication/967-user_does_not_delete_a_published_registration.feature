Feature: User does not delete a published Registration

    @TEST_NP-4123
    @967
    Scenario: User does not delete a published Registration
        Given that the user is logged in as Creator
        And they open the My Registrations page
        And they see the list of published Registrations
        When they click Delete on an item
        And they see a confirmation pop-up asking to delete the Registration
        And they select No
        Then they see that the pop-up is closed

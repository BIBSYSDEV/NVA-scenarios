Feature: User deletes a published Registration

    @TEST_NP-4122
    @914
    Scenario: User deletes a published Registration
        Given that the user is logged in as Creator
        And they see the page My Registrations
        And they click Published registrations in the navigation bar
        When they click Delete on an item
        And they see a confirmation pop-up asking to delete the Registration
        And they select Yes
        Then they see that the Registration is marked as deleted

Feature: Creator deletes an item in My Registrations list

    @TEST_NP-4118
    @test
    @356
    Scenario: Creator deletes an item in My Registrations list
        Given Creator opens My Registrations
        When they click Delete on an item
        And they see a confirmation pop-up is opened
        And they select Yes
        Then they see that the Registration is deleted
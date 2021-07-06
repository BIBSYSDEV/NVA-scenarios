Feature: Creator cancels deletion of an item in My Registrations list

    @test
    @576
    Scenario: Creator cancels deletion of an item in My Registrations list
        Given that the user is logged in as Creator
        And is on the My Registrations page
        When they click Delete on an item
        And they click No in the confirmation dialog
        Then they see the Registration in My Registrations list

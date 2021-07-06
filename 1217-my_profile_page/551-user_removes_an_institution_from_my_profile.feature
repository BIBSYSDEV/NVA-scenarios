Feature: User removes an Institution from My Profile

    @test
    @551
    Scenario: User removes an Institution from My Profile
        Given User sees an Institution from My Profile
        When they click Remove
        And they see a Remove affiliation dialog
        And the click on the Yes button
        Then they no longer see the institution from My Profile
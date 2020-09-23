Feature: User removes an Institution from My Profile

    @551
    Scenario: User removes an Institution from My Profile
        Given User adds an Institution from My Profile
        When they click Remove
        Then they see a Notification that the Institution is removed
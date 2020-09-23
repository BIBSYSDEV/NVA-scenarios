Feature: An Anonymous User selects a Hit

    @32
    Scenario: An Anonymous User selects a Hit
        Given that an Anonymous User searches for "Norway"
        When they click a Hit
        Then they see the Public Page for that Hit
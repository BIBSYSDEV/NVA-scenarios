Feature: Creator deletes an item in My Publications list

    @356
    Scenario: Creator deletes an item in My Publications list
        Given Creator opens My Publications
        When they click Delete on an item
        And they see a confirmation pop-up is opened
        And they select Yes
        Then they see that the Publication is deleted

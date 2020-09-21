Feature: Files with Administrative Agreement is not visible

    @1530
    Scenario: Files with Administrative Agreement is not visible
        Given a User views the Landing Page for a Publication
        And the Publication contains a File which is an Administrative Agreement
        When they see the Publication
        Then they see the File is not visible
Feature: Creator previews Publication

    @1531
    Scenario: Creator previews Publication
        Given that a Creator views a Publication
        And they navigate to the Submission tab
        When they click Save and Present
        Then they see the Landing Page for the Publication
        And they see a confirmation message that the Publication is saved